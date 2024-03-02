import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/data/data_sources/remote/implementation/movies_api.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/repository/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final MovieApi api;

  HomeRepositoryImpl({required this.api});

  @override
  Future<Either<List<Movie>, Failure>> getFeaturedMovies() async {
    final result = await api.fetchFeaturedMovies();
    return result.fold((apiResult) => left(apiResult as List<Movie>),
        (failure) => right(failure));
  }
}
