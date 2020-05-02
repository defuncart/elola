import 'package:mobx/mobx.dart';

import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/modules/user_settings/user_settings.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  final ISettingsDatabase _settingsDatabase;
  final IPlayerDataService _playerDataService;

  _SettingsStore(this._settingsDatabase, this._playerDataService) {
    _isDarkMode = _settingsDatabase.isDarkMode;
    _language = _settingsDatabase.language;
  }

  @observable
  bool _isDarkMode;

  @computed
  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    if (_isDarkMode != value) {
      _isDarkMode = value;
      _settingsDatabase.isDarkMode = value;
    }
  }

  @observable
  String _language;

  @computed
  String get language => _language;

  set language(String value) {
    _language = value;
    _settingsDatabase.language = value;
  }

  Future<void> resetPlayerData() async => await _playerDataService.reset();
}
