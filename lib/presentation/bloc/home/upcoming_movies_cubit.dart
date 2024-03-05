import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/use_case/fetch_upcoming_movies_from_today_use_case.dart';
import 'package:tmdb/presentation/bloc/home/home_state.dart';

class UpcomingMoviesCubit extends Cubit<HomeState> {
  UpcomingMoviesCubit() : super(Loading());

  Future<void> fetchUpcomingMovies() async {
    await di.get<FetchUpcomingMoviesFromTodayUseCase>().execute(
        onSuccess: (List<Movie> data) {
      emit(Loaded(data));
    }, onFailure: (String error) {
      emit(LoadingFailed(error));
    });
  }

  Future<void> refresh() async {
    emit(Loading());
    await fetchUpcomingMovies();
  }
}
