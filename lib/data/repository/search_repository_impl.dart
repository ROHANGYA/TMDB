import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/data/data_sources/remote/implementation/movies_api.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/repository/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final MovieApi api;

  SearchRepositoryImpl({required this.api});

  @override
  Future<Either<List<Movie>, Failure>> searchMovie(
      {required int page, required String searchQuery}) async {
    final result = await api.searchMovie(page: page, searchQuery: searchQuery);
    return result.fold((apiResult) => left(apiResult as List<Movie>),
        (failure) => right(failure));
  }
}
