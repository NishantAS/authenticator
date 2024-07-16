import 'package:authenticator/bloc/auth/auth_bloc.dart';
import 'package:authenticator/core/constants/strings.dart';
import 'package:authenticator/core/router/app_router.dart';
import 'package:authenticator/core/router/custom_navigator_observer.dart';
import 'package:authenticator/core/services/service_locator.dart';
import 'package:authenticator/core/style/theme.dart';
import 'package:authenticator/core/style/util.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = MaterialTheme(createTextTheme(
      context,
      kBodyFont,
      kDisplayFont,
    ));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: sl<AppRouter>().config(
        navigatorObservers: () => [CustomNavigatorObserver()],
        reevaluateListenable: sl<AuthBloc>().auth,
      ),
      themeMode: MaterialTheme.themeMode,
      theme: theme.light(),
      darkTheme: theme.dark(),
      highContrastTheme: theme.lightHighContrast(),
      highContrastDarkTheme: theme.darkHighContrast(),
    );
  }
}
