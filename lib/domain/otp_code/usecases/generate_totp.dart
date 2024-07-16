import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/core/helpers/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/secret.dart';
import '../repositories/totp_repository.dart';

class GenerateTotp extends Usecase<AppFailure, int, GenerateTotpParams> {
  final TotpRepository repository;

  GenerateTotp({required this.repository});

  @override
  FutureOr<Either<AppFailure, int>> call(GenerateTotpParams params) =>
      repository.genTotp(params.secret);
}

class GenerateTotpParams extends Equatable {
  final Secret secret;

  const GenerateTotpParams({required this.secret});

  @override
  List<Object?> get props => [secret];
}
