import 'package:dartz/dartz.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/movie.dart';

abstract class HomeRepository {
  Future<Either<List<Movie>, Failure>> getFeaturedMovies();

  Future<Either<List<Movie>, Failure>> getUpcomingMoviesFromDate(
      {required String date});
}
