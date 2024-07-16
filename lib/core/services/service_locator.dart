import 'package:authenticator/bloc/auth/auth_bloc.dart';
import 'package:authenticator/core/network/dio_client.dart';
import 'package:authenticator/core/network/network_client.dart';
import 'package:authenticator/core/network/network_info.dart';
import 'package:authenticator/core/router/app_router.dart';
import 'package:authenticator/core/storage/local_storage.dart';
import 'package:authenticator/data/otp_code/datasources/otp_package_datasource.dart';
import 'package:authenticator/data/otp_code/datasources/secrets_local_datasource.dart';
import 'package:authenticator/data/otp_code/datasources/secrets_remote_datasource.dart';
import 'package:authenticator/data/otp_code/repositories/secrets_repository_impl.dart';
import 'package:authenticator/data/otp_code/repositories/totp_repository_impl.dart';
import 'package:authenticator/domain/otp_code/repositories/secrets_repository.dart';
import 'package:authenticator/domain/otp_code/repositories/totp_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';

part 'bloc.dart';
part 'core.dart';
part 'datasource.dart';
part 'repository.dart';

final sl = GetIt.asNewInstance();

Future<void> slInit() async {
  GetIt.noDebugOutput = kDebugMode;

  slInitBloc();
  slInitCore();
  slInitDatasource();
  slInitRepository();
  await sl.allReady();
}
