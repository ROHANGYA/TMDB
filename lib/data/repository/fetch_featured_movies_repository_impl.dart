import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/data/data_sources/remote/implementation/movies_api.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/featured_movie.dart';
import 'package:tmdb/domain/repository/fetch_featured_movies_repository.dart';

@Injectable(as: FetchFeaturedMoviesRepository)
class FetchFeaturedMoviesRepositoryImpl
    implements FetchFeaturedMoviesRepository {
  final MovieApi api;

  FetchFeaturedMoviesRepositoryImpl({required this.api});

  @override
  Future<Either<List<FeaturedMovie>, Failure>> getFeaturedMovies() async {
    final result = await api.fetchFeaturedMovies();
    return result.fold((apiResult) => left(apiResult as List<FeaturedMovie>),
        (failure) => right(failure));
  }
}
