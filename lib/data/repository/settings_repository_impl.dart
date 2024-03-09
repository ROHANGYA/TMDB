import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tmdb/data/data_sources/local/implementation/settings_local.dart';
import 'package:tmdb/domain/repository/settings_repository.dart';

@Injectable(as: SettingsRepository)
class SettingsRepositoryImpl extends SettingsRepository {
  final SettingsLocal _settingsLocal;

  SettingsRepositoryImpl(this._settingsLocal);

  @override
  String getLanguageSetting() {
    return _settingsLocal.getLanguageSettings();
  }

  @override
  Future<Either<void, String>> saveLanguageSettings(
      {required String languagePreference}) async {
    final result = await _settingsLocal.saveLanguageSettings(
        languagePreference: languagePreference);
    return result.fold((success) => left(null), (failure) => right(failure));
  }
}
