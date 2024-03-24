import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class GenericTag extends StatelessWidget {
  const GenericTag({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          color: MyColors.charcoal,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: MyColors.charcoal, width: 2)),
      child: Text(
        label,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: MyColors.crayolaGold, fontWeight: FontWeight.bold),
      ),
    );
  }
}
