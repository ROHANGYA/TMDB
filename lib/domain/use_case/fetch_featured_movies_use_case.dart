import 'package:injectable/injectable.dart';
import 'package:tmdb/domain/entity/featured_movie.dart';
import 'package:tmdb/domain/repository/fetch_featured_movies_repository.dart';

@singleton
class FetchFeaturedMoviesUseCase {
  final FetchFeaturedMoviesRepository repository;

  FetchFeaturedMoviesUseCase({required this.repository});

  Future<void> execute(
      {required Function(List<FeaturedMovie>) onSuccess,
      required Function(String) onFailure}) async {
    final featuredMovies = await repository.getFeaturedMovies();
    featuredMovies.fold((data) => onSuccess.call(data),
        (error) => onFailure.call(error.plainError));
  }
}
