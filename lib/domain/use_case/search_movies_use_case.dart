import 'package:injectable/injectable.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/repository/search_repository.dart';

@singleton
class SearchMoviesUseCase {
  final SearchRepository repository;

  SearchMoviesUseCase({required this.repository});

  Future<void> execute(
      {required int page,
      required List<Movie> prevList,
      required Function(List<Movie>) onSuccess,
      required Function(String) onFailure}) async {
    final featuredMovies = await repository.searchMovie(page: page);
    featuredMovies.fold((data) => onSuccess.call(prevList..addAll(data)),
        (error) => onFailure.call(error.plainError));
  }
}
