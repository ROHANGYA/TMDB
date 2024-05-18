import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb/data/models/failure.dart';
import 'package:tmdb/data/models/movie_details_response.dart';
import 'package:tmdb/domain/repository/details_repository.dart';

class MockMovieDetailsRepository extends Mock implements DetailsRepository {
  @override
  Future<Either<MovieDetailsResponse, Failure>> getMovieDetails(
      {required String movieId}) async {
    return left(MovieDetailsResponse(
        adult: false,
        backdropPath: "backdropPath",
        budget: 12,
        genres: [],
        homepage: "homepage",
        id: 1,
        imdbId: "1",
        originalLanguage: "originalLanguage",
        originalTitle: "originalTitle",
        overview: "overview",
        posterPath: "posterPath",
        productionCompanies: [],
        productionCountries: [],
        releaseDate: DateTime.now(),
        revenue: 12,
        runtime: 12,
        spokenLanguages: [],
        status: "status",
        tagline: "tagline",
        title: "title",
        video: false));
  }
}
