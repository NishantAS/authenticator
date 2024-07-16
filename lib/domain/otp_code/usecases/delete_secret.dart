import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/helpers/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/secrets_repository.dart';

class DeleteSecret implements Usecase<AppFailure, bool, DeleteSecretParams> {
  final SecretsRepository _repository;

  const DeleteSecret({required SecretsRepository repository})
      : _repository = repository;

  @override
  FutureOr<Either<AppFailure, bool>> call(DeleteSecretParams params) =>
      _repository.deleteSecret(params.id);
}

class DeleteSecretParams extends Equatable {
  final String id;

  const DeleteSecretParams(this.id);

  @override
  List<Object?> get props => [id];
}
