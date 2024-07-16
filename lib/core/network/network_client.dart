import 'dart:async';

import 'package:authenticator/core/constants/enums.dart';

abstract class RequestToken {
  void cancel();
  bool get isCancelled;
}

class Redirect {
  const Redirect(this.statusCode, this.method, this.location);

  final StatusCode statusCode;
  final NetworkMethod method;
  final Uri location;
}

abstract class Response {
  final dynamic data;
  final StatusCode statusCode;
  final Map<String, List<String>> header;
  final List<Redirect> redirects;

  Response({
    required this.data,
    required this.statusCode,
    required this.header,
    required this.redirects,
  });
}

abstract class NetworkClient<T1 extends RequestToken, T2 extends Response> {
  Future<T2> deleteUri({
    required Uri uri,
    dynamic body,
    T1? requestToken,
  });

  Future<T2> downlaodUri({
    required Uri uri,
    dynamic body,
    required String filePath,
    T1? requestToken,
    void Function(int count, int total)? receiveProgess,
  });

  dynamic formDataFromMap({required Map<String, dynamic> body});

  Future<T2> getUri({
    required Uri uri,
    T1? requestToken,
    void Function(int count, int total)? receiveProgess,
  });

  Future<dynamic> multipartFileFromFile({required String path});

  Future<T2> patchUri({
    required Uri uri,
    dynamic body,
    T1? requestToken,
    void Function(int count, int total)? sendProgress,
    void Function(int count, int total)? receiveProgess,
  });

  Future<T2> postUri({
    required Uri uri,
    dynamic body,
    T1? requestToken,
    void Function(int count, int total)? sendProgress,
    void Function(int count, int total)? receiveProgess,
  });

  Future<T2> putUri({
    required Uri uri,
    dynamic body,
    T1? requestToken,
    void Function(int count, int total)? sendProgress,
    void Function(int count, int total)? receiveProgess,
  });
}
