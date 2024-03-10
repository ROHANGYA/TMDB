import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class SearchEmptyPlaceholder extends StatelessWidget {
  const SearchEmptyPlaceholder({super.key, required this.isSearchEmpty});

  final bool isSearchEmpty;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Icon(
              Icons.local_movies_outlined,
              size: 80,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              isSearchEmpty
                  ? strings.searchMoviePrompt
                  : strings.noResultsFound,
              textAlign: TextAlign.center,
              style: Theme
                  .of(context)
                  .textTheme
                  .displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
