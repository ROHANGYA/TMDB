import 'package:equatable/equatable.dart';
import 'package:tmdb/domain/entity/movie.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final List<Movie> movies;

  Loaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class LoadingFailed extends HomeState {
  final String error;

  LoadingFailed(this.error);

  @override
  List<Object?> get props => [error];
}
