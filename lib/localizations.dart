import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class AppLocalizations {
  static String get appTitle => _getText('appTitle');

  static String get generalPlay => _getText('generalPlay');

  static String get generalContinue => _getText('generalContinue');

  static String get homeTabViewAllNouns => _getText('homeTabViewAllNouns');

  static String get settingsTabDarkModeLabel =>
      _getText('settingsTabDarkModeLabel');

  static String get settingsTabLanguageLabel =>
      _getText('settingsTabLanguageLabel');

  static String get generalCommingSoon => _getText('generalCommingSoon');

  static String get categoryfoodFruit => _getText('categoryfoodFruit');

  static Map<String, String> _localizedValues;

  static Map<String, String> _enValues = {
    'appTitle': '¿El o La?',
    'generalPlay': 'Play',
    'generalContinue': 'Continue',
    'homeTabViewAllNouns': 'View all nouns',
    'settingsTabDarkModeLabel': 'Dark Mode',
    'settingsTabLanguageLabel': 'Language',
    'generalCommingSoon': 'Coming Soon!',
    'categoryfoodFruit': 'Fruit',
  };

  static Map<String, String> _deValues = {
    'appTitle': '[ ¿El o La? ßÖüẞẞ ]',
    'generalPlay': '[ Play äẞ ]',
    'generalContinue': '[ Cöntinüe öäÖÄ ]',
    'homeTabViewAllNouns': '[ View all nöüns üẞÜẞßß ]',
    'settingsTabDarkModeLabel': '[ Dark Möde öüÖüü ]',
    'settingsTabLanguageLabel': '[ Langüage ÜẞÜü ]',
    'generalCommingSoon': '[ Cöming Söön! ßüßüÄ ]',
    'categoryfoodFruit': '[ Früit öüÖ ]',
  };

  static Map<String, String> _plValues = {
    'appTitle': '[ ¿El o La? łłŻżś ]',
    'generalPlay': '[ Płay ńź ]',
    'generalContinue': '[ Ćóńtińuę ŁÓŁŚ ]',
    'homeTabViewAllNouns': '[ Vięw ałł ńóuńś ĆŻźńÓŹ ]',
    'settingsTabDarkModeLabel': '[ Dark Módę ŃśŹĆÓ ]',
    'settingsTabLanguageLabel': '[ Łańguagę łłżó ]',
    'generalCommingSoon': '[ Ćómińg Śóóń! óęąŃć ]',
    'categoryfoodFruit': '[ Fruit łŹć ]',
  };

  static Map<String, Map<String, String>> _allValues = {
    'en': _enValues,
    'de': _deValues,
    'pl': _plValues,
  };

  AppLocalizations(Locale locale) {
    _locale = locale;
    _localizedValues = null;
  }

  static Locale _locale;

  static String _getText(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Locale get currentLocale => _locale;

  static String get currentLanguage => _locale.languageCode;

  static String getText(String key) => _getText(key);

  static Future<AppLocalizations> load(Locale locale) async {
    final translations = AppLocalizations(locale);
    _localizedValues = _allValues[locale.toString()];
    return translations;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  static final Set<Locale> supportedLocals = {
    Locale('en'),
    Locale('de'),
    Locale('pl'),
  };

  @override
  bool isSupported(Locale locale) => supportedLocals.contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
