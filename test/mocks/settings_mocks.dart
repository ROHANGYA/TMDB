import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb/domain/repository/settings_repository.dart';

class MockSettingsRepository extends Mock implements SettingsRepository {
  @override
  String getLanguageSetting() {
    return 'en';
  }

  @override
  Future<Either<void, String>> saveLanguageSettings(
      {required String languagePreference}) async {
    return left(null);
  }
}
