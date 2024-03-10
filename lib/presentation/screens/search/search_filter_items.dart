import 'package:tmdb/constants.dart';
import 'package:tmdb/domain/entity/actor.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/entity/tv.dart';

enum SearchFilterItems { movie, tv, person }

extension SortItemsExtension on SearchFilterItems {
  String get displayLabel {
    return switch (this) {
      SearchFilterItems.movie => strings.movies,
      SearchFilterItems.tv => strings.tv,
      SearchFilterItems.person => strings.person,
    };
  }

  String get qpiQuery {
    return name;
  }

  Type get entityType {
    switch (this) {
      case SearchFilterItems.movie:
        return Movie;
      case SearchFilterItems.tv:
        return Tv;
      case SearchFilterItems.person:
        return Actor;
    }
  }
}
