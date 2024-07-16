import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:authenticator/domain/otp_code/repositories/totp_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/otp_package_datasource.dart';

class TotpRepositoryImpl implements TotpRepository {
  final OtpPackageDatasource _otpPackageDatasource;

  const TotpRepositoryImpl({required OtpPackageDatasource otpPackageDatasource})
      : _otpPackageDatasource = otpPackageDatasource;

  @override
  FutureOr<Either<AppFailure, int>> genTotp(Secret secret) =>
      right(_otpPackageDatasource.genTotp(secret));
}
