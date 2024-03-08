import 'package:tmdb/constants.dart';
import 'package:tmdb/data/data_sources/local/db/hive_db.dart';

class SettingsLocal {
  final HiveLocalStorage _localStorage;
  static const languageSettingsKey = 'Language_settings_key';

  SettingsLocal(this._localStorage);

  void saveLanguageSettings({required String languagePreference}) async {
    await _localStorage.hiveBox.put(languageSettingsKey, languagePreference);
  }

  String getLanguageSettings() {
    return _localStorage.hiveBox.get(languageSettingsKey) ?? defaultLocale;
  }
}
