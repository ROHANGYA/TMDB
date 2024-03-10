import 'package:injectable/injectable.dart';
import 'package:tmdb/domain/repository/search_repository.dart';
import 'package:tmdb/presentation/screens/search/search_filter_items.dart';

@singleton
class SearchMoviesUseCase {
  final SearchRepository _repository;

  SearchMoviesUseCase(this._repository);

  Future<void> execute(
      {required int page,
      required String searchQuery,
      required SearchFilterItems searchFilter,
      required Function(List<dynamic>) onSuccess,
      required Function(String) onFailure}) async {
    final featuredMovies = switch (searchFilter) {
      SearchFilterItems.movie => await _repository.searchMovie(
          page: page,
          searchQuery: searchQuery,
          searchFilter: searchFilter.name),
      SearchFilterItems.tv => await _repository.searchTv(
          page: page,
          searchQuery: searchQuery,
          searchFilter: searchFilter.name),
      SearchFilterItems.person => await _repository.searchActor(
          page: page,
          searchQuery: searchQuery,
          searchFilter: searchFilter.name),
    };
    featuredMovies.fold((data) => onSuccess.call(data),
        (error) => onFailure.call(error.plainError));
  }
}
