import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/domain/entity/featured_movie.dart';
import 'package:tmdb/domain/use_case/fetch_featured_movies_use_case.dart';
import 'package:tmdb/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(Loading());

  void fetchTrendingMovies() async {
    await di.get<FetchFeaturedMoviesUseCase>().execute(
        onSuccess: (List<FeaturedMovie> data) {
      emit(Loaded(data));
      print(">>>>>> SUCCESS");
    }, onFailure: (String error) {
      emit(LoadingFailed(error));
      print(">>>>>> FAILURE");
    });
  }
}
