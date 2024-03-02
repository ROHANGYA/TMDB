import 'package:injectable/injectable.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/repository/home_repository.dart';

@singleton
class FetchFeaturedMoviesUseCase {
  final HomeRepository repository;

  FetchFeaturedMoviesUseCase({required this.repository});

  Future<void> execute(
      {required Function(List<Movie>) onSuccess,
      required Function(String) onFailure}) async {
    final featuredMovies = await repository.getFeaturedMovies();
    featuredMovies.fold((data) => onSuccess.call(data),
        (error) => onFailure.call(error.plainError));
  }
}
