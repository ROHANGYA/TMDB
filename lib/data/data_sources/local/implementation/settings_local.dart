import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/constants.dart';
import 'package:tmdb/data/data_sources/local/db/hive_db.dart';

@injectable
class SettingsLocal {
  final HiveLocalStorage _localStorage;
  static const languageSettingsKey = 'Language_settings_key';

  SettingsLocal(this._localStorage);

  Future<Either<void, String>> saveLanguageSettings(
      {required String languagePreference}) async {
    try {
      return left(await _localStorage.hiveBox
          .put(languageSettingsKey, languagePreference));
    } catch (e) {
      return right(e.toString());
    }
  }

  String getLanguageSettings() {
    return _localStorage.hiveBox.get(languageSettingsKey) ?? defaultLocale;
  }
}
