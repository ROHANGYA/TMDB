import 'package:injectable/injectable.dart';
import 'package:tmdb/domain/repository/settings_repository.dart';

@singleton
class FetchLanguageSettingsUseCase {
  final SettingsRepository _repository;

  FetchLanguageSettingsUseCase(this._repository);

  String execute() => _repository.getLanguageSetting();
}
