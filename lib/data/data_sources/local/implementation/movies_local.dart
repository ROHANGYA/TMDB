import 'package:injectable/injectable.dart';
import 'package:tmdb/data/data_sources/local/db/hive_db.dart';
import 'package:tmdb/data/models/movie_response.dart';

@injectable
class MoviesLocal {
  final HiveLocalStorage _localStorage;
  static const trendingMoviesKey = 'Trending_movies_key';
  static const upcomingMoviesKey = 'Upcoming_movies_key';

  MoviesLocal(this._localStorage);

  List<MovieResponse> fetchTrendingMovies() {
    final rawJson = _localStorage.hiveBox.get(trendingMoviesKey);
    return rawJson == null
        ? []
        : (rawJson as List)
            .map((movie) => MovieResponse.fromRawJson(movie))
            .toList();
  }

  void saveTrendingMovies({required List<MovieResponse> trendingMovies}) async {
    await _localStorage.hiveBox.put(trendingMoviesKey,
        trendingMovies.map((movie) => movie.toRawJson()).toString());
  }

  List<MovieResponse> fetchUpcomingMovies() {
    final rawJson = _localStorage.hiveBox.get(upcomingMoviesKey);
    return rawJson == null
        ? []
        : (rawJson as List)
            .map((movie) => MovieResponse.fromRawJson(movie))
            .toList();
  }

  void saveUpcomingMovies({required List<MovieResponse> upcomingMovies}) async {
    await _localStorage.hiveBox.put(upcomingMoviesKey,
        upcomingMovies.map((movie) => movie.toRawJson()).toString());
  }
}
