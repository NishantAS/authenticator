import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Usecase<Failure, Type, Params> {
  FutureOr<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
