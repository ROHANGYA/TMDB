import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/presentation/router/navigation_paths.dart';

class MovieNavigationBar extends StatefulWidget {
  const MovieNavigationBar({super.key});

  @override
  State<MovieNavigationBar> createState() => _MovieNavigationBarState();
}

class _MovieNavigationBarState extends State<MovieNavigationBar> {
  final navDestinations = [
    NavigationDestination(
      icon: const Icon(Icons.home_outlined),
      label: strings.home,
    ),
    NavigationDestination(
      icon: const Icon(Icons.search_rounded, size: 29),
      label: strings.search,
    ),
    NavigationDestination(
      icon: const Icon(Icons.settings_rounded),
      label: strings.settings,
    )
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
              switch (index) {
                case 0:
                  context.go(NavigationPaths.home);
                  break;
                case 1:
                  context.go(NavigationPaths.search);
                  break;
                case 2:
                  context.go(NavigationPaths.settings);
                  break;
                default:
                  context.go(NavigationPaths.home);
                  break;
              }
            },
            selectedIndex: _calculateSelectedIndex,
            destinations: navDestinations,
          ),
        ));
  }

  int get _calculateSelectedIndex {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(NavigationPaths.home)) {
      return 0;
    }
    if (location.startsWith(NavigationPaths.search)) {
      return 1;
    }
    if (location.startsWith(NavigationPaths.settings)) {
      return 2;
    }
    return 0;
  }
}
