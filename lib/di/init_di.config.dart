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
import 'package:tmdb/data/data_sources/local/db/hive_db.dart' as _i5;
import 'package:tmdb/data/data_sources/local/implementation/movies_local.dart'
    as _i7;
import 'package:tmdb/data/data_sources/local/implementation/settings_local.dart'
    as _i8;
import 'package:tmdb/data/data_sources/remote/implementation/actors_api.dart'
    as _i12;
import 'package:tmdb/data/data_sources/remote/implementation/movies_api.dart'
    as _i6;
import 'package:tmdb/data/data_sources/remote/implementation/tv_api.dart'
    as _i11;
import 'package:tmdb/data/repository/details_repository_impl.dart' as _i14;
import 'package:tmdb/data/repository/home_repository_impl.dart' as _i18;
import 'package:tmdb/data/repository/search_repository_impl.dart' as _i21;
import 'package:tmdb/data/repository/settings_repository_impl.dart' as _i10;
import 'package:tmdb/di/app_module.dart' as _i25;
import 'package:tmdb/domain/repository/details_repository.dart' as _i13;
import 'package:tmdb/domain/repository/home_repository.dart' as _i17;
import 'package:tmdb/domain/repository/search_repository.dart' as _i20;
import 'package:tmdb/domain/repository/settings_repository.dart' as _i9;
import 'package:tmdb/domain/use_case/fetch_featured_movies_use_case.dart'
    as _i22;
import 'package:tmdb/domain/use_case/fetch_language_settings_use_case.dart'
    as _i15;
import 'package:tmdb/domain/use_case/fetch_movie_details_use_case.dart' as _i16;
import 'package:tmdb/domain/use_case/fetch_upcoming_movies_from_today_use_case.dart'
    as _i23;
import 'package:tmdb/domain/use_case/save_language_settings_use_case.dart'
    as _i19;
import 'package:tmdb/domain/use_case/search_use_case.dart' as _i24;

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
    gh.factory<_i8.SettingsLocal>(
        () => _i8.SettingsLocal(gh<_i5.HiveLocalStorage>()));
    gh.factory<_i9.SettingsRepository>(
        () => _i10.SettingsRepositoryImpl(gh<_i8.SettingsLocal>()));
    gh.factory<_i11.TvApi>(() => _i11.TvApi(gh<_i3.Dio>()));
    gh.factory<_i12.ActorApi>(() => _i12.ActorApi(gh<_i3.Dio>()));
    gh.factory<_i13.DetailsRepository>(
        () => _i14.DetailsRepositoryImpl(api: gh<_i6.MovieApi>()));
    gh.singleton<_i15.FetchLanguageSettingsUseCase>(
        _i15.FetchLanguageSettingsUseCase(gh<_i9.SettingsRepository>()));
    gh.singleton<_i16.FetchMovieDetailsUseCase>(
        _i16.FetchMovieDetailsUseCase(gh<_i13.DetailsRepository>()));
    gh.factory<_i17.HomeRepository>(
        () => _i18.HomeRepositoryImpl(api: gh<_i6.MovieApi>()));
    gh.singleton<_i19.SaveLanguageSettingsUseCase>(
        _i19.SaveLanguageSettingsUseCase(gh<_i9.SettingsRepository>()));
    gh.factory<_i20.SearchRepository>(() => _i21.SearchRepositoryImpl(
          gh<_i6.MovieApi>(),
          gh<_i11.TvApi>(),
          gh<_i12.ActorApi>(),
        ));
    gh.singleton<_i22.FetchFeaturedMoviesUseCase>(
        _i22.FetchFeaturedMoviesUseCase(gh<_i17.HomeRepository>()));
    gh.singleton<_i23.FetchUpcomingMoviesFromTodayUseCase>(
        _i23.FetchUpcomingMoviesFromTodayUseCase(gh<_i17.HomeRepository>()));
    gh.singleton<_i24.SearchMoviesUseCase>(
        _i24.SearchMoviesUseCase(gh<_i20.SearchRepository>()));
    return this;
  }
}

class _$AppModule extends _i25.AppModule {}
