import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/domain/entity/movie_details.dart';
import 'package:tmdb/domain/use_case/fetch_movie_details_use_case.dart';
import 'package:tmdb/presentation/bloc/details/movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(Loading());

  Future<void> fetchMovieDetails({required String? movieId}) async {
    _validateMovieId(movieId);
    await di.get<FetchMovieDetailsUseCase>().execute(
        movieId: movieId!,
        onSuccess: (MovieDetails data) {
          emit(Loaded(data));
        },
        onFailure: (String error) {
          emit(LoadingFailed(error));
        });
  }

  Future<void> refresh({required String? movieId}) async {
    _validateMovieId(movieId);
    emit(Loading());
    await fetchMovieDetails(movieId: movieId);
  }

  void _validateMovieId(String? movieId) {
    if (movieId == null || movieId.isEmpty) {
      emit(LoadingFailed(strings.invalidMovieId));
    }
  }
}
