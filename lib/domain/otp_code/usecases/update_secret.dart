import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/helpers/usecase.dart';
import 'package:authenticator/domain/otp_code/entities/secret_partial_template.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repositories/secrets_repository.dart';

class UpdateSecret implements Usecase<AppFailure, bool, UpdateSecretParams> {
  final SecretsRepository _repository;

  const UpdateSecret({required SecretsRepository repository})
      : _repository = repository;

  @override
  FutureOr<Either<AppFailure, bool>> call(UpdateSecretParams params) =>
      _repository.updateSecret(params.id, params.partialTemplate);
}

class UpdateSecretParams extends Equatable {
  final String id;
  final SecretPartialTemplate partialTemplate;

  const UpdateSecretParams({required this.id, required this.partialTemplate});

  @override
  List<Object?> get props => [id, partialTemplate];
}
