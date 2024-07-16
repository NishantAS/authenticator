import 'package:authenticator/bloc/auth/auth_bloc.dart';
import 'package:authenticator/core/router/app_router.dart';
import 'package:authenticator/core/storage/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

part 'core.dart';
part 'bloc.dart';

final sl = GetIt.asNewInstance();

Future<void> slInit() async {
  GetIt.noDebugOutput = kDebugMode;

  slInitCore();
  slInitBloc();
  await sl.allReady();
}
