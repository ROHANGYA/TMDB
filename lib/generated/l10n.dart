// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `tmdb`
  String get tmdb {
    return Intl.message(
      'tmdb',
      name: 'tmdb',
      desc: '',
      args: [],
    );
  }

  /// `The Movie Database`
  String get theMovieDatabase {
    return Intl.message(
      'The Movie Database',
      name: 'theMovieDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Featured Movies`
  String get featuredMovies {
    return Intl.message(
      'Featured Movies',
      name: 'featuredMovies',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon ...`
  String get comingSoon {
    return Intl.message(
      'Coming Soon ...',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `An Error has Occurred !`
  String get errorHasOccurred {
    return Intl.message(
      'An Error has Occurred !',
      name: 'errorHasOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `View More ➜`
  String get viewMore {
    return Intl.message(
      'View More ➜',
      name: 'viewMore',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Search for Movies and more`
  String get searchMovies {
    return Intl.message(
      'Search for Movies and more',
      name: 'searchMovies',
      desc: '',
      args: [],
    );
  }

  /// `Loading Failed`
  String get loadingFailed {
    return Intl.message(
      'Loading Failed',
      name: 'loadingFailed',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Asc.`
  String get ascendingAbbreviated {
    return Intl.message(
      'Asc.',
      name: 'ascendingAbbreviated',
      desc: '',
      args: [],
    );
  }

  /// `Desc.`
  String get descendingAbbreviated {
    return Intl.message(
      'Desc.',
      name: 'descendingAbbreviated',
      desc: '',
      args: [],
    );
  }

  /// `Popularity`
  String get popularity {
    return Intl.message(
      'Popularity',
      name: 'popularity',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Release Date`
  String get releaseDate {
    return Intl.message(
      'Release Date',
      name: 'releaseDate',
      desc: '',
      args: [],
    );
  }

  /// `You can search for movies using the search bar above`
  String get searchMoviePrompt {
    return Intl.message(
      'You can search for movies using the search bar above',
      name: 'searchMoviePrompt',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResultsFound {
    return Intl.message(
      'No results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Francais`
  String get francais {
    return Intl.message(
      'Francais',
      name: 'francais',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Setting Failed to save !`
  String get settingSFailedToSave {
    return Intl.message(
      'Setting Failed to save !',
      name: 'settingSFailedToSave',
      desc: '',
      args: [],
    );
  }

  /// `Setting Saved Successfully !`
  String get settingsSavedSuccessfully {
    return Intl.message(
      'Setting Saved Successfully !',
      name: 'settingsSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `All Results`
  String get allResults {
    return Intl.message(
      'All Results',
      name: 'allResults',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get movies {
    return Intl.message(
      'Movies',
      name: 'movies',
      desc: '',
      args: [],
    );
  }

  /// `TV`
  String get tv {
    return Intl.message(
      'TV',
      name: 'tv',
      desc: '',
      args: [],
    );
  }

  /// `Person`
  String get person {
    return Intl.message(
      'Person',
      name: 'person',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Movie ID !`
  String get invalidMovieId {
    return Intl.message(
      'Invalid Movie ID !',
      name: 'invalidMovieId',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
