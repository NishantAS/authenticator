part of 'service_locator.dart';

void slInitBloc() {
  sl.registerFactory(() => AuthBloc(const AuthState.authenticated()));
}
