import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/data/data_sources/remote/network_exceptions.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/data/models/movie_response.dart';
import 'package:tmdb/data/models/paginated_response.dart';

@injectable
class MovieApi {
  final Dio _dio;

  MovieApi(this._dio);

  Future<Either<List<MovieResponse>, Failure>> fetchFeaturedMovies() async {
    try {
      final response =
          await _dio.get("${ApiUrl.trendingMoviesApi}/day?language=en-US");
      final topRatedMovies = (response.data["results"] as List)
          .map((e) => MovieResponse.fromJson(e))
          .toList();
      return left(topRatedMovies);
    } on DioException catch (e) {
      return right(
          Failure(plainError: NetworkExceptions.fromDioError(e).toString()));
    } catch (e) {
      return right(Failure(plainError: e.toString()));
    }
  }

  Future<Either<List<MovieResponse>, Failure>> fetchUpcomingMoviesFromDate(
      {required String date}) async {
    try {
      final response = await _dio.get(
          "${ApiUrl.discoverMoviesApi}?include_adult=false&include_video=false&language=en-US&page=1&primary_release_date.gte=$date&sort_by=popularity.desc");
      final topRatedMovies = (response.data["results"] as List)
          .map((e) => MovieResponse.fromJson(e))
          .toList();
      return left(topRatedMovies);
    } on DioException catch (e) {
      return right(
          Failure(plainError: NetworkExceptions.fromDioError(e).toString()));
    } catch (e) {
      return right(Failure(plainError: e.toString()));
    }
  }

  Future<Either<List<MovieResponse>, Failure>> searchMovie(
      {required int page}) async {
    try {
      final response = await _dio.get(
          "${ApiUrl.discoverMoviesApi}?include_adult=false&include_video=false&language=en-US&page=$page&sort_by=popularity.desc");
      final paginatedResponseMovie = PaginatedResponse.fromJson(response.data);
      final results = paginatedResponseMovie.results
          .map((e) => MovieResponse.fromJson(e))
          .toList();
      return left(results);
    } on DioException catch (e) {
      return right(
          Failure(plainError: NetworkExceptions.fromDioError(e).toString()));
    } catch (e) {
      return right(Failure(plainError: e.toString()));
    }
  }
}
