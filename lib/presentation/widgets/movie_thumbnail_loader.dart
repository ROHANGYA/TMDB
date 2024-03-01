import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class MovieThumbnailLoader extends StatelessWidget {
  const MovieThumbnailLoader(
      {super.key, required this.imageUrl, this.originalQuality = false});

  final String imageUrl;
  final bool originalQuality;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: MyColors.darkBlue,
        height: 200,
        width: 140,
        child: Image.network(
          fit: BoxFit.fill,
          "${originalQuality ? ApiUrl.imageUrlOriginal : ApiUrl.imageUrl500w}$imageUrl",
        ),
      ),
    );
  }
}
