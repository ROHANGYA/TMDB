import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/presentation/bloc/home_cubit.dart';
import 'package:tmdb/presentation/bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _homeCubit;
  double maxHeaderHeight = 140;
  bool trigger = false;
  late ScrollController _scrollController;
  final ValueNotifier<double> opacity = ValueNotifier(0);
  final ValueNotifier<double> top = ValueNotifier(400);
  final ValueNotifier<double> top1 = ValueNotifier(400);

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
      backgroundColor: const Color.fromRGBO(58, 58, 58, 1.0),
      body: NestedScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollBehavior: const MaterialScrollBehavior(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: innerBoxIsScrolled
                  ? Text(S.current.tmdb.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(letterSpacing: 28))
                  : null,
              leading: IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    trigger = !trigger;
                  });
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings_rounded),
                  color: Colors.white,
                  onPressed: () {},
                )
              ],
              pinned: true,
              expandedHeight: maxHeaderHeight,
              backgroundColor: const Color.fromRGBO(0, 0, 0, 1.0),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: const Color.fromRGBO(58, 58, 58, 1.0),
                ),
                title: Text(S.current.tmdb.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(letterSpacing: 28)),
              ),
            )
          ];
        },
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 35,
                child: SearchBar(
                  controller: TextEditingController(),
                  leading: const Icon(Icons.search_rounded),
                  hintText: "Search",
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MovieCategoryLabel(label: S.current.featuredMovies),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadingFailed) {
                return Column(
                  children: [Text("Error: ${state.error}")],
                );
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
                      return Padding(
                        padding: EdgeInsets.only(left: isFirst ? 30 : 0),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: const Color.fromRGBO(80, 80, 80, 1.0),
                                  height: 200,
                                  child: Image.network(
                                    fit: BoxFit.fitHeight,
                                    movie.imageUrl,
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 90,
                              child: Text(
                                movie.name,
                                style: Theme.of(context).textTheme.displaySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
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
            MovieCategoryLabel(label: S.current.comingSoon),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LoadingFailed) {
                return Column(
                  children: [Text("Error: ${state.error}")],
                );
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
                      return Padding(
                        padding: EdgeInsets.only(left: isFirst ? 30 : 0),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: const Color.fromRGBO(80, 80, 80, 1.0),
                                  height: 200,
                                  child: Image.network(
                                    fit: BoxFit.fitHeight,
                                    movie.imageUrl,
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 90,
                              child: Text(
                                movie.name,
                                style: Theme.of(context).textTheme.displaySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
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
