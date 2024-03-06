import 'package:flutter/material.dart';
import 'package:tmdb/generated/l10n.dart';

abstract class MyColors {
  static const vermillionRed = Color(0xFFc84843);
  static const crayolaGold = Color(0xFFe1c19b);
  static const persianPlum = Color(0xFF6d201c);
  static const darkTan = Color(0xFF949054);
  static const charcoal = Color(0xFF2f3d53);
  static const darkBlue = Color(0xff171f26);
}

final strings = S.current;
const connectTimeout = Duration(seconds: 5);
const receiveTimeout = Duration(seconds: 3);

abstract class ApiUrl {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String trendingMoviesApi = 'trending/movie/day';
  static const String discoverMoviesApi = 'discover/movie';
  static const String searchMovie = 'search/movie';
  static const String imageBaseUrl = 'https://image.tmdb.org/';
  static const String imageUrl500w = '${imageBaseUrl}t/p/w500';
  static const String imageUrlOriginal = '${imageBaseUrl}t/p/original';
}

abstract class Assets {
  static const String moviePoster = 'assets/movies_poster.jpg';
  static const String imagePlaceholder = 'assets/image_placeholder.png';
  static const String movieFilm = 'assets/movie_film.png';
}
