import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/use_case/fetch_featured_movies_use_case.dart';
import 'package:tmdb/presentation/bloc/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Loading());

  Future<void> fetchTrendingMovies() async {
    await di.get<FetchFeaturedMoviesUseCase>().execute(
        onSuccess: (List<Movie> data) {
      emit(Loaded(data));
    }, onFailure: (String error) {
      emit(LoadingFailed(error));
    });
  }

  Future<void> refresh() async {
    emit(Loading());
    await fetchTrendingMovies();
  }
}
