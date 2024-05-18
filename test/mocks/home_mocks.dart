import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/repository/home_repository.dart';

class MockRepo extends Mock implements HomeRepository {
  @override
  Future<Either<List<Movie>, Failure>> getFeaturedMovies() async {
    return Left([
      Movie(
        id: 1,
        title: "test titlesss",
        backdropPath: "AEF",
        posterPath: "FAf",
      )
    ]);
  }

  @override
  Future<Either<List<Movie>, Failure>> getUpcomingMoviesFromDate(
      {required String date}) async {
    return Left([
      Movie(
        id: 2,
        title: "test titlesss",
        backdropPath: "AEF",
        posterPath: "FAf",
      )
    ]);
  }
}
