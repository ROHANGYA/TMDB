import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/presentation/bloc/settings/settings_cubit.dart';
import 'package:tmdb/presentation/bloc/settings/settings_state.dart';
import 'package:tmdb/presentation/keys/widget_keys.dart';
import 'package:tmdb/presentation/widgets/circular_loading_indicator.dart';
import 'package:tmdb/presentation/widgets/setting_option.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SettingsCubit _settingsCubit;
  LanguagesSupported? _currentLanguageValue;

  @override
  void initState() {
    super.initState();
    _settingsCubit = BlocProvider.of<SettingsCubit>(context);
    _currentLanguageValue = _settingsCubit.currentLanguageValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.settingsScaffoldKey,
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
        body: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (BuildContext context, state) {
            if (state is SettingsFailedToSave) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  margin: snackBarMargin,
                  content: Text(
                    strings.settingSFailedToSave,
                  )));
            } else if (state is SettingsSavedSuccessfully) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  margin: snackBarMargin,
                  content: Text(
                    strings.settingsSavedSuccessfully,
                  )));
            }
          },
          builder: (BuildContext context, Object? state) {
            if (state is SettingsLoading) {
              return const Center(child: CircularLoadingIndicator());
            } else if (state is SettingsLoaded) {
              _currentLanguageValue = state.languagePreference;
              return ListView(
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
                                                leading:
                                                    Radio<LanguagesSupported>(
                                                  value: language,
                                                  groupValue:
                                                      _currentLanguageValue,
                                                  onChanged: (value) {
                                                    state(() {
                                                      _currentLanguageValue =
                                                          value;
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
                                          _settingsCubit
                                              .applyLanguagePreferences(
                                                  languageSelected:
                                                      _currentLanguageValue);
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
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
