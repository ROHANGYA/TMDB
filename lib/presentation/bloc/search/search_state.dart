import 'package:equatable/equatable.dart';
import 'package:tmdb/domain/entity/movie.dart';

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
  final List<Movie> data;
  final bool isSearchEmpty;

  Loaded({required this.data, required this.isSearchEmpty});

  @override
  List<Object?> get props => [data, isSearchEmpty];
}

class LoadingFailed extends SearchState {
  final List<Movie> prevData;
  final String error;

  LoadingFailed({required this.prevData, required this.error});

  @override
  List<Object?> get props => [prevData, error];
}
