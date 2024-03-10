import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class FallbackImageError extends StatelessWidget {
  const FallbackImageError(
      {super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.shade200,
      child: Image.asset(
        Assets.noImagePlaceholder,
        fit: BoxFit.fitHeight,
        width: width,
        height: height,
      ),
    );
  }
}
