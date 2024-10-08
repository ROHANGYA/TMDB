import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/data/data_sources/local/db/hive_db.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/domain/use_case/fetch_language_settings_use_case.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/presentation/bloc/home/featured_movies_cubit.dart';
import 'package:tmdb/presentation/bloc/home/upcoming_movies_cubit.dart';
import 'package:tmdb/presentation/bloc/search/search_cubit.dart';
import 'package:tmdb/presentation/bloc/settings/settings_cubit.dart';
import 'package:tmdb/presentation/router/router_config.dart';
import 'package:tmdb/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(); // DI
  await initializeDateFormatting(); // intl
  await di.get<HiveLocalStorage>().init(); // Hive
  runApp(const CoreApp());
}

class CoreApp extends StatelessWidget {
  const CoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: MyColors.charcoal));
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedMoviesCubit>(
            create: (BuildContext context) => FeaturedMoviesCubit()),
        BlocProvider<UpcomingMoviesCubit>(
            create: (BuildContext context) => UpcomingMoviesCubit()),
        BlocProvider<SearchCubit>(
            create: (BuildContext context) => SearchCubit()),
        BlocProvider<SettingsCubit>(
            lazy: false, create: (BuildContext context) => SettingsCubit()),
      ],
      child: MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1.0)),
        child: MaterialApp.router(
          title: 'TMDB Demo',
          theme: Themes.mainLightTheme,
          darkTheme: Themes.mainDarkTheme,
          themeMode: ThemeMode.light,
          supportedLocales: S.delegate.supportedLocales,
          locale:
              Locale(di.get<FetchLanguageSettingsUseCase>().execute(), null),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerConfig: goRouterConfig,
        ),
      ),
    );
  }
}
