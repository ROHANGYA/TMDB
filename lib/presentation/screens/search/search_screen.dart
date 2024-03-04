import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/domain/entity/movie.dart';
import 'package:tmdb/presentation/bloc/search/search_cubit.dart';
import 'package:tmdb/presentation/bloc/search/search_state.dart';
import 'package:tmdb/presentation/extensions/context_extensions.dart';
import 'package:tmdb/presentation/extensions/controller_extensions.dart';
import 'package:tmdb/presentation/screens/search/sort_items.dart';
import 'package:tmdb/presentation/widgets/circular_progress_indicator.dart';
import 'package:tmdb/presentation/widgets/generic_error.dart';
import 'package:tmdb/presentation/widgets/loading_failed_footer.dart';
import 'package:tmdb/presentation/widgets/movie_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchCubit _searchCubit;
  final ScrollController _scrollController = ScrollController();
  List<Movie> movies = List.empty(growable: true);

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
            preferredSize: const Size(300, 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                height: 35,
                child: Hero(
                  tag: "test",
                  child: SearchBar(
                    controller: TextEditingController(),
                    leading: const Icon(Icons.search_rounded),
                    hintText: strings.searchMovies,
                    textInputAction: TextInputAction.search,
                    trailing: [
                      Transform.translate(
                        offset: const Offset(0, -2),
                        child: PopupMenuButton(
                          offset: Offset(0, 15),
                          icon: const Icon(
                            Icons.sort_rounded,
                          ),
                          itemBuilder: (BuildContext context) {
                            return SortItems.values
                                .map((sortItems) => PopupMenuItem(
                                    child: Text(sortItems.displayLabel)))
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
            movies = state.data;
          } else if (state is LoadingFailed) {
            movies = state.prevData;
            if (movies.isEmpty) {
              return Center(
                  child: SizedBox(
                      height: 200,
                      child: GenericError(errorDescription: state.error)));
            }
          }

          return GridView.builder(
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: context.width / context.height / 0.85),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: movies.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == movies.length) {
                  // is Last
                  if (state is Loading) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 90),
                      child: CircularLoadingIndicator(),
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
                    child: MovieCard(
                        title: movies[index].title,
                        imageUrl: movies[index].posterPath),
                  );
                }
              });
        },
      ),
    );
  }
}
