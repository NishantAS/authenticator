part of 'service_locator.dart';

void slInitCore() {
  sl.registerSingleton(GlobalKey<NavigatorState>());
  sl.registerLazySingleton(() => AppRouter(navigatorKey: sl()));
  sl.registerSingletonAsync(
    () async => LocalStorage(await getApplicationDocumentsDirectory()),
  );
}
