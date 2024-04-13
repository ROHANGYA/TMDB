class MovieDetails {
  final String title;
  final String runtime;
  final String year;
  final String description;
  final List<String> tags;
  final String backgroundImagePath;
  final String foregroundImagePath;

  MovieDetails(
      {required this.title,
      required this.runtime,
      required this.year,
      required this.description,
      required this.tags,
      required this.backgroundImagePath,
      required this.foregroundImagePath});
}
