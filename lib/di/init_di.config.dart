// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_sources/remote/implementation/movies_api.dart' as _i4;
import '../data/repository/home_repository_impl.dart' as _i8;
import '../data/repository/search_repository_impl.dart' as _i6;
import '../domain/repository/home_repository.dart' as _i7;
import '../domain/repository/search_repository.dart' as _i5;
import '../domain/use_case/fetch_featured_movies_use_case.dart' as _i10;
import '../domain/use_case/fetch_upcoming_movies_from_today_use_case.dart'
    as _i11;
import '../domain/use_case/search_movies_use_case.dart' as _i9;
import 'app_module.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(() => appModule.dioClient);
    gh.factory<_i4.MovieApi>(() => _i4.MovieApi(gh<_i3.Dio>()));
    gh.factory<_i5.SearchRepository>(
        () => _i6.SearchRepositoryImpl(api: gh<_i4.MovieApi>()));
    gh.factory<_i7.HomeRepository>(
        () => _i8.HomeRepositoryImpl(api: gh<_i4.MovieApi>()));
    gh.singleton<_i9.SearchMoviesUseCase>(
        _i9.SearchMoviesUseCase(gh<_i5.SearchRepository>()));
    gh.singleton<_i10.FetchFeaturedMoviesUseCase>(
        _i10.FetchFeaturedMoviesUseCase(gh<_i7.HomeRepository>()));
    gh.singleton<_i11.FetchUpcomingMoviesFromTodayUseCase>(
        _i11.FetchUpcomingMoviesFromTodayUseCase(gh<_i7.HomeRepository>()));
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
