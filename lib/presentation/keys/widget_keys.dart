import 'package:flutter/material.dart';

abstract class WidgetKeys {
  static Key mainNavigationBarKey = const Key('MainNavigationBarKey');
  static GlobalKey rootScaffoldKey =
      GlobalKey(debugLabel: 'SettingsScaffoldKey');
  static GlobalKey settingsScaffoldKey =
      GlobalKey(debugLabel: 'SettingsScaffoldKey');
  static const Key genericErrorWidgetKey = Key('GenericErrorWidget');
// TODO >> add keys for all widgets defined in widgets dir.
}
