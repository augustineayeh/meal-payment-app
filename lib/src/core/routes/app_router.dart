
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/pages.dart';
import 'route_consts.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      //* Login
      GoRoute(
        path: RouteConsts.loginRoute,
        name: RouteConsts.loginRoute,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: LoginScreen(),
          );
        },
      ),
      //* Signup
      GoRoute(
        path: RouteConsts.signupRoute,
        name: RouteConsts.signupRoute,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: SignupScreen(),
          );
        },
      ),
    ],
  );
}
