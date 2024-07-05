part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  const factory AuthState.loading() = Loading;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unAuthenticated() = UnAuthenticated;
  const factory AuthState.error() = AuthError;
}

class Loading extends AuthState {
  const Loading();

  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  const Authenticated();

  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState {
  const UnAuthenticated();

  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  const AuthError();

  @override
  List<Object?> get props => [];
}
