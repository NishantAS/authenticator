import 'package:authenticator/bloc/auth/auth_bloc.dart';
import 'package:authenticator/core/router/app_router.dart';
import 'package:auto_route/auto_route.dart';

class AuthRouteGuard implements AutoRouteGuard {
  final AuthBloc _auth;

  AuthRouteGuard({required AuthBloc auth}) : _auth = auth;

  @override
  void onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) {
    switch (_auth.state) {
      case Authenticated():
        resolver.next();
      default:
        resolver.redirect(
          LoginRoute(
            onLogin: () => resolver.resolveNext(true, reevaluateNext: false),
          ),
        );
    }
  }
}
