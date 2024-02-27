class FeaturedMovie {
  String name;
  String imageUrl;

  FeaturedMovie({required this.name, required this.imageUrl});
}

final mockFeatureMovies = [
  FeaturedMovie(
      name: "The Shawshank Redemption",
      imageUrl: "https://picsum.photos/200/300"),
  FeaturedMovie(
      name: "Avengers: Infinity War",
      imageUrl: "https://picsum.photos/200/300"),
  FeaturedMovie(
      name: "The Brothers Sun", imageUrl: "https://picsum.photos/200/300"),
  FeaturedMovie(name: "Titanic", imageUrl: "https://picsum.photos/200/300"),
  FeaturedMovie(
      name: "Jonny English is back", imageUrl: "https://picsum.photos/200/300"),
];
