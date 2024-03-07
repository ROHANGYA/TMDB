import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/presentation/widgets/setting_option.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  LanguagesSupported? _currentLanguageValue = LanguagesSupported.values
      .firstWhere((element) => element.name == Intl.defaultLocale);

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
            SettingOption(
                label: strings.language,
                onTapAction: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, state) {
                          return AlertDialog(
                            title: Text(strings.language),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: LanguagesSupported.values
                                    .map((language) => ListTile(
                                          title: Text(
                                            language.label,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                          leading: Radio<LanguagesSupported>(
                                            value: language,
                                            groupValue: _currentLanguageValue,
                                            onChanged: (value) {
                                              state(() {
                                                _currentLanguageValue = value;
                                              });
                                            },
                                          ),
                                        ))
                                    .toList()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(strings.cancel)),
                              OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      S.load(Locale(
                                          _currentLanguageValue?.name ?? 'en'));
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(strings.apply))
                            ],
                          );
                        });
                      });
                }),
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

enum LanguagesSupported { en, fr }

extension LanguageSupportExtension on LanguagesSupported {
  String get label {
    return switch (this) {
      LanguagesSupported.fr => strings.francais,
      LanguagesSupported.en => strings.english,
    };
  }
}
