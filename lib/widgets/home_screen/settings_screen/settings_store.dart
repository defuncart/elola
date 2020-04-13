import 'dart:ui';

import 'package:mobx/mobx.dart';

import 'package:elola/modules/user_settings/user_settings.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final ISettingsDatabase _settingsDatabase;

  _SettingsStore(this._settingsDatabase) {
    _isDarkMode = _settingsDatabase.isDarkMode;
    _language = _settingsDatabase.language;
  }

  @observable
  bool _isDarkMode;

  @computed
  bool get isDarkMode => _isDarkMode;

  // @action
  set isDarkMode(bool value) {
    if (_isDarkMode != value) {
      _isDarkMode = value;
      _settingsDatabase.isDarkMode = value;
    }
  }

  @observable
  Locale _language;

  @computed
  Locale get language => _language;

  // @action
  set language(Locale value) {
    _language = value;
    _settingsDatabase.language = value;
  }
}
