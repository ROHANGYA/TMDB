import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class MovieThumbnailLoader extends StatelessWidget {
  const MovieThumbnailLoader({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color.fromRGBO(80, 80, 80, 1.0),
          height: 200,
          width: 140,
          child: Image.network(
            fit: BoxFit.fill,
            "${ApiUrl.imageBaseUrl}$imageUrl",
          ),
        ));
  }
}
