import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/actor.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/entity/tv.dart';
import 'package:tmdb/domain/repository/search_repository.dart';

class MockSearchRepository extends Mock implements SearchRepository {
  @override
  Future<Either<List<Movie>, Failure>> searchMovie(
      {required int page,
      required String searchQuery,
      required String searchFilter}) async {
    return Left([
      Movie(
        id: 2,
        title: "test titlesss",
        backdropPath: "AEF",
        posterPath: "FAf",
      )
    ]);
  }

  @override
  Future<Either<List<Actor>, Failure>> searchActor(
      {required int page,
      required String searchQuery,
      required String searchFilter}) async {
    return Left([Actor(name: "test", profilePath: "profilePath")]);
  }

  @override
  Future<Either<List<Tv>, Failure>> searchTv(
      {required int page,
      required String searchQuery,
      required String searchFilter}) async {
    return Left([
      Tv(name: "name", backdropPath: "backdropPath", posterPath: "posterPath")
    ]);
  }
}
