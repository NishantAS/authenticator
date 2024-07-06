import 'package:authenticator/core/constants/enums.dart';

sealed class FailureType {
  const FailureType();

  const factory FailureType.noNetwork() = NoNetwork;
  const factory FailureType.requestCancelled() = RequestCancelled;
  const factory FailureType.connectionError() = ConnectionError;
  const factory FailureType.networkTimeout(String operation) = NetworkTimout;

  const factory FailureType.server({
    required StatusCode statusCode,
  }) = Server;
}

final class Server extends FailureType {
  const Server({
    required this.statusCode,
  });

  final StatusCode statusCode;
}

final class NoNetwork extends FailureType {
  const NoNetwork();
}

final class RequestCancelled extends FailureType {
  const RequestCancelled();
}

final class ConnectionError extends FailureType {
  const ConnectionError();
}

final class NetworkTimout extends FailureType {
  const NetworkTimout(this.operation);
  final String operation;
}
