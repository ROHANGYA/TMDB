import 'package:dartz/dartz.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/featured_movie.dart';

abstract class FetchFeaturedMoviesRepository {
  Future<Either<List<FeaturedMovie>, Failure>> getFeaturedMovies();
}
