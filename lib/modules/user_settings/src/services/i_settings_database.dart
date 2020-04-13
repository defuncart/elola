import 'package:elola/services/i_database.dart';

/// A database of the player's device settings
abstract class ISettingsDatabase implements IDatabase {
  /// Returns whether dark mode is enabled
  bool get isDarkMode;

  /// Sets whether dark mode is enabled
  set isDarkMode(bool value);

  /// Returns the selected language for the ui
  String get language;

  /// Sets the selected language for the ui
  set language(String value);

  /// Returns the tts language
  String get ttsLanguage;

  /// Sets the tts language
  set ttsLanguage(String value);
}
