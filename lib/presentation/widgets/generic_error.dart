import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class GenericError extends StatelessWidget {
  const GenericError({super.key, required this.errorDescription});

  final String errorDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Icons.warning_rounded,
            color: MyColors.darkBlue,
            size: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(strings.errorHasOccurred,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 300,
            child: Text(
              errorDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
