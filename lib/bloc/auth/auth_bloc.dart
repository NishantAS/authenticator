import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(super.initialState) {
    on<_AuthUserLogin>(_onAuthUserLogin);
  }

  final _AuthNotifier _auth = _AuthNotifier();

  ChangeNotifier get auth => _auth;

  Future<void> _onAuthUserLogin(
    _AuthUserLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    await Future.delayed(const Duration(seconds: 2), () {});
    emit(const AuthState.authenticated());
    await Future.delayed(const Duration(seconds: 2), () {});
    emit(const AuthState.loading());
    await Future.delayed(const Duration(seconds: 2), () {});
    emit(const AuthState.unAuthenticated());
    await Future.delayed(const Duration(seconds: 2), () {});
    emit(const AuthState.loading());
    await Future.delayed(const Duration(seconds: 2), () {});
    emit(const AuthState.authenticated());
    await Future.delayed(const Duration(seconds: 2), () {});
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    _auth.onChange();
  }
}

class _AuthNotifier extends ChangeNotifier {
  void onChange() {
    notifyListeners();
  }
}
