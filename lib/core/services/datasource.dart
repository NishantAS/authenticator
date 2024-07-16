part of 'service_locator.dart';

void slInitDatasource() {
  sl.registerLazySingleton<SecretsLocalDatasource>(
    () => SecretsLocalDatasourceImpl(localStorage: sl()),
  );
  sl.registerLazySingleton<SecretsRemoteDatasource>(
    () => SecretsRemoteDatasourceImpl(networkClient: sl()),
  );

  sl.registerSingleton<OtpPackageDatasource>(OtpPackageDatasourceImpl());
}
