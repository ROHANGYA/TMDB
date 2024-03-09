import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/di/init_di.dart';
import 'package:tmdb/domain/use_case/fetch_language_settings_use_case.dart';
import 'package:tmdb/domain/use_case/save_language_settings_use_case.dart';
import 'package:tmdb/generated/l10n.dart';
import 'package:tmdb/presentation/bloc/settings/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  LanguagesSupported? _currentLanguageValue;

  SettingsCubit() : super(SettingsLoading()) {
    // Fetch on Main init.
    _fetchAllSettings();
  }

  void _fetchAllSettings() async {
    Future.wait([_fetchLanguageSettings()]);
  }

  Future<void> _fetchLanguageSettings() async {
    final result = di.get<FetchLanguageSettingsUseCase>().execute();
    _currentLanguageValue = LanguagesSupported.values
        .firstWhere((element) => element.name == result);
    emit(SettingsLoaded(languagePreference: _currentLanguageValue));
  }

  void _saveLanguageSettings() async {
    await di
        .get<SaveLanguageSettingsUseCase>()
        .execute(
            languagePreference: _currentLanguageValue?.name ?? defaultLocale,
            onSuccess: () {
              emit(SettingsSavedSuccessfully());
            },
            onFailure: (String error) {
              emit(SettingsFailedToSave(error));
            })
        .whenComplete(() =>
            emit(SettingsLoaded(languagePreference: _currentLanguageValue)));
  }

  void applyLanguagePreferences(
      {required LanguagesSupported? languageSelected}) {
    _currentLanguageValue = languageSelected;
    S.load(Locale(
        _currentLanguageValue?.name ?? defaultLocale)); // Apply current locale.
    _saveLanguageSettings(); // Save Selection to storage.
  }

  // private set.
  LanguagesSupported? get currentLanguageValue => _currentLanguageValue;
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
