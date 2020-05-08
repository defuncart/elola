import 'package:flutter_core_logic/flutter_core_logic.dart' show IDatabase;

/// A database of the player's device settings
abstract class ISettingsDatabase implements IDatabase {
  /// Returns whether onboarding is completed
  bool get hasOnboarded;

  /// Sets whether onboarding is completed
  set hasOnboarded(bool value);

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
