import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tmdb/constants.dart';

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            width: 20,
            child: LoadingIndicator(
                indicatorType: Indicator.lineSpinFadeLoader,
                colors: [MyColors.charcoal],
                strokeWidth: 0,
                backgroundColor: Colors.transparent,
                pathBackgroundColor: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            strings.loading,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
