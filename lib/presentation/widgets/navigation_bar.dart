import 'package:flutter/material.dart';

class MovieNavigationBar extends StatelessWidget {
  const MovieNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              // setState(() {
              //   currentPageIndex = index;
              // });
            },
            selectedIndex: 0,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_rounded, size: 29),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_rounded),
                label: 'Settings',
              ),
            ],
          ),
        ));
  }
}
