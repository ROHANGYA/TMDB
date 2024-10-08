import 'package:flutter/material.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/presentation/bloc/home/featured_movies_cubit.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  late final FeaturedMoviesCubit _homeCubit;
  double maxHeaderHeight = 210;
  bool trigger = false;
  late ScrollController _scrollController;
  final ValueNotifier<double> opacity = ValueNotifier(0);
  final ValueNotifier<double> top = ValueNotifier(400);
  final ValueNotifier<double> top1 = ValueNotifier(400);

  @override
  void initState() {
    super.initState();

    _homeCubit.fetchTrendingMovies();
    _scrollController = ScrollController();
    _scrollController.addListener(scrollListenerOpacity);
    _scrollController.addListener(scrollListenerSearchBar);
  }

  scrollListenerOpacity() {
    if (maxHeaderHeight > _scrollController.offset &&
        _scrollController.offset > 1) {
      opacity.value = 1 - _scrollController.offset / maxHeaderHeight;
      top.value = 400 - _scrollController.offset;
    } else if (_scrollController.offset > maxHeaderHeight &&
        opacity.value != 1) {
      opacity.value = 0;
      top.value = 400;
    } else if (_scrollController.offset < 0 && opacity.value != 0) {
      opacity.value = 1;
      top.value = 0;
    }
  }

  scrollListenerSearchBar() {
    if (maxHeaderHeight > _scrollController.offset &&
        _scrollController.offset > 1) {
      top.value = 400 - _scrollController.offset;
      top1.value = 400 - _scrollController.offset * 1.5;
    } else if (_scrollController.offset > maxHeaderHeight && top.value != 400) {
      top.value = 400;
      top1.value = 400;
    } else if (_scrollController.offset < 0 && top.value != 0) {
      top.value = 0;
      top1.value = 0;
    } else {
      top.value = 400;
      top1.value = 400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 58, 58, 1.0),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollBehavior: const MaterialScrollBehavior(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  trigger = !trigger;
                });
              },
            ),
            title: ValueListenableBuilder<double>(
                valueListenable: opacity,
                builder: (context, value, child) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 1),
                    opacity: 1 - value,
                    child: Text(
                      S.current.tmdb.toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }),
            centerTitle: true,
            floating: false,
            pinned: true,
            expandedHeight: maxHeaderHeight,
            backgroundColor: const Color.fromRGBO(58, 58, 58, 1.0),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  color: const Color.fromRGBO(58, 58, 58, 1.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: ValueListenableBuilder<double>(
                            valueListenable: opacity,
                            builder: (context, value, child) {
                              return AnimatedOpacity(
                                duration: const Duration(milliseconds: 1),
                                opacity: value,
                                child: Text(
                                  S.current.theMovieDatabase,
                                  style: const TextStyle(
                                      fontSize: 30, color: Colors.white),
                                  textAlign: TextAlign.start,
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ValueListenableBuilder<double>(
                            valueListenable: top,
                            builder: (context, value, child) {
                              return SizedBox(
                                width: value,
                                child: SearchBar(
                                  controller: TextEditingController(),
                                  leading: const Icon(Icons.search_rounded),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
              //  titlePadding: EdgeInsets.zero,
              //  centerTitle: true,
              // title: Text("T   M   D   B"),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: const Color.fromRGBO(80, 80, 80, 1.0),
                    height: 200,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: const Color.fromRGBO(80, 80, 80, 1.0),
                    height: 200,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: const Color.fromRGBO(80, 80, 80, 1.0),
                    height: 200,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: const Color.fromRGBO(80, 80, 80, 1.0),
                    height: 200,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
