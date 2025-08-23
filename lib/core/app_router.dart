// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/features/auth/presentation/screens/auth_screen.dart';
import 'package:myapp/features/role_selection/presentation/screens/role_selection_screen.dart';

/// Enhanced enum for all app routes.
enum AppRoute {
  roleSelection(path: '/role-selection', widget: RoleSelectionScreen()),
  auth(path: '/auth', widget: AuthScreen()),
  ;

  /// The path for the route.
  final String path;

  /// The widget to display for the route.
  final Widget widget;

  const AppRoute({required this.path, required this.widget});
}

/// Extension to convert [AppRoute] to [GoRoute].
extension AppRouteGoRoute on AppRoute {
  GoRoute toGoRoute() => GoRoute(
    path: path,
    builder: (context, state) => widget,
  );
}

/// The global [GoRouter] instance for the application.
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoute.roleSelection.path,
  routes: [
    AppRoute.roleSelection.toGoRoute(),
    AppRoute.auth.toGoRoute(),
  ],
);
