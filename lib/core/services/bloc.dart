part of 'service_locator.dart';

void slInitBloc() {
  sl.registerFactory(() => AuthBloc(const AuthState.authenticated()));

  sl.registerFactory(
    () => SecretsBloc(
      getSecrets: sl(),
      getSecret: sl(),
      saveSecret: sl(),
      updateSecret: sl(),
      deleteSecret: sl(),
    ),
  );
  sl.registerFactory(() => OtpCodeBloc(generateTotp: sl()));
}
