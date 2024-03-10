import 'package:dartz/dartz.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/actor.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/entity/tv.dart';

abstract class SearchRepository {
  Future<Either<List<Movie>, Failure>> searchMovie(
      {required int page,
      required String searchQuery,
      required String searchFilter});

  Future<Either<List<Tv>, Failure>> searchTv(
      {required int page,
      required String searchQuery,
      required String searchFilter});

  Future<Either<List<Actor>, Failure>> searchActor(
      {required int page,
      required String searchQuery,
      required String searchFilter});
}
