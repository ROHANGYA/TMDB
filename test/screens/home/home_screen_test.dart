import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/use_case/fetch_featured_movies_use_case.dart';
import 'package:tmdb/domain/use_case/fetch_language_settings_use_case.dart';
import 'package:tmdb/domain/use_case/fetch_upcoming_movies_from_today_use_case.dart';
import 'package:tmdb/domain/use_case/search_use_case.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/presentation/bloc/home/featured_movies_cubit.dart';
import 'package:tmdb/presentation/bloc/home/home_state.dart';
import 'package:tmdb/presentation/bloc/home/upcoming_movies_cubit.dart';
import 'package:tmdb/presentation/bloc/search/search_cubit.dart';
import 'package:tmdb/presentation/bloc/settings/settings_cubit.dart';
import 'package:tmdb/presentation/keys/widget_keys.dart';
import 'package:tmdb/presentation/router/router_config.dart';
import 'package:tmdb/presentation/widgets/circular_loading_indicator.dart';
import 'package:tmdb/presentation/widgets/generic_error.dart';
import 'package:tmdb/presentation/widgets/movie_category_label.dart';
import 'package:tmdb/presentation/widgets/view_more.dart';
import 'package:tmdb/themes.dart';

import '../../mocks/home_mocks.dart';
import '../../mocks/search_mocks.dart';
import '../../mocks/settings_mocks.dart';
import '../test_utils.dart';

