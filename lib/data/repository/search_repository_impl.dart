import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/data/data_sources/remote/implementation/actors_api.dart';
import 'package:tmdb/data/data_sources/remote/implementation/movies_api.dart';
import 'package:tmdb/data/data_sources/remote/implementation/tv_api.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/actor.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/entity/tv.dart';
import 'package:tmdb/domain/repository/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final MovieApi movieApi;
  final TvApi tvApi;
  final ActorApi actorApi;

  SearchRepositoryImpl(this.movieApi, this.tvApi, this.actorApi);

  @override
  Future<Either<List<Movie>, Failure>> searchMovie(
      {required int page,
      required String searchQuery,
      required String searchFilter}) async {
    final result = await movieApi.searchMovie(
        page: page, searchQuery: searchQuery, searchFilter: searchFilter);
    return result.fold((apiResult) => left(apiResult as List<Movie>),
        (failure) => right(failure));
  }

  @override
  Future<Either<List<Tv>, Failure>> searchTv(
      {required int page,
      required String searchQuery,
      required String searchFilter}) async {
    final result = await tvApi.searchTv(
        page: page, searchQuery: searchQuery, searchFilter: searchFilter);
    return result.fold((apiResult) => left(apiResult as List<Tv>),
        (failure) => right(failure));
  }

  @override
  Future<Either<List<Actor>, Failure>> searchActor(
      {required int page,
      required String searchQuery,
      required String searchFilter}) async {
    final result = await actorApi.searchActor(
        page: page, searchQuery: searchQuery, searchFilter: searchFilter);
    return result.fold((apiResult) => left(apiResult as List<Actor>),
        (failure) => right(failure));
  }
}
