import 'package:dartz/dartz.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/data/models/movie_details_response.dart';

abstract class DetailsRepository {
  Future<Either<MovieDetailsResponse, Failure>> getMovieDetails(
      {required String movieId});
}
