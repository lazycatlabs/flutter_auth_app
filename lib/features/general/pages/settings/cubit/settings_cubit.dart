import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> with MainBoxMixin {
  SettingsCubit() : super(const SettingsStateLoading());

  void loadSettings() => emit(SettingsStateSuccess(_settings));

  DataHelper get settings => _settings;

  void updateTheme(ActiveTheme activeTheme) {
    addData(MainBoxKeys.theme, activeTheme.name);
    emit(SettingsStateSuccess(_settings));
  }

  void updateLanguage(String type) {
    /// Update locale code
    addData(MainBoxKeys.locale, type);
    emit(SettingsStateSuccess(_settings));
  }

  ActiveTheme getActiveTheme() => ActiveTheme.values.singleWhere(
    (element) =>
        element.name == (getData(MainBoxKeys.theme) ?? ActiveTheme.system.name),
  );

  DataHelper get _settings => DataHelper(
    activeTheme: getActiveTheme(),
    type: getData(MainBoxKeys.locale) ?? 'en',
  );
}

@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = SettingsStateLoading;
  const factory SettingsState.success(DataHelper data) = SettingsStateSuccess;
  const factory SettingsState.failure(String message) = SettingsStateFailure;
}
