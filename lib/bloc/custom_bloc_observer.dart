import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver implements BlocObserver {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    log("${bloc.runtimeType}with hash ${bloc.hashCode} event: $event");
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log(
      "${bloc.runtimeType} error with hash ${bloc.hashCode}",
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log("Bloc: ${bloc.runtimeType} with has ${bloc.hashCode} change\nFrom: ${change.currentState}\nTo: ${change.nextState}");
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    log("${bloc.runtimeType} $transition");
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    log("Bloc: ${bloc.runtimeType} with hash ${bloc.hashCode} closed!");
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    log("Bloc: ${bloc.runtimeType} created with hash ${bloc.hashCode}");
  }
}
