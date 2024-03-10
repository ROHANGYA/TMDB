import 'package:equatable/equatable.dart';
import 'package:tmdb/domain/entity/actor.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/entity/tv.dart';

class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends SearchState {
  final bool isLoadingNextPage;

  Loading({required this.isLoadingNextPage});

  @override
  List<Object?> get props => [isLoadingNextPage];
}

class Loaded extends SearchState {
  final List<Movie> movieData;
  final List<Tv> tvData;
  final List<Actor> actorData;
  final bool isSearchEmpty;

  Loaded(
      {required this.movieData,
      required this.tvData,
      required this.actorData,
      required this.isSearchEmpty});

  @override
  List<Object?> get props => [movieData, tvData, actorData, isSearchEmpty];
}

class LoadingFailed extends SearchState {
  final List<Movie> prevMovieData;
  final List<Tv> prevTvData;
  final List<Actor> prevActorData;
  final String error;

  LoadingFailed(
      {required this.prevMovieData,
      required this.prevTvData,
      required this.prevActorData,
      required this.error});

  @override
  List<Object?> get props => [prevMovieData, prevTvData, prevActorData, error];
}
