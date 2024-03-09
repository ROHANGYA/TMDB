import 'package:dartz/dartz.dart';

abstract class SettingsRepository {
  String getLanguageSetting();

  Future<Either<void, String>> saveLanguageSettings(
      {required String languagePreference});
}
