import 'package:flutter/material.dart';
import 'package:tmdb/presentation/widgets/movie_thumbnail_loader.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      this.unboundedText = false});

  final String title;
  final String imageUrl;
  final bool unboundedText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieThumbnailLoader(
          imageUrl: imageUrl,
          type: ThumbnailType.card,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 120,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
            maxLines: unboundedText ? null : 2,
            overflow: unboundedText ? null : TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
