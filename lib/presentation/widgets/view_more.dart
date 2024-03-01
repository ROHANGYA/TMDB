import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class ViewMore extends StatelessWidget {
  const ViewMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: MyColors.charcoal),
      height: 100,
      width: 140,
      child: Center(
        child: Text(
          "View More ➜",
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
