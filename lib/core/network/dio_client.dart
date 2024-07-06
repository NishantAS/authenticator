import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:authenticator/core/constants/enums.dart';
import 'package:authenticator/core/constants/strings.dart';
import 'package:authenticator/core/failure/app_exception.dart';
import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/failure/failure_type.dart';
import 'package:authenticator/core/network/network_client.dart';
import 'package:authenticator/core/router/app_router.dart';
import 'package:authenticator/core/services/service_locator.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' hide Response;
import 'package:dio/dio.dart' as dio show Response;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class DioRequestToken implements RequestToken {
  final CancelToken _cancelToken;

  const DioRequestToken(this._cancelToken);

  @override
  void cancel() => _cancelToken.cancel();

  @override
  bool get isCancelled => _cancelToken.isCancelled;
}

class DioResponse implements Response {
  final dio.Response<dynamic> response;

  DioResponse(this.response);

  @override
  dynamic get data => response.data;

  @override
  Map<String, List<String>> get header => response.headers.map;

  @override
  List<Redirect> get redirects => response.redirects
      .map(
        (redirect) => Redirect(
          statusCode,
          NetworkMethod.values.singleWhere(
            (method) => method.name == redirect.method.toLowerCase(),
          ),
          redirect.location,
        ),
      )
      .toList();

  @override
  StatusCode get statusCode => StatusCode.fromInt(response.statusCode ?? -1);
}

class DioClient implements NetworkClient<DioRequestToken, DioResponse> {
  static const connectTimeout = Duration(seconds: 10);
  static const receiveTimeout = Duration(seconds: 10);

  final Dio _dio;
  final PersistCookieJar _persistCookieJar;

  DioClient({
    required Dio dio,
    required PersistCookieJar persistCookieJar,
  })  : _dio = dio,
        _persistCookieJar = persistCookieJar {
    _initDioParams();
  }

  @override
  Future<DioResponse> deleteUri({
    required Uri uri,
    dynamic body,
    DioRequestToken? requestToken,
  }) =>
      _tryCatchRequest(() => _dio.deleteUri<dio.Response<dynamic>>(
            uri,
            data: body,
            cancelToken: requestToken?._cancelToken,
          ));

  @override
  Future<DioResponse> downlaodUri({
    required Uri uri,
    body,
    required String filePath,
    DioRequestToken? requestToken,
    void Function(int recevied, int total)? receiveProgess,
  }) =>
      _tryCatchRequest(() => _dio.downloadUri(
            uri,
            filePath,
            cancelToken: requestToken?._cancelToken,
            onReceiveProgress: receiveProgess,
          ));

  @override
  FormData formDataFromMap({required Map<String, dynamic> body}) =>
      FormData.fromMap(body);

  @override
  Future<DioResponse> getUri({
    required Uri uri,
    DioRequestToken? requestToken,
  }) =>
      _tryCatchRequest(() => _dio.getUri<dio.Response<dynamic>>(
            uri,
            cancelToken: requestToken?._cancelToken,
          ));

  @override
  Future<dynamic> multipartFileFromFile({required String path}) =>
      MultipartFile.fromFile(path);

  @override
  Future<DioResponse> patchUri({
    required Uri uri,
    dynamic body,
    DioRequestToken? requestToken,
  }) =>
      _tryCatchRequest(() => _dio.patchUri<dio.Response<dynamic>>(
            uri,
            data: body,
            cancelToken: requestToken?._cancelToken,
          ));

  @override
  Future<DioResponse> postUri({
    required Uri uri,
    dynamic body,
    DioRequestToken? requestToken,
  }) =>
      _tryCatchRequest(() => _dio.postUri<dio.Response<dynamic>>(
            uri,
            data: body,
            cancelToken: requestToken?._cancelToken,
          ));

  @override
  Future<DioResponse> putUri({
    required Uri uri,
    dynamic body,
    DioRequestToken? requestToken,
  }) =>
      _tryCatchRequest(() => _dio.putUri<dio.Response<dynamic>>(
            uri,
            data: body,
            cancelToken: requestToken?._cancelToken,
          ));

  Future<void> _errorInterceptor(
    DioException exception,
    ErrorInterceptorHandler handler,
  ) async {
    log("Network ${exception.type.toString()} error from ${exception.requestOptions.uri}");
    log("Data : ${exception.response?.data}");
    log("${exception.response?.statusCode} | Method : ${exception.requestOptions.method}");

    return handler.next(exception);
  }

  void _initDioParams() {
    _dio
      ..options = BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        persistentConnection: true,
      )
      ..interceptors.add(CookieManager(_persistCookieJar))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: _requestInterceptor,
          onResponse: _responseInterceptor,
          onError: _errorInterceptor,
        ),
      );
  }

  Never _processException(DioException exception) {
    throw switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        AppException(
          appFailure: AppFailure(
            failureType: FailureType.networkTimeout(exception.type.name),
            errorMessage: exception.message.toString(),
            stackTrace: exception.stackTrace,
          ),
        ),
      DioExceptionType.badCertificate => UnimplementedError(),
      DioExceptionType.badResponse => AppException(
          appFailure: AppFailure(
            errorMessage:
                ((exception.response?.data as Map?)?["message"] as String?) ??
                    exception.message ??
                    "No error message available",
            error: exception.error as Error?,
            stackTrace: exception.stackTrace,
            failureType: FailureType.server(
              statusCode: StatusCode.fromInt(exception.response!.statusCode!),
            ),
          ),
        ),
      DioExceptionType.cancel => AppException(
          appFailure: AppFailure(
            failureType: const FailureType.requestCancelled(),
            errorMessage:
                exception.error?.toString() ?? exception.message.toString(),
            stackTrace: exception.stackTrace,
          ),
        ),
      DioExceptionType.connectionError => AppException(
          appFailure: AppFailure(
            failureType: const FailureType.connectionError(),
            errorMessage: exception.message ?? "Connection Error",
            stackTrace: exception.stackTrace,
          ),
        ),
      DioExceptionType.unknown => AppException(
          appFailure: AppFailure(
            failureType: const FailureType.connectionError(),
            errorMessage: exception.message ?? "Unknow Dio exception",
            error: exception.error as Error?,
            stackTrace: exception.stackTrace,
          ),
        ),
    };
  }

  Future<void> _requestInterceptor(
    RequestOptions requestOptions,
    RequestInterceptorHandler handler,
  ) async {
    log("Requesting ${requestOptions.uri}");

    List<Cookie> cookies =
        await _persistCookieJar.loadForRequest(requestOptions.uri);
    requestOptions.headers[HttpHeaders.cookieHeader] = cookies;

    log("Headers : ${requestOptions.headers}");
    log("Data : ${requestOptions.data}");

    return handler.next(requestOptions);
  }

  void _responseInterceptor(
      dio.Response<dynamic> response, ResponseInterceptorHandler handler) {
    log("Response ${response.statusCode} from ${response.realUri}");
    log("Headers : ${response.headers}");
    log("Data : ${response.data}");

    if (response.isRedirect && response.realUri.authority == kDomain) {
      sl<AppRouter>().pushNamed(
        response.realUri.path,
        onFailure: (failure) => log(failure.toString()),
      );
    }

    return handler.next(response);
  }

  Future<DioResponse> _tryCatchRequest(
      Future<dio.Response<dynamic>> Function() request) {
    try {
      return request().then((response) => DioResponse(response));
    } on DioException catch (e) {
      _processException(e);
    }
  }
}
