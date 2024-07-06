import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:dartz/dartz.dart';

abstract class SecretsRepository {
  FutureOr<Either<AppFailure, Iterable<Secret>>> getSecrets();
  FutureOr<Either<AppFailure, void>> saveSecret(Secret secret);
  FutureOr<Either<AppFailure, void>> deleteSecret(Secret secret);
  FutureOr<Either<AppFailure, void>> syncWithRemote();
}
