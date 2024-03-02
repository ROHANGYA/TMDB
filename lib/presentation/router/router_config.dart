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
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: NavigationPaths.search,
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: NavigationPaths.settings,
            builder: (context, state) => const SettingsScreen(),
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
