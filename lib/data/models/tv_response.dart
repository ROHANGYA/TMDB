import 'dart:convert';

import 'package:tmdb/domain/entity/tv.dart';

class TvResponse extends Tv {
  final bool adult;

  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final DateTime? firstAirDate;
  final double voteAverage;
  final int voteCount;

  TvResponse(
      {required this.adult,
      required super.backdropPath,
      required this.genreIds,
      required this.id,
      required this.originCountry,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.popularity,
      required super.posterPath,
      required this.firstAirDate,
      required super.name,
      required this.voteAverage,
      required this.voteCount});

  factory TvResponse.fromRawJson(String str) =>
      TvResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TvResponse.fromJson(Map<String, dynamic> json) => TvResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? "",
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"] ?? "-",
        originalName: json["original_name"] ?? "-",
        overview: json["overview"] ?? "-",
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"] ?? "",
        firstAirDate: json["first_air_date"].toString().isNotEmpty
            ? DateTime.parse(json["first_air_date"])
            : null,
        name: json["name"] ?? "-",
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date":
            "${firstAirDate?.year.toString().padLeft(4, '0')}-${firstAirDate?.month.toString().padLeft(2, '0')}-${firstAirDate?.day.toString().padLeft(2, '0')}",
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
