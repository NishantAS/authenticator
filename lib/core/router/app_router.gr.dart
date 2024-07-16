// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(
          key: args.key,
          onLogin: args.onLogin,
        ),
      );
    },
    OtpCodeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<OtpCodeRouteArgs>(
          orElse: () => OtpCodeRouteArgs(id: pathParams.getString('secret')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpCodeScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    OtpCodesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OtpCodesScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpScreen(
          key: args.key,
          onSignup: args.onSignup,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required void Function() onLogin,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onLogin: onLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onLogin,
  });

  final Key? key;

  final void Function() onLogin;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLogin: $onLogin}';
  }
}

/// generated route for
/// [OtpCodeScreen]
class OtpCodeRoute extends PageRouteInfo<OtpCodeRouteArgs> {
  OtpCodeRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          OtpCodeRoute.name,
          args: OtpCodeRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'secret': id},
          initialChildren: children,
        );

  static const String name = 'OtpCodeRoute';

  static const PageInfo<OtpCodeRouteArgs> page =
      PageInfo<OtpCodeRouteArgs>(name);
}

class OtpCodeRouteArgs {
  const OtpCodeRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'OtpCodeRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [OtpCodesScreen]
class OtpCodesRoute extends PageRouteInfo<void> {
  const OtpCodesRoute({List<PageRouteInfo>? children})
      : super(
          OtpCodesRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpCodesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    Key? key,
    required void Function() onSignup,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(
            key: key,
            onSignup: onSignup,
          ),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<SignUpRouteArgs> page = PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({
    this.key,
    required this.onSignup,
  });

  final Key? key;

  final void Function() onSignup;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, onSignup: $onSignup}';
  }
}
