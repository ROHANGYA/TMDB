import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tmdb/constants.dart';

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator(
      {super.key,
      this.loadingIndicatorWidth = 20,
      this.requireLoadingText = true});

  final double loadingIndicatorWidth;
  final bool requireLoadingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: loadingIndicatorWidth,
          child: const LoadingIndicator(
              indicatorType: Indicator.lineSpinFadeLoader,
              colors: [MyColors.charcoal],
              strokeWidth: 0,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.black),
        ),
        SizedBox(
          height: requireLoadingText ? 5 : 0,
        ),
        requireLoadingText
            ? Text(
                strings.loading,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 12),
              )
            : const SizedBox()
      ],
    );
  }
}
