import 'package:authenticator/bloc/custom_bloc_observer.dart';
import 'package:authenticator/core/services/service_locator.dart';
import 'package:authenticator/core/storage/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await slInit();
  initHive();
  runApp(const App());
}
