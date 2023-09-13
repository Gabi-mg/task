import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/ui/screens/screens.dart';

class RoutePath {
  static String home() => '/';
}

List<GoRoute> allAppRoutes = [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) => _transition(
      context,
      state,
      const HomePage(),
    ),
  )
];

Page<dynamic> _transition(
  BuildContext context,
  GoRouterState state,
  Widget page,
) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
