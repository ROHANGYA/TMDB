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

import '../data/data_sources/remote/api_client_provider.dart' as _i5;
import '../data/data_sources/remote/implementation/movies_api.dart' as _i4;
import '../data/repository/fetch_featured_movies_repository_impl.dart' as _i7;
import '../domain/repository/fetch_featured_movies_repository.dart' as _i6;
import '../domain/use_case/fetch_featured_movies_use_case.dart' as _i8;
import 'app_module.dart' as _i9;

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
    gh.factory<_i4.MovieApi>(() => _i4.MovieApi(dio: gh<_i3.Dio>()));
    gh.singleton<_i5.ApiClientProvider>(
        _i5.ApiClientProvider(dio: gh<_i3.Dio>()));
    gh.factory<_i6.FetchFeaturedMoviesRepository>(
        () => _i7.FetchFeaturedMoviesRepositoryImpl(api: gh<_i4.MovieApi>()));
    gh.singleton<_i8.FetchFeaturedMoviesUseCase>(_i8.FetchFeaturedMoviesUseCase(
        repository: gh<_i6.FetchFeaturedMoviesRepository>()));
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
