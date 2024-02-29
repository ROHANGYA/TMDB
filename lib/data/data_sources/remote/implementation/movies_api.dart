import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/data/data_sources/remote/api_client_provider.dart';
import 'package:tmdb/data/data_sources/remote/network_exceptions.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/data/models/top_rated_movies.dart';

@injectable
class MovieApi extends ApiClientProvider {
  MovieApi({required super.dio});

  Future<Either<List<TopRatedMovies>, Failure>> fetchFeaturedMovies() async {
    try {
      final response =
          await dio.get("${ApiUrl.trendingMoviesApi}/day?language=en-US");
      final topRatedMovies = (response.data["results"] as List)
          .map((e) => TopRatedMovies.fromJson(e))
          .toList();
      return left(topRatedMovies);
    } on DioException catch (e) {
      return right(
          Failure(plainError: NetworkExceptions.fromDioError(e).toString()));
    } catch (e) {
      return right(Failure(plainError: e.toString()));
    }
  }
}
