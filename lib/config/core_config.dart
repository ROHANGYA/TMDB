import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/config/base_config.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/presentation/router/router_config.dart';
import 'package:tmdb/themes.dart';

class CoreConfig implements BaseConfig {
  @override
  String appName() => 'T M D B';

  @override
  Map<String, String> endpoints() => <String, String>{
        'baseUrl': const String.fromEnvironment('BASE_URL',
            defaultValue: ApiUrl.baseUrl)
      };

  @override
  List<Locale> supportedLocales() => S.delegate.supportedLocales;

  @override
  GoRouter routeConfig() => goRouterConfig;

  @override
  ThemeData lightTheme() {
    return Themes.mainLightTheme;
  }

  @override
  ThemeData darkTheme() {
    return Themes.mainDarkTheme;
  }
}
