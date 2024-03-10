import 'dart:convert';

import 'package:tmdb/domain/entity/actor.dart';

class ActorResponse extends Actor {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String originalName;
  final double popularity;

  // final List<MovieResponse> knownFor;

  ActorResponse({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required super.name,
    required this.originalName,
    required this.popularity,
    required super.profilePath,
    //required this.knownFor,
  });

  factory ActorResponse.fromRawJson(String str) =>
      ActorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ActorResponse.fromJson(Map<String, dynamic> json) => ActorResponse(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"] ?? "-",
        name: json["name"] ?? "-",
        originalName: json["original_name"] ?? "-",
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"] ?? "",
        // knownFor: json["known_for"] == null
        //     ? []
        //     : List<MovieResponse>.from(
        //         json["known_for"].map((x) => MovieResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        //"known_for": List<MovieResponse>.from(knownFor.map((x) => x.toJson())),
      };
}
