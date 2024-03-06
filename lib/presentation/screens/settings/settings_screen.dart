import 'package:flutter/material.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/presentation/widgets/setting_option.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            const SizedBox(
              height: 40,
            ),
            SettingOption(label: strings.language, onTapAction: () {}),
            const Divider(
              height: 2,
            ),
            SettingOption(label: strings.darkMode, onTapAction: () {}),
          ],
        ),
      ),
    );
  }
}
