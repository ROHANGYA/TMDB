import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/presentation/widgets/fallback_image_error.dart';

class ActorCard extends StatelessWidget {
  const ActorCard({super.key, required this.name, required this.profilePath});

  final String name;
  final String profilePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
            child: FadeInImage.assetNetwork(
          image: "${ApiUrl.imageUrl500w}$profilePath",
          placeholder: Assets.imagePlaceholder,
          placeholderColor: MyColors.charcoal,
          placeholderFit: BoxFit.cover,
          fit: BoxFit.cover,
          width: 130,
          height: 130,
          imageErrorBuilder: (context, error, stackTrace) {
            return const FallbackImageError(width: 130, height: 130);
          },
        )),
        SizedBox(
          width: 120,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
