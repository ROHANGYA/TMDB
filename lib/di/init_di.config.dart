// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_sources/local/db/hive_db.dart' as _i5;
import '../data/data_sources/local/implementation/movies_local.dart' as _i7;
import '../data/data_sources/remote/implementation/movies_api.dart' as _i6;
import '../data/repository/home_repository_impl.dart' as _i11;
import '../data/repository/search_repository_impl.dart' as _i9;
import '../domain/repository/home_repository.dart' as _i10;
import '../domain/repository/search_repository.dart' as _i8;
import '../domain/use_case/fetch_featured_movies_use_case.dart' as _i13;
import '../domain/use_case/fetch_upcoming_movies_from_today_use_case.dart'
    as _i14;
import '../domain/use_case/search_movies_use_case.dart' as _i12;
import 'app_module.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.Dio>(() => appModule.dioClient);
    await gh.factoryAsync<_i4.FlutterSecureStorage>(
      () => appModule.secureStorage,
      preResolve: true,
    );
    gh.singleton<_i5.HiveLocalStorage>(
        _i5.HiveLocalStorage(gh<_i4.FlutterSecureStorage>()));
    gh.factory<_i6.MovieApi>(() => _i6.MovieApi(gh<_i3.Dio>()));
    gh.factory<_i7.MoviesLocal>(
        () => _i7.MoviesLocal(gh<_i5.HiveLocalStorage>()));
    gh.factory<_i8.SearchRepository>(
        () => _i9.SearchRepositoryImpl(api: gh<_i6.MovieApi>()));
    gh.factory<_i10.HomeRepository>(
        () => _i11.HomeRepositoryImpl(api: gh<_i6.MovieApi>()));
    gh.singleton<_i12.SearchMoviesUseCase>(
        _i12.SearchMoviesUseCase(gh<_i8.SearchRepository>()));
    gh.singleton<_i13.FetchFeaturedMoviesUseCase>(
        _i13.FetchFeaturedMoviesUseCase(gh<_i10.HomeRepository>()));
    gh.singleton<_i14.FetchUpcomingMoviesFromTodayUseCase>(
        _i14.FetchUpcomingMoviesFromTodayUseCase(gh<_i10.HomeRepository>()));
    return this;
  }
}

class _$AppModule extends _i15.AppModule {}
