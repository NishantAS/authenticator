import 'package:authenticator/core/constants/strings.dart';
import 'package:authenticator/core/router/app_router.dart';
import 'package:authenticator/core/router/custom_navigator_observer.dart';
import 'package:authenticator/core/services/service_locator.dart';
import 'package:authenticator/core/style/theme.dart';
import 'package:authenticator/core/style/util.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final theme = MaterialTheme(createTextTheme(
      context,
      kBodyFont,
      kDisplayFont,
    ));
    return MaterialApp.router(
      routerConfig: sl<AppRouter>().config(
        navigatorObservers: () => [CustomNavigatorObserver()],
      ),
      themeMode: MaterialTheme.themeMode,
      theme: theme.light(),
      darkTheme: theme.dark(),
      highContrastTheme: theme.lightHighContrast(),
      highContrastDarkTheme: theme.darkHighContrast(),
    );
  }
}
