import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/data/data_sources/remote/network_exceptions.dart';
import 'package:tmdb/data/models/actor_response.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/data/models/paginated_response.dart';

@injectable
class ActorApi {
  final Dio _dio;

  ActorApi(this._dio);

  Future<Either<List<ActorResponse>, Failure>> searchActor(
      {required int page,
      required String searchQuery,
      required String searchFilter}) async {
    try {
      final response = await _dio.get(ApiUrl.searchActor, queryParameters: {
        "query": searchQuery,
        "include_adult": "false",
        "language": Intl.defaultLocale,
        "page": page
      });
      final paginatedResponseMovie = PaginatedResponse.fromJson(response.data);
      final results = paginatedResponseMovie.results
          .map((e) => ActorResponse.fromJson(e))
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
