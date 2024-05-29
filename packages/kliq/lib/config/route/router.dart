import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:kliq/app_setup/controller/app_state_observer.dart';
import 'package:kliq/config/error_screen.dart';
import 'package:kliq/config/route/paths.dart';
import 'package:kliq/features/auth/presentation/login/login_screen.dart';
import 'package:kliq/features/welcome/presentation/welcome_screen.dart';

class AppRouter {
  static final key = GlobalKey<NavigatorState>();
  static final router = GoRouter(
    initialLocation: Paths.loginScreenRoute.path,
    navigatorKey: key,
    routes: [
      GoRoute(
        path: Paths.appStateObserver.path,
        name: Paths.appStateObserver.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey, child: const AppStateObserver()),
      ),
      GoRoute(
        path: Paths.loginScreenRoute.path,
        name: Paths.loginScreenRoute.routeName,
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
    redirect: (BuildContext context, GoRouterState state) async {
      return null;
    },
    debugLogDiagnostics: kDebugMode,
  );
}

/// The `FadeTransitionPage` class is a custom transition page that applies a fade animation to its
/// child widget.
class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (c, animation, a2, child) => FadeTransition(
            opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
            child: child,
          ),
        );
}
