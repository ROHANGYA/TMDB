import 'package:flutter/material.dart';
import 'package:tmdb/presentation/keys/widget_keys.dart';
import 'package:tmdb/presentation/widgets/navigation_bar.dart';

class RootScaffold extends StatelessWidget {
  const RootScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.rootScaffoldKey,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: MovieNavigationBar(
        key: WidgetKeys.mainNavigationBarKey,
      ),
      body: child,
    );
  }
}
