import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/data/data_sources/remote/implementation/movies_api.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/data/models/movie_details_response.dart';
import 'package:tmdb/domain/repository/details_repository.dart';

@Injectable(as: DetailsRepository)
class DetailsRepositoryImpl extends DetailsRepository {
  final MovieApi api;

  DetailsRepositoryImpl({required this.api});

  @override
  Future<Either<MovieDetailsResponse, Failure>> getMovieDetails(
      {required String movieId}) async {
    final result = await api.fetchMovieDetails(id: movieId);
    return result.fold(
        (apiResult) => left(apiResult), (failure) => right(failure));
  }
}
