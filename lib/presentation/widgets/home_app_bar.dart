import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/presentation/router/navigation_paths.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
      {super.key,
      required this.maxHeaderHeight,
      required this.innerBoxIsScrolled});

  final double maxHeaderHeight;
  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.account_circle_outlined),
        onPressed: () {},
      ),
      actions: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: innerBoxIsScrolled
              ? IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {
                    context.go(NavigationPaths.search);
                  },
                )
              : const SizedBox(),
        )
      ],
      pinned: true,
      expandedHeight: maxHeaderHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(Assets.moviePoster, fit: BoxFit.fill),
            ),
            Transform.translate(
              offset: const Offset(0, 1),
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                    Colors.transparent,
                    MyColors.darkBlue.withOpacity(0.7),
                    MyColors.darkBlue
                  ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.clamp))),
            ),
          ],
        ),
        title: Text(strings.tmdb.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(letterSpacing: 28, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
