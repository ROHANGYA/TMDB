import 'package:tmdb/constants.dart';

enum SearchFilterItems { all, movie, tv, person }

extension SortItemsExtension on SearchFilterItems {
  String get displayLabel {
    return switch (this) {
      SearchFilterItems.all => strings.allResults,
      SearchFilterItems.movie => strings.movies,
      SearchFilterItems.tv => strings.tv,
      SearchFilterItems.person => strings.person,
    };
  }

  String get qpiQuery {
    return name;
  }
}
