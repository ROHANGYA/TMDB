import 'package:flutter/material.dart';
import 'package:tmdb/presentation/widgets/movie_thumbnail_loader.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.title, required this.imageUrl});

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieThumbnailLoader(imageUrl: imageUrl),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 120,
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
