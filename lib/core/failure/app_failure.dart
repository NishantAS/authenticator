import 'failure_type.dart';

class AppFailure {
  final FailureType failureType;
  final Error? error;
  final StackTrace? stackTrace;
  final String errorMessage;

  AppFailure({
    required this.failureType,
    this.error,
    this.stackTrace,
    required this.errorMessage,
  });

}
