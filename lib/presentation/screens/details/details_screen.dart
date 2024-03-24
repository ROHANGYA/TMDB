import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/presentation/widgets/generic_tag.dart';
import 'package:tmdb/presentation/widgets/rating_indicator.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: NetworkImage(
                      "${ApiUrl.imageUrl500w}/xRd1eJIDe7JHO5u4gtEYwGn5wtf.jpg"))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: MyColors.darkBlue,
                    size: 30,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 290,
                          child: Text(
                            'Godzilla X Kong: New Empire haha ass',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        const RatingIndicator(value: 0.68)
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '(2024)',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Wrap(
                      runSpacing: 5,
                      children: [
                        GenericTag(label: "Action"),
                        GenericTag(label: "Adventure"),
                        GenericTag(label: "Kaiju"),
                        GenericTag(label: "Test"),
                        GenericTag(label: "Science Fiction"),
                        GenericTag(label: "Haha")
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Following their explosive showdown, Godzilla and Kong must reunite against a colossal undiscovered threat hidden within our world, challenging their very existence – and our own.',
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
