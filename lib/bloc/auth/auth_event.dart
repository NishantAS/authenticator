part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  const factory AuthEvent.login() = _AuthUserLogin;
  const factory AuthEvent.logout() = _AuthUserLogout;
}

class _AuthUserLogin extends AuthEvent {
  const _AuthUserLogin();

  @override
  List<Object> get props => [];
}

class _AuthUserLogout extends AuthEvent {
  const _AuthUserLogout();

  @override
  List<Object> get props => [];
}
