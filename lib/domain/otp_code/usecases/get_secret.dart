import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/helpers/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/secret.dart';
import '../repositories/secrets_repository.dart';

class GetSecret implements Usecase<AppFailure, Secret, GetSecretParams> {
  final SecretsRepository _repository;

  const GetSecret({required SecretsRepository repository})
      : _repository = repository;

  @override
  FutureOr<Either<AppFailure, Secret>> call(GetSecretParams params) =>
      _repository.getSecret(params.id);
}

class GetSecretParams extends Equatable {
  final String id;

  const GetSecretParams({required this.id});

  @override
  List<Object?> get props => [id];
}
