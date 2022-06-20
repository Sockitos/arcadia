import 'package:arcadia_app/screens/slideshow_screen.dart';
import 'package:arcadia_app/screens/start_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const StartScreen(),
    ),
    GoRoute(
      path: '/slideshow',
      builder: (BuildContext context, GoRouterState state) =>
          const SlideshowScreen(),
    ),
  ],
);
