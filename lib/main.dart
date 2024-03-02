import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/presentation/bloc/home_cubit.dart';
import 'package:tmdb/presentation/router/router_config.dart';
import 'package:tmdb/themes.dart';

void main() {
  configureDependencies();
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
        BlocProvider<HomeCubit>(create: (BuildContext context) => HomeCubit()),
      ],
      child: MaterialApp.router(
        title: 'TMDB Demo',
        theme: Themes.mainLightTheme,
        darkTheme: Themes.mainDarkTheme,
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('en', null),
        localizationsDelegates: const [S.delegate],
        routerConfig: goRouterConfig,
      ),
    );
  }
}
