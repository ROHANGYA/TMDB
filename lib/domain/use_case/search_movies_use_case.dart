import 'package:injectable/injectable.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/repository/search_repository.dart';

@singleton
class SearchMoviesUseCase {
  final SearchRepository _repository;

  SearchMoviesUseCase(this._repository);

  Future<void> execute(
      {required int page,
      required String searchQuery,
      required Function(List<Movie>) onSuccess,
      required Function(String) onFailure}) async {
    final featuredMovies =
        await _repository.searchMovie(page: page, searchQuery: searchQuery);
    featuredMovies.fold((data) => onSuccess.call(data),
        (error) => onFailure.call(error.plainError));
  }
}
