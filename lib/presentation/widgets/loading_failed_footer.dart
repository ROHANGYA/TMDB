import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class LoadingFailedFooter extends StatelessWidget {
  const LoadingFailedFooter({super.key, required this.onRetryAction});

  final Function onRetryAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          strings.loadingFailed,
          style:
              Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 13),
        ),
        const SizedBox(
          height: 10,
        ),
        OutlinedButton(
            onPressed: () {
              onRetryAction.call();
            },
            child: Text(
              strings.retry,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 13),
            ))
      ],
    );
  }
}
