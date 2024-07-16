import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/helpers/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/secret.dart';
import '../repositories/secrets_repository.dart';

class GetSecrets implements Usecase<AppFailure, Iterable<Secret>, NoParams> {
  final SecretsRepository _repository;

  const GetSecrets({required SecretsRepository repository})
      : _repository = repository;

  @override
  FutureOr<Either<AppFailure, Iterable<Secret>>> call(NoParams params) =>
      _repository.getSecrets();
}
