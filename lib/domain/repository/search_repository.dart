import 'package:dartz/dartz.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/movie.dart';

abstract class SearchRepository {
  Future<Either<List<Movie>, Failure>> searchMovie({required int page});
}
