import 'package:elola/configs/constants.dart' as constants;
import 'package:flutter_core_logic/flutter_core_logic.dart' show BaseHiveDatabase;

import 'i_settings_database.dart';

/// A database of the player's device settings
class SettingsDatabase extends BaseHiveDatabase<dynamic> implements ISettingsDatabase {
  String get boxName => 'settings';

  bool get hasOnboarded => box.get(_Keys.hasOnboarded, defaultValue: _Defaults.hasOnboarded);

  set hasOnboarded(bool value) => box.put(_Keys.hasOnboarded, value);

  bool get isDarkMode => box.get(_Keys.darkMode, defaultValue: _Defaults.darkMode);

  set isDarkMode(bool value) => box.put(_Keys.darkMode, value);

  String get language => box.get(_Keys.language, defaultValue: _Defaults.language);

  set language(String value) => box.put(_Keys.language, value);

  String get ttsLanguage => box.get(_Keys.ttsLanguage, defaultValue: _Defaults.ttsLanguage);

  set ttsLanguage(String value) => box.put(_Keys.ttsLanguage, value);

  /// Custom initialization called after init()
  @override
  Future<void> initialize() async {
    final defaults = {
      _Keys.darkMode: _Defaults.darkMode,
      _Keys.language: _Defaults.language,
      _Keys.ttsLanguage: _Defaults.ttsLanguage,
    };

    for (final kvp in defaults.entries) {
      if (!box.containsKey(kvp.key)) {
        await box.put(kvp.key, kvp.value);
      }
    }
  }
}

/// A class of keys used to store values
class _Keys {
  static const hasOnboarded = 'hasOnboarded';
  static const darkMode = 'darkMode';
  static const language = 'language';
  static const ttsLanguage = 'ttsLanguage';
}

/// A class of defaults for each key
class _Defaults {
  static const hasOnboarded = false;
  static const darkMode = false;
  static get language => constants.defaultLanguage;
  static const ttsLanguage = 'es-ES';
}
