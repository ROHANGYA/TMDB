import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/domain/entity/actor.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/entity/tv.dart';
import 'package:tmdb/domain/use_case/search_use_case.dart';
import 'package:tmdb/presentation/bloc/search/search_state.dart';
import 'package:tmdb/presentation/extensions/list_extensions.dart';
import 'package:tmdb/presentation/screens/search/search_filter_items.dart';

class SearchCubit extends Cubit<SearchState> {
  int _currentPage = 1;
  final List<dynamic> _currentData = List.empty(growable: true);
  final searchTextController = TextEditingController();
  SearchFilterItems searchFilterItem = SearchFilterItems.movie;

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
        searchFilter: searchFilterItem,
        onSuccess: (data) {
          _currentData.addAll(data);
          emit(Loaded(
              movieData: _currentData.tryCastOrEmpty<Movie>(),
              tvData: _currentData.tryCastOrEmpty<Tv>(),
              actorData: _currentData.tryCastOrEmpty<Actor>(),
              isSearchEmpty: _isSearchQueryEmpty));
          _currentPage++;
        },
        onFailure: (error) {
          emit(LoadingFailed(
              prevMovieData: _currentData.tryCastOrEmpty<Movie>(),
              prevTvData: _currentData.tryCastOrEmpty<Tv>(),
              prevActorData: _currentData.tryCastOrEmpty<Actor>(),
              error: error));
        });
  }

  bool get _isSearchQueryEmpty => searchTextController.text.isEmpty;

  void setSearchFilterItem({required SearchFilterItems filter}) {
    searchFilterItem = filter;
    _resetPagination();
    loadPage();
  }

  @override
  Future<void> close() {
    searchTextController.dispose();
    return super.close();
  }
}
