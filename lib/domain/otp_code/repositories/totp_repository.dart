import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:authenticator/domain/otp_code/entities/secret.dart';
import 'package:dartz/dartz.dart';

abstract class TotpRepository {
  FutureOr<Either<AppFailure, int>> genTotp(Secret secret);
}
