part of 'service_locator.dart';

void slInitUsecase() {
  sl.registerLazySingleton(() => GetSecrets(repository: sl()));
  sl.registerLazySingleton(() => GetSecret(repository: sl()));
  sl.registerLazySingleton(() => SaveSecret(repository: sl()));
  sl.registerLazySingleton(() => UpdateSecret(repository: sl()));
  sl.registerLazySingleton(() => DeleteSecret(repository: sl()));

  sl.registerLazySingleton(() => GenerateTotp(repository: sl()));
}
