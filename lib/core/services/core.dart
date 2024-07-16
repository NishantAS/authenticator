part of 'service_locator.dart';

void slInitCore() {
  sl.registerSingleton(GlobalKey<NavigatorState>());
  sl.registerLazySingleton(() => AppRouter(navigatorKey: sl()));
  sl.registerSingletonAsync(
    () => getApplicationDocumentsDirectory(),
    instanceName: "Hive.defaultDirectory",
  );
  sl.registerSingleton(const LocalStorage());
}
