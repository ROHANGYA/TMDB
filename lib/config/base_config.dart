import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class BaseConfig {
  String appName();

  Map<String, String> endpoints();

  List<Locale> supportedLocales();

  GoRouter routeConfig();

  ThemeData lightTheme();

  ThemeData darkTheme();
}
