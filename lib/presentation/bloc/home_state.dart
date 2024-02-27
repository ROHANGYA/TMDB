import 'package:equatable/equatable.dart';
import 'package:tmdb/domain/entity/featured_movie.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends HomeState {}

class Loaded extends HomeState {
  final List<FeaturedMovie> featuredMovies;

  Loaded(this.featuredMovies);

  @override
  List<Object?> get props => [featuredMovies];
}

class LoadingFailed extends HomeState {
  final String error;

  LoadingFailed(this.error);

  @override
  List<Object?> get props => [error];
}
