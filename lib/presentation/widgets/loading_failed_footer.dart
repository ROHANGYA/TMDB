import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class LoadingFailedFooter extends StatelessWidget {
  const LoadingFailedFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          strings.loadingFailed,
          style:
              Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 13),
        ),
        const SizedBox(
          height: 10,
        ),
        OutlinedButton(
            onPressed: () {},
            child: Text(
              "Retry",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 13),
            ))
      ],
    );
  }
}
