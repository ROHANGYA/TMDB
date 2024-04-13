import 'package:equatable/equatable.dart';
import 'package:tmdb/domain/entity/movie_details.dart';

class MovieDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends MovieDetailsState {}

class Loaded extends MovieDetailsState {
  final MovieDetails movie;

  Loaded(this.movie);

  @override
  List<Object?> get props => [movie];
}

class LoadingFailed extends MovieDetailsState {
  final String error;

  LoadingFailed(this.error);

  @override
  List<Object?> get props => [error];
}
