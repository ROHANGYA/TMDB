import 'package:injectable/injectable.dart';
import 'package:tmdb/domain/entity/movie_details.dart';
import 'package:tmdb/domain/repository/details_repository.dart';
import 'package:tmdb/extensions.dart';

@singleton
class FetchMovieDetailsUseCase {
  final DetailsRepository _repository;

  FetchMovieDetailsUseCase(this._repository);

  Future<void> execute(
      {required String movieId,
      required Function(MovieDetails) onSuccess,
      required Function(String) onFailure}) async {
    final featuredMovies = await _repository.getMovieDetails(movieId: movieId);
    featuredMovies.fold(
        (data) => onSuccess.call(MovieDetails(
            title: data.title,
            runtime: data.runtime.getFormattedMovieRuntime(),
            year: data.releaseDate.year.toString(),
            description: data.overview,
            tags: data.genres.map((e) => e.name).toList(),
            backgroundImagePath: data.backdropPath,
            foregroundImagePath: data.posterPath)),
        (error) => onFailure.call(error.plainError));
  }
}
