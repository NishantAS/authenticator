import 'dart:async';

import 'package:authenticator/core/failure/app_failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/secret.dart';

abstract class TotpRepository {
  FutureOr<Either<AppFailure, int>> genTotp(Secret secret);
}
