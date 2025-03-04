import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_x_rocket_launches/screens/home_screen.dart';
import 'package:space_x_rocket_launches/screens/splash_screen.dart';

GoRouter appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
  path: '/',
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const SplashScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity:
              CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  },
),
  GoRoute(
  path: '/home',
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity:
              CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  },
),
 
 
]);
