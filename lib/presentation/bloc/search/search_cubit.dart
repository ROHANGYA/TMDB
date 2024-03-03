import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/use_case/search_movies_use_case.dart';
import 'package:tmdb/presentation/bloc/search/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  int _currentPage = 1;
  final List<Movie> _currentData = List.empty(growable: true);

  SearchCubit() : super(Loading(isLoadingNextPage: false));

  Future<void> loadPage() async {
    emit(Loading(isLoadingNextPage: _currentPage > 1));
    await Future.delayed(const Duration(seconds: 4), () {});
    await di.get<SearchMoviesUseCase>().execute(
        page: _currentPage,
        onSuccess: (data) {
          _currentData.addAll(data);
          emit(Loaded(data: _currentData));
          _currentPage++;
        },
        onFailure: (error) {
          emit(LoadingFailed(prevData: _currentData, error: error));
        });
  }
}
