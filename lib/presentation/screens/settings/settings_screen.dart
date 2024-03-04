import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 120,
              pinned: true,
              forceElevated: false,
              flexibleSpace: FlexibleSpaceBar(
                background: const ColoredBox(color: MyColors.darkBlue),
                centerTitle: true,
                titlePadding: const EdgeInsets.only(bottom: 10),
                title: Text(
                  strings.settings,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            )
          ];
        },
        body: ListView(
          children: [
            Container(
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: MyColors.vermillionRed),
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: MyColors.vermillionRed),
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: MyColors.vermillionRed),
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: MyColors.vermillionRed),
            )
          ],
        ),
      ),
    );
  }
}
