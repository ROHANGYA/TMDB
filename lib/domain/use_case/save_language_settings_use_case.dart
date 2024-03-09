import 'package:injectable/injectable.dart';
import 'package:tmdb/domain/repository/settings_repository.dart';

@singleton
class SaveLanguageSettingsUseCase {
  final SettingsRepository _repository;

  SaveLanguageSettingsUseCase(this._repository);

  Future<void> execute(
      {required String languagePreference,
      required Function onSuccess,
      required Function(String) onFailure}) async {
    final result = await _repository.saveLanguageSettings(
        languagePreference: languagePreference);
    return result.fold(
        (success) => onSuccess.call(), (error) => onFailure.call(error));
  }
}
