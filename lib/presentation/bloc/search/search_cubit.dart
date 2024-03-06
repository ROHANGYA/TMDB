import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/use_case/search_movies_use_case.dart';
import 'package:tmdb/presentation/bloc/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  int _currentPage = 1;
  final List<Movie> _currentData = List.empty(growable: true);
  final searchTextController = TextEditingController();

  SearchCubit() : super(Loading(isLoadingNextPage: false)) {
    searchTextController.addListener(_searchListener);
  }

  void _searchListener() {
    _resetPagination();
    loadPage();
  }

  void _resetPagination() {
    _currentPage = 1;
    _currentData.clear();
  }

  Future<void> loadPage() async {
    emit(Loading(isLoadingNextPage: _currentPage > 1));
    await di.get<SearchMoviesUseCase>().execute(
        page: _currentPage,
        searchQuery: searchTextController.text,
        onSuccess: (data) {
          _currentData.addAll(data);
          emit(Loaded(data: _currentData, isSearchEmpty: _isSearchQueryEmpty));
          _currentPage++;
        },
        onFailure: (error) {
          emit(LoadingFailed(prevData: _currentData, error: error));
        });
  }

  bool get _isSearchQueryEmpty => searchTextController.text.isEmpty;

  @override
  Future<void> close() {
    searchTextController.dispose();
    return super.close();
  }
}
