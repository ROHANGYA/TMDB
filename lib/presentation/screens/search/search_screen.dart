import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/domain/entity/actor.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/domain/entity/tv.dart';
import 'package:tmdb/presentation/bloc/search/search_cubit.dart';
import 'package:tmdb/presentation/bloc/search/search_state.dart';
import 'package:tmdb/presentation/extensions/controller_extensions.dart';
import 'package:tmdb/presentation/screens/search/search_filter_items.dart';
import 'package:tmdb/presentation/widgets/actor_card.dart';
import 'package:tmdb/presentation/widgets/circular_loading_indicator.dart';
import 'package:tmdb/presentation/widgets/generic_error.dart';
import 'package:tmdb/presentation/widgets/loading_failed_footer.dart';
import 'package:tmdb/presentation/widgets/movie_card.dart';
import 'package:tmdb/presentation/widgets/search_empty_placeholder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchCubit _searchCubit;
  final ScrollController _scrollController = ScrollController();
  List<Movie> movies = List.empty(growable: true);
  List<Tv> tv = List.empty(growable: true);
  List<Actor> actors = List.empty(growable: true);
  final ValueNotifier<bool> isSearchEmpty = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _searchCubit = BlocProvider.of<SearchCubit>(context);

    // initial page.
    _searchCubit.loadPage();

    _scrollController.addListener(() {
      if (_scrollController.isAtBottom()) {
        _searchCubit.loadPage();
      }
    });

    _searchCubit.searchTextController.addListener(_searchListener);
  }

  bool get _isCurrentListEmpty {
    return switch (_searchCubit.searchFilterItem) {
      SearchFilterItems.movie => movies.isEmpty,
      SearchFilterItems.tv => tv.isEmpty,
      SearchFilterItems.person => actors.isEmpty,
    };
  }

  int get _currentListLength {
    return switch (_searchCubit.searchFilterItem) {
      SearchFilterItems.movie => movies.length,
      SearchFilterItems.tv => tv.length,
      SearchFilterItems.person => actors.length,
    };
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _searchListener() {
    isSearchEmpty.value = _searchCubit.searchTextController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
            preferredSize: const Size(double.maxFinite, 0),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: SizedBox(
                width: double.infinity,
                height: 35,
                child: Hero(
                  tag: searchBarHeroTag,
                  child: SearchBar(
                    controller: _searchCubit.searchTextController,
                    leading: const Icon(Icons.search_rounded),
                    hintText: strings.searchMovies,
                    textInputAction: TextInputAction.done,
                    trailing: [
                      ValueListenableBuilder<bool>(
                        valueListenable: isSearchEmpty,
                        builder: (BuildContext context, bool isSearchEmpty,
                            Widget? child) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: isSearchEmpty
                                ? const SizedBox()
                                : IconButton(
                                    onPressed: () {
                                      _searchCubit.searchTextController.clear();
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      size: 20,
                                    )),
                          );
                        },
                      ),
                      Transform.translate(
                        offset: const Offset(0, -2),
                        child: PopupMenuButton(
                          offset: const Offset(0, 15),
                          icon: const Icon(
                            Icons.sort_rounded,
                          ),
                          itemBuilder: (BuildContext context) {
                            return SearchFilterItems.values
                                .map((filterItem) => PopupMenuItem(
                                      onTap: () {
                                        _searchCubit.setSearchFilterItem(
                                            filter: filterItem);
                                      },
                                      child: Text(
                                        filterItem.displayLabel,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall
                                            ?.copyWith(
                                                color: _searchCubit
                                                            .searchFilterItem ==
                                                        filterItem
                                                    ? MyColors.crayolaGold
                                                    : Colors.white,
                                                fontWeight: _searchCubit
                                                            .searchFilterItem ==
                                                        filterItem
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                      ),
                                    ))
                                .toList();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is Loading) {
            if (state.isLoadingNextPage == false) {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 110),
                child: CircularLoadingIndicator(
                  loadingIndicatorWidth: 35,
                ),
              ));
            }
          } else if (state is Loaded) {
            movies = state.movieData;
            tv = state.tvData;
            actors = state.actorData;
            if (_isCurrentListEmpty) {
              return SearchEmptyPlaceholder(isSearchEmpty: state.isSearchEmpty);
            }
          } else if (state is LoadingFailed) {
            movies = state.prevMovieData;
            tv = state.prevTvData;
            actors = state.prevActorData;
            if (_isCurrentListEmpty) {
              return Center(
                  child: SizedBox(
                      height: 200,
                      child: GenericError(
                        errorDescription: state.error,
                        onRetryAction: () {
                          _searchCubit.refresh();
                        },
                      )));
            }
          }

          return MasonryGridView.count(
            controller: _scrollController,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.only(
                left: 50, right: 50, top: 10, bottom: 200),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _currentListLength + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == _currentListLength) {
                // is Last
                if (state is Loading) {
                  return const SizedBox(
                    height: 100,
                    child: Center(child: CircularLoadingIndicator()),
                  );
                } else if (state is LoadingFailed) {
                  return LoadingFailedFooter(
                    onRetryAction: () {
                      _searchCubit.loadPage();
                    },
                  );
                } else {
                  return const SizedBox();
                }
              } else {
                return Center(
                  child: switch (_searchCubit.searchFilterItem) {
                    SearchFilterItems.movie => MovieCard(
                        title: movies[index].title,
                        imageUrl: movies[index].posterPath,
                        unboundedText: true,
                      ),
                    SearchFilterItems.tv => MovieCard(
                        title: tv[index].name,
                        imageUrl: tv[index].posterPath,
                        unboundedText: true,
                      ),
                    SearchFilterItems.person => ActorCard(
                        name: actors[index].name,
                        profilePath: actors[index].profilePath)
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
