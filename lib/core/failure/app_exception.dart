import 'package:authenticator/core/failure/app_failure.dart';

class AppException implements Exception {
  final AppFailure appFailure;

  AppException({required this.appFailure});
}
