import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class RatingIndicator extends StatelessWidget {
  const RatingIndicator({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: value,
            color: MyColors.crayolaGold,
            backgroundColor: MyColors.charcoal,
            strokeCap: StrokeCap.round,
          ),
          Text(
            value.toStringAsFixed(1),
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
