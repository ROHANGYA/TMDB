import 'package:equatable/equatable.dart';
import 'package:tmdb/presentation/bloc/settings/settings_cubit.dart';

class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final LanguagesSupported? languagePreference;

  SettingsLoaded({required this.languagePreference});

  @override
  List<Object?> get props => [languagePreference];
}

class SettingsSavedSuccessfully extends SettingsState {}

class SettingsFailedToSave extends SettingsState {
  final String error;

  SettingsFailedToSave(this.error);

  @override
  List<Object?> get props => [error];
}
