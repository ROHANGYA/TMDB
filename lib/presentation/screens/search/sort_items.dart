import 'package:tmdb/constants.dart';

enum SortItems {
  ascPopularity,
  descPopularity,
  ascTitle,
  descTitle,
  ascRelease,
  descRelease;
}

extension SortItemsExtension on SortItems {
  String get displayLabel {
    return switch (this) {
      SortItems.ascPopularity =>
      "${strings.ascendingAbbreviated} ${strings.popularity}",
      SortItems.descPopularity =>
      "${strings.descendingAbbreviated} ${strings.popularity}",
      SortItems.ascTitle => "${strings.ascendingAbbreviated} ${strings.title}",
      SortItems.descTitle =>
      "${strings.descendingAbbreviated} ${strings.title}",
      SortItems.ascRelease =>
      "${strings.ascendingAbbreviated} ${strings.releaseDate}",
      SortItems.descRelease =>
      "${strings.descendingAbbreviated} ${strings.releaseDate}",
    };
  }

  String get qpiQuery {
    return switch (this) {
      SortItems.ascPopularity => "popularity.asc",
      SortItems.descPopularity => "popularity.desc",
      SortItems.ascTitle => "title.asc",
      SortItems.descTitle => "title.desc",
      SortItems.ascRelease => "primary_release_date.asc",
      SortItems.descRelease => "primary_release_date.desc",
    };
  }
}