// @GenerateNiceMocks([
//   MockSpec<FetchFeaturedMoviesUseCase>(),
//   MockSpec<FetchUpcomingMoviesFromTodayUseCase>(),
//   MockSpec<SearchMoviesUseCase>(),
//   MockSpec<FetchLanguageSettingsUseCase>(),
// ])
void main() {
  late FeaturedMoviesCubit featuredMoviesCubit;
  late UpcomingMoviesCubit upcomingMoviesCubit;
  late SearchCubit searchCubit;
  late SettingsCubit settingsCubit;
  late FetchFeaturedMoviesUseCase fetchFeaturedMoviesUseCase;
  late FetchUpcomingMoviesFromTodayUseCase fetchUpcomingMoviesFromTodayUseCase;
  late SearchMoviesUseCase searchMoviesUseCase;
  late FetchLanguageSettingsUseCase fetchLanguageSettingsUseCase;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    featuredMoviesCubit = FeaturedMoviesCubit();
    upcomingMoviesCubit = UpcomingMoviesCubit();
    fetchFeaturedMoviesUseCase = FetchFeaturedMoviesUseCase(MockRepo());
    fetchUpcomingMoviesFromTodayUseCase =
        FetchUpcomingMoviesFromTodayUseCase(MockRepo());
    searchMoviesUseCase = SearchMoviesUseCase(MockSearchRepository());
    fetchLanguageSettingsUseCase =
        FetchLanguageSettingsUseCase(MockSettingsRepository());
    searchCubit = SearchCubit();
    GetIt.instance.registerSingleton(fetchFeaturedMoviesUseCase);
    GetIt.instance.registerSingleton(fetchUpcomingMoviesFromTodayUseCase);
    GetIt.instance.registerSingleton(searchMoviesUseCase);
    GetIt.instance.registerSingleton(fetchLanguageSettingsUseCase);
    settingsCubit = SettingsCubit();
  });

  Widget mainApp() {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: ThemeMode.light,
      routerConfig: goRouterConfig,
      theme: Themes.mainLightTheme,
    );
  }

  tearDown(() {
    goRouterConfig.resetForTest();
    GetIt.instance.reset();
  });

  testWidgets("Home screen init", (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<FeaturedMoviesCubit>(
          create: (context) => featuredMoviesCubit),
      BlocProvider<UpcomingMoviesCubit>(
          create: (context) => upcomingMoviesCubit),
    ], child: mainApp()));
    await widgetTester.pumpAndSettle(Durations.extralong4);
    expect(find.byKey(WidgetKeys.homeScreenListView), findsOneWidget);
    expect(find.byType(MovieCategoryLabel), findsNWidgets(2));
    expect(find.byType(ViewMore), findsOneWidget);
    expect(find.byKey(WidgetKeys.homeScreenFeaturedMoviesList), findsOneWidget);
    expect(find.byKey(WidgetKeys.homeScreenUpcomingMoviesList), findsOneWidget);
    expect(find.byKey(WidgetKeys.mainNavigationBarKey), findsOneWidget);
  });

  testWidgets("Featured & Upcoming Loading state", (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<FeaturedMoviesCubit>(
          create: (context) => featuredMoviesCubit),
      BlocProvider<UpcomingMoviesCubit>(
          create: (context) => upcomingMoviesCubit)
    ], child: mainApp()));
    await widgetTester.pumpAndSettle(Durations.extralong4);
    featuredMoviesCubit.emit(Loading());
    upcomingMoviesCubit.emit(Loading());
    await widgetTester.pump(Durations.extralong1);
    expect(find.byType(CircularLoadingIndicator), findsNWidgets(2));
  });

  testWidgets("Featured & Upcoming Loaded state", (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<FeaturedMoviesCubit>(
          create: (context) => featuredMoviesCubit),
      BlocProvider<UpcomingMoviesCubit>(
          create: (context) => upcomingMoviesCubit)
    ], child: mainApp()));
    await widgetTester.pumpAndSettle(Durations.extralong4);
    featuredMoviesCubit.emit(Loaded(
        [Movie(id: 1, title: "title", backdropPath: "", posterPath: "")]));
    upcomingMoviesCubit.emit(Loaded(
        [Movie(id: 2, title: "title", backdropPath: "", posterPath: "")]));
    await widgetTester.pump(Durations.extralong1);
    expect(find.byKey(WidgetKeys.homeScreenFeaturedMoviesList), findsOneWidget);
    expect(find.byType(ViewMore), findsOneWidget);
    expect(find.byKey(WidgetKeys.homeScreenUpcomingMoviesList), findsOneWidget);
  });

  testWidgets("Featured & Upcoming Loading failed", (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<FeaturedMoviesCubit>(
          create: (context) => featuredMoviesCubit),
      BlocProvider<UpcomingMoviesCubit>(
          create: (context) => upcomingMoviesCubit)
    ], child: mainApp()));

    await widgetTester.pumpAndSettle(Durations.extralong4);
    featuredMoviesCubit.emit(LoadingFailed("test"));
    upcomingMoviesCubit.emit(LoadingFailed("test"));
    await widgetTester.pump(Durations.extralong1);
    expect(find.byType(GenericError), findsNWidgets(2));
  });

  testWidgets("Featured Loading Failed & Upcoming Loading Success",
      (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<FeaturedMoviesCubit>(
          create: (context) => featuredMoviesCubit),
      BlocProvider<UpcomingMoviesCubit>(
          create: (context) => upcomingMoviesCubit)
    ], child: mainApp()));

    await widgetTester.pumpAndSettle(Durations.extralong4);
    featuredMoviesCubit.emit(LoadingFailed("test"));
    upcomingMoviesCubit.emit(Loaded(
        [Movie(id: 2, title: "title", backdropPath: "", posterPath: "")]));
    await widgetTester.pump(Durations.extralong1);
    expect(find.byType(GenericError), findsOneWidget);
    expect(find.byKey(WidgetKeys.homeScreenUpcomingMoviesList), findsOneWidget);
  });

  testWidgets("Featured Loading Success & Upcoming Loading Failed",
      (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<FeaturedMoviesCubit>(
          create: (context) => featuredMoviesCubit),
      BlocProvider<UpcomingMoviesCubit>(
          create: (context) => upcomingMoviesCubit)
    ], child: mainApp()));

    await widgetTester.pumpAndSettle(Durations.extralong4);
    upcomingMoviesCubit.emit(LoadingFailed("test"));
    featuredMoviesCubit.emit(Loaded(
        [Movie(id: 2, title: "title", backdropPath: "", posterPath: "")]));
    await widgetTester.pump(Durations.extralong1);
    expect(find.byType(GenericError), findsOneWidget);
    expect(find.byKey(WidgetKeys.homeScreenFeaturedMoviesList), findsOneWidget);
  });

  testWidgets("Navigate to search Page from Navigation Bar",
      (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<FeaturedMoviesCubit>(
          create: (context) => featuredMoviesCubit),
      BlocProvider<UpcomingMoviesCubit>(
          create: (context) => upcomingMoviesCubit),
      BlocProvider<SearchCubit>(create: (context) => searchCubit),
      BlocProvider<SettingsCubit>(create: (context) => settingsCubit)
    ], child: mainApp()));

    await widgetTester.pumpAndSettle(Durations.extralong4);
    expect(find.byKey(WidgetKeys.mainNavigationBarKey), findsOneWidget);
    await widgetTester.tap(find.byKey(WidgetKeys.searchNavigationBarKey));
    await widgetTester.pumpAndSettle(Durations.extralong1);
    expect(find.byKey(WidgetKeys.searchScaffoldKey), findsOneWidget);
  });

  testWidgets("Navigate to search Page from Home toolbar Search Icon",
      (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<FeaturedMoviesCubit>(
          create: (context) => featuredMoviesCubit),
      BlocProvider<UpcomingMoviesCubit>(
          create: (context) => upcomingMoviesCubit),
      BlocProvider<SearchCubit>(create: (context) => searchCubit),
      BlocProvider<SettingsCubit>(create: (context) => settingsCubit)
    ], child: mainApp()));

    await widgetTester.pumpAndSettle(Durations.extralong4);
    expect(find.byKey(WidgetKeys.mainNavigationBarKey), findsOneWidget);
    final gesture = await widgetTester.startGesture(const Offset(100, 100));
    await gesture.moveTo(const Offset(100, -500));
    await widgetTester.pumpAndSettle(Durations.extralong4);
    await gesture.cancel();
    await widgetTester.tap(find.byKey(WidgetKeys.homeToolbarSearchIcon));
    await widgetTester.pumpAndSettle(Durations.extralong1);
    expect(find.byKey(WidgetKeys.searchScaffoldKey), findsOneWidget);
  });

  testWidgets("Navigate to search Page from Home Search Bar",
      (widgetTester) async {
    await widgetTester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<FeaturedMoviesCubit>(
          create: (context) => featuredMoviesCubit),
      BlocProvider<UpcomingMoviesCubit>(
          create: (context) => upcomingMoviesCubit),
      BlocProvider<SearchCubit>(create: (context) => searchCubit),
      BlocProvider<SettingsCubit>(create: (context) => settingsCubit)
    ], child: mainApp()));

    await widgetTester.pumpAndSettle(Durations.extralong4);
    expect(find.byKey(WidgetKeys.mainNavigationBarKey), findsOneWidget);
    await widgetTester.tap(find.byKey(WidgetKeys.homeSearchBarShortcut));
    await widgetTester.pumpAndSettle(Durations.extralong1);
    expect(find.byKey(WidgetKeys.searchScaffoldKey), findsOneWidget);
  });

  // testWidgets("first test test", (widgetTester) async {
  //   await widgetTester.pumpWidget(MultiBlocProvider(providers: [
  //     BlocProvider<FeaturedMoviesCubit>(
  //         create: (context) => featuredMoviesCubit),
  //     BlocProvider<UpcomingMoviesCubit>(
  //         create: (context) => upcomingMoviesCubit)
  //   ], child: mainApp()));
  //
  //   await widgetTester.pumpAndSettle(Durations.extralong4);
  //   // when(homeRepository.getFeaturedMovies()).thenThrow("test");
  //   //when(fetchFeaturedMoviesUseCase.execute).
  //
  //   //await widgetTester.pumpAndSettle();
  //   expect(find.byType(SearchBar), findsOneWidget);
  //   expect(find.byType(MovieNavigationBar), findsOneWidget);
  //   // featuredMoviesCubit.emit(Loaded(
  //   //     [Movie(id: 1, title: "title", backdropPath: "", posterPath: "")]));
  //   // upcomingMoviesCubit.emit(Loaded(
  //   //     [Movie(id: 2, title: "title", backdropPath: "", posterPath: "")]));
  //   featuredMoviesCubit.emit(Loading());
  //   upcomingMoviesCubit.emit(Loading());
  //
  //   //await widgetTester.pumpAndSettle();
  //   expect(find.byType(CircularLoadingIndicator), findsNWidgets(2));
  //   //expect(find.byType(GenericError), findsNWidgets(2));
  //   expect(find.byKey(WidgetKeys.homeScreenListView), findsOneWidget);
  //   expect(find.byType(MovieCategoryLabel), findsNWidgets(2));
  //   //expect(find.byType(ViewMore), findsOneWidget);
  //   //expect(find.byKey(WidgetKeys.homeScreenFeaturedMoviesList), findsOneWidget);
  //
  //   // expect(find.byKey(WidgetKeys.homeScreenUpcomingMoviesList), findsOneWidget);
  // });
}
