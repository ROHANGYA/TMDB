// GoRouter configuration
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/presentation/router/navigation_paths.dart';
import 'package:tmdb/presentation/screens/home_screen.dart';
import 'package:tmdb/presentation/screens/root_scaffold.dart';
import 'package:tmdb/presentation/screens/search_screen.dart';
import 'package:tmdb/presentation/screens/settings_screen.dart';

final goRouterConfig = GoRouter(
  initialLocation: NavigationPaths.home,
  routes: [
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return RootScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: NavigationPaths.home,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            path: NavigationPaths.search,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const SearchScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
          GoRoute(
            path: NavigationPaths.settings,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const SettingsScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc)
                        .animate(animation),
                    child: child,
                  );
                },
              );
            },
          ),
        ]),
    GoRoute(
      path: NavigationPaths.error,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/test',
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);
