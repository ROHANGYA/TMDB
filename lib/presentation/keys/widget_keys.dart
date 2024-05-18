import 'package:flutter/material.dart';

abstract class WidgetKeys {
  static Key mainNavigationBarKey = const Key('MainNavigationBarKey');
  static Key homeNavigationBarKey = const Key('HomeNavigationBarKey');
  static Key searchNavigationBarKey = const Key('SearchNavigationBarKey');
  static Key settingsNavigationBarKey = const Key('SettingsNavigationBarKey');
  static GlobalKey rootScaffoldKey = GlobalKey(debugLabel: 'RootScaffoldKey');
  static GlobalKey searchScaffoldKey =
      GlobalKey(debugLabel: 'SearchScaffoldKey');
  static GlobalKey settingsScaffoldKey =
      GlobalKey(debugLabel: 'SettingsScaffoldKey');
  static GlobalKey detailsScaffoldKey =
      GlobalKey(debugLabel: 'DetailsScaffoldKey');
  static const Key genericErrorWidgetKey = Key('GenericErrorWidget');
  static const Key homeScreenListView = Key('HomeScreenListView');
  static const Key homeScreenFeaturedMoviesList =
      Key('HomeScreenFeaturedMoviesList');
  static const Key homeScreenUpcomingMoviesList =
      Key('HomeScreenUpcomingMoviesList');
  static const Key homeToolbarSearchIcon = Key('HomeToolbarSearchIcon');
  static const Key homeSearchBarShortcut = Key('HomeSearchBarShortcut');

  static const Key movieCardKeyPrefix = Key('MovieCard:');
// TODO >> add keys for all widgets defined in widgets dir.
}
