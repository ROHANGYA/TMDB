import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/repository/home_repository.dart';

@singleton
class FetchUpcomingMoviesFromTodayUseCase {
  final HomeRepository _repository;

  FetchUpcomingMoviesFromTodayUseCase(this._repository);

  Future<void> execute(
      {required Function(List<Movie>) onSuccess,
      required Function(String) onFailure}) async {
    final today = DateTime.now();
    final todayFormatted = DateFormat('yyyy-MM-dd').format(today);
    final featuredMovies =
        await _repository.getUpcomingMoviesFromDate(date: todayFormatted);
    featuredMovies.fold((data) => onSuccess.call(data),
        (error) => onFailure.call(error.plainError));
  }
}
