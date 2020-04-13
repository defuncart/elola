import 'dart:ui';

import 'package:elola/services/base_hive_database.dart';

import 'i_settings_database.dart';

/// A database of the player's device settings
class SettingsDatabase extends BaseHiveDatabase<dynamic> implements ISettingsDatabase {
  //// A name for the box
  String get boxName => 'settings';

  /// Returns whether dark mode is enabled
  bool get isDarkMode => box.get(_Keys.darkMode, defaultValue: _Defaults.darkMode);

  /// Sets whether dark mode is enabled
  set isDarkMode(bool value) => box.put(_Keys.darkMode, value);

  /// Returns the selected language for the ui
  Locale get language {
    final languageCode = box.get(_Keys.language, defaultValue: _Defaults.language);
    return Locale(languageCode);
  }

  /// Sets the selected language for the ui
  set language(Locale value) => box.put(_Keys.language, value?.languageCode);

  /// Returns the tts language
  String get ttsLanguage => box.get(_Keys.ttsLanguage, defaultValue: _Defaults.ttsLanguage);

  /// Sets the tts language
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
  static const darkMode = 'darkMode';
  static const language = 'language';
  static const ttsLanguage = 'ttsLanguage';
}

/// A class of defaults for each key
class _Defaults {
  static const darkMode = false;
  static const language = 'en';
  static const ttsLanguage = 'es-ES';
}
