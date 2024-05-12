import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/presentation/bloc/details/movie_details_cubit.dart';
import 'package:tmdb/presentation/bloc/details/movie_details_state.dart';
import 'package:tmdb/presentation/widgets/circular_loading_indicator.dart';
import 'package:tmdb/presentation/widgets/details_screen_back_button.dart';
import 'package:tmdb/presentation/widgets/generic_error.dart';
import 'package:tmdb/presentation/widgets/generic_tag.dart';
import 'package:tmdb/presentation/widgets/movie_thumbnail_loader.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, this.extraData});

  final Object? extraData;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late MovieDetailsCubit _movieDetailsCubit;
  late String? _movieId;
  bool _decorationImageError = false;

  @override
  void initState() {
    super.initState();
    _movieId = widget.extraData as String?;
    _movieDetailsCubit = BlocProvider.of<MovieDetailsCubit>(context);
    _movieDetailsCubit.fetchMovieDetails(movieId: _movieId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is Loading) {
              return const Stack(
                children: [
                  DetailsScreenBackButton(),
                  Center(
                    child: CircularLoadingIndicator(),
                  ),
                ],
              );
            } else if (state is LoadingFailed) {
              return Center(
                  child: SizedBox(
                      height: 250,
                      child: GenericError(
                        errorDescription: state.error,
                        onRetryAction: () {
                          _movieDetailsCubit.refresh(movieId: _movieId);
                        },
                      )));
            } else if (state is Loaded) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Container(
                  decoration: BoxDecoration(
                      image: _decorationImageError
                          ? null
                          : DecorationImage(
                              alignment: Alignment.topCenter,
                              onError: (obj, stackTrace) {
                                setState(() {
                                  _decorationImageError = true;
                                });
                              },
                              image: NetworkImage(
                                  "${ApiUrl.imageUrlOriginal}/${state.movie.backgroundImagePath}"))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DetailsScreenBackButton(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: _decorationImageError ? 30 : 200,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                MovieThumbnailLoader(
                                    imageUrl:
                                        "${ApiUrl.imageUrl500w}/${state.movie.foregroundImagePath}",
                                    type: ThumbnailType.card),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.movie.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '(${state.movie.year})',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                color: MyColors.charcoal),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        state.movie.runtime,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                color: MyColors.charcoal),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              runSpacing: 5,
                              children: state.movie.tags
                                  .map((tag) => GenericTag(label: tag))
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              state.movie.description,
                              style: Theme.of(context).textTheme.displaySmall,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      )),
    );
  }
}
