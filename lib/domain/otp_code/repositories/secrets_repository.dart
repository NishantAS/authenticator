import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/domain/otp_code/entities/secret_partial_template.dart';
import 'package:dartz/dartz.dart';

import '../entities/secret.dart';
import '../entities/secret_template.dart';

abstract class SecretsRepository {
  FutureOr<Either<AppFailure, Iterable<Secret>>> getSecrets();
  FutureOr<Either<AppFailure, Secret>> getSecret(String id);
  FutureOr<Either<AppFailure, String>> saveSecret(SecretTemplate secret);
  FutureOr<Either<AppFailure, bool>> updateSecret(
      String id, SecretPartialTemplate secret);
  FutureOr<Either<AppFailure, bool>> deleteSecret(String id);
}
