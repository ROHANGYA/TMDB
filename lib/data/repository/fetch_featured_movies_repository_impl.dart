import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/featured_movie.dart';
import 'package:tmdb/domain/repository/fetch_featured_movies_repository.dart';

@Injectable(as: FetchFeaturedMoviesRepository)
class FetchFeaturedMoviesRepositoryImpl
    implements FetchFeaturedMoviesRepository {
  @override
  Future<Either<List<FeaturedMovie>, Failure>> getFeaturedMovies() async {
    // simulate loading then success.
    return await Future.delayed(const Duration(seconds: 2), () {
      return left(mockFeatureMovies);
    });
  }
}
