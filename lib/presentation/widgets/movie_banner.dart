import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/presentation/widgets/movie_thumbnail_loader.dart';

class MovieBanner extends StatelessWidget {
  const MovieBanner({super.key, required this.title, required this.imageUrl});

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MovieThumbnailLoader(
          imageUrl: imageUrl,
          type: ThumbnailType.banner,
        ),
        Container(
          width: 330,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  colors: [
                    Colors.transparent,
                    MyColors.charcoal,
                  ],
                  stops: [
                    0,
                    0.99
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        )
      ],
    );
  }
}
