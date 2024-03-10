extension ListUtils on List<dynamic> {
  List<T>? tryCast<T>() {
    try {
      return List<T>.from(this);
    } catch (e) {
      return null;
    }
  }

  List<T> tryCastOrEmpty<T>() {
    return tryCast() ?? [];
  }
}
