import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/helpers/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/secret_template.dart';
import '../repositories/secrets_repository.dart';

class SaveSecret implements Usecase<AppFailure, String, SaveSecretParams> {
  final SecretsRepository _repository;

  const SaveSecret({required SecretsRepository repository})
      : _repository = repository;

  @override
  FutureOr<Either<AppFailure, String>> call(SaveSecretParams params) =>
      _repository.saveSecret(params.secret);
}

class SaveSecretParams extends Equatable {
  final SecretTemplate secret;

  const SaveSecretParams(this.secret);

  @override
  List<Object?> get props => [secret];
}
