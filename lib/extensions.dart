extension IntExtensions on int {
  String getFormattedMovieRuntime() {
    final int hour = this ~/ 60;
    final int minutes = this % 60;
    return '${hour.toString().padLeft(2, "0")}H, ${minutes.toString().padLeft(2, "0")}Min';
  }
}
