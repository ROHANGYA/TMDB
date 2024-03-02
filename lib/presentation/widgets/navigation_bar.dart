import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

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
            },
            selectedIndex: currentPageIndex,
            destinations: navDestinations,
          ),
        ));
  }
}
