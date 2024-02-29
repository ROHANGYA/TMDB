import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class MovieCategoryLabel extends StatelessWidget {
  const MovieCategoryLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        label,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold, color: MyColors.crayolaGold),
      ),
    );
  }
}
