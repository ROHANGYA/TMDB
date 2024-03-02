import 'package:flutter/material.dart';
import 'package:tmdb/presentation/widgets/navigation_bar.dart';

class RootScaffold extends StatelessWidget {
  const RootScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: const MovieNavigationBar(),
      body: child,
    );
  }
}
