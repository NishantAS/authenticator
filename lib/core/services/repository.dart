part of 'service_locator.dart';

void slInitRepository() {
  sl.registerLazySingleton<SecretsRepository>(
    () => SecretsRepositoryImpl(
      networkInfo: sl(),
      localDatasource: sl(),
      remoteDatasource: sl(),
    ),
  );

  sl.registerLazySingleton<TotpRepository>(
    () => TotpRepositoryImpl(otpPackageDatasource: sl()),
  );
}
