import 'package:authenticator/presentation/auth/pages/login_screen.dart';
import 'package:authenticator/presentation/auth/pages/sign_up_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/signUp',
        ),
      ];
}
