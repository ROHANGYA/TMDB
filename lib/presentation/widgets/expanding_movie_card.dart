import 'package:flutter/material.dart';
import 'package:tmdb/presentation/widgets/movie_card.dart';

class ExpandingMovieCard extends StatefulWidget {
  const ExpandingMovieCard(
      {super.key, required this.title, required this.imageUrl});

  final String title;
  final String imageUrl;

  @override
  State<ExpandingMovieCard> createState() => _ExpandingMovieCardState();
}

class _ExpandingMovieCardState extends State<ExpandingMovieCard> {
  bool isExpanded = false;
  bool isExpandedFinished = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isExpanded ? 300 : 140,
      onEnd: () {
        setState(() {
          isExpandedFinished = true;
        });
      },
      duration: const Duration(milliseconds: 400),
      child: SizedBox(
        width: isExpanded ? 300 : null,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
              isExpandedFinished = false;
            });
          },
          child: Row(
            children: [
              MovieCard(title: widget.title, imageUrl: widget.imageUrl),
              isExpanded && isExpandedFinished
                  ? SizedBox(
                      width: 120,
                      child: Column(children: [
                        Text(
                          "Test Description of a movie.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displaySmall,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Action • Adventure",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displaySmall,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )
                      ]),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
