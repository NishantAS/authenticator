import 'package:authenticator/app.dart';
import 'package:authenticator/bloc/custom_bloc_observer.dart';
import 'package:authenticator/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  slInit();
  runApp(const App());
}
