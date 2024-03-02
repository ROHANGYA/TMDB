import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/presentation/bloc/home_cubit.dart';
import 'package:tmdb/presentation/bloc/home_state.dart';
import 'package:tmdb/presentation/widgets/circular_progress_indicator.dart';
import 'package:tmdb/presentation/widgets/generic_error.dart';
import 'package:tmdb/presentation/widgets/home_app_bar.dart';
import 'package:tmdb/presentation/widgets/movie_card.dart';
import 'package:tmdb/presentation/widgets/movie_category_label.dart';
import 'package:tmdb/presentation/widgets/view_more.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _homeCubit;
  double maxHeaderHeight = 140;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.fetchTrendingMovies();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: NestedScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollBehavior: const MaterialScrollBehavior(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            HomeAppBar(
                maxHeaderHeight: maxHeaderHeight,
                innerBoxIsScrolled: innerBoxIsScrolled)
          ];
        },
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 35,
                child: Hero(
                  tag: "test",
                  child: SearchBar(
                    controller: TextEditingController(),
                    leading: const Icon(Icons.search_rounded),
                    hintText: strings.search,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MovieCategoryLabel(label: strings.featuredMovies),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (state is Loading) {
                return const CircularLoadingIndicator();
              } else if (state is LoadingFailed) {
                return GenericError(errorDescription: state.error);
              } else if (state is Loaded) {
                return SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: ListView.separated(
                    itemCount: state.featuredMovies.length + 1,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final isFirst = index == 0;
                      final isLastItem = index == state.featuredMovies.length;
                      final movie =
                          isLastItem ? null : state.featuredMovies[index];
                      return isLastItem
                          ? const Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: ViewMore(),
                            )
                          : Padding(
                              padding: EdgeInsets.only(left: isFirst ? 30 : 0),
                              child: MovieCard(
                                  title: movie!.title,
                                  imageUrl: movie.posterPath),
                            );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            }),
            const SizedBox(
              height: 30,
            ),
            MovieCategoryLabel(label: strings.comingSoon),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (state is Loading) {
                return const CircularLoadingIndicator();
              } else if (state is LoadingFailed) {
                return GenericError(errorDescription: state.error);
              } else if (state is Loaded) {
                return SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: ListView.separated(
                    itemCount: state.featuredMovies.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = state.featuredMovies[index];
                      final isFirst = index == 0;
                      final isLast = index == state.featuredMovies.length - 1;
                      return Padding(
                        padding: EdgeInsets.only(
                            left: isFirst ? 30 : 0, right: isLast ? 30 : 0),
                        child: MovieCard(
                            title: movie.title, imageUrl: movie.posterPath),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                  ),
                );
              }
              return const SizedBox();
            }),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
