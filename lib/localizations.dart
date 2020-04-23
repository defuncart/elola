import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class AppLocalizations {
  static String get appTitle => _getText('appTitle');

  static String get generalPlay => _getText('generalPlay');

  static String get generalContinue => _getText('generalContinue');

  static String get settingsTabDarkModeLabel =>
      _getText('settingsTabDarkModeLabel');

  static String get settingsTabLanguageLabel =>
      _getText('settingsTabLanguageLabel');

  static String get generalCommingSoon => _getText('generalCommingSoon');

  static String get categoryfoodFruit => _getText('categoryfoodFruit');

  static String get categoryfoodVegetable => _getText('categoryfoodVegetable');

  static String get categoryfood => _getText('categoryfood');

  static String get homeTabNounOfTheDayLabel =>
      _getText('homeTabNounOfTheDayLabel');

  static String get homeTabFavoritesLabel => _getText('homeTabFavoritesLabel');

  static String get homeTabFavoritesViewAllLabel =>
      _getText('homeTabFavoritesViewAllLabel');

  static String get homeTabFavoritesAddSomeLabel =>
      _getText('homeTabFavoritesAddSomeLabel');

  static String get homeTabProgressLabel => _getText('homeTabProgressLabel');

  static String get homeTabProgressNotStarted =>
      _getText('homeTabProgressNotStarted');

  static String get homeTabProgressViewAll =>
      _getText('homeTabProgressViewAll');

  static String get favoritesNounScreenTitle =>
      _getText('favoritesNounScreenTitle');

  static String get gameCompletedTitle => _getText('gameCompletedTitle');

  static String gameCompletedDescription({
    @required int score,
    @required int numberQuestions,
  }) {
    String text = _getText('gameCompletedDescription');
    if (score != null) {
      text = text.replaceAll("%score\$d", score.toString());
    }
    if (numberQuestions != null) {
      text = text.replaceAll("%numberQuestions\$d", numberQuestions.toString());
    }
    return text;
  }

  static String get gameCompletedButtonPlayAgain =>
      _getText('gameCompletedButtonPlayAgain');

  static String get gameCompletedButtonReturnMainMenu =>
      _getText('gameCompletedButtonReturnMainMenu');

  static Map<String, String> _localizedValues;

  static Map<String, String> _enValues = {
    'appTitle': '¿El o La?',
    'generalPlay': 'Play',
    'generalContinue': 'Continue',
    'settingsTabDarkModeLabel': 'Dark Mode',
    'settingsTabLanguageLabel': 'Language',
    'generalCommingSoon': 'Coming Soon!',
    'categoryfoodFruit': 'Fruit',
    'categoryfoodVegetable': 'Vegetables',
    'categoryfood': 'Food',
    'homeTabNounOfTheDayLabel': 'Noun of the day',
    'homeTabFavoritesLabel': 'Favorites',
    'homeTabFavoritesViewAllLabel': 'View all',
    'homeTabFavoritesAddSomeLabel':
        'Having difficulties with some nouns? Add them as favorites!',
    'homeTabProgressLabel': 'Progress',
    'homeTabProgressNotStarted':
        'Once you begin learning, your overall progress will be displayed here.',
    'homeTabProgressViewAll': 'View all nouns',
    'favoritesNounScreenTitle': 'Favorites',
    'gameCompletedTitle': 'Congratulations',
    'gameCompletedDescription': 'You scored %score\$d / %numberQuestions\$d!',
    'gameCompletedButtonPlayAgain': 'Play Again',
    'gameCompletedButtonReturnMainMenu': 'Return to Main Menu',
  };

  static Map<String, String> _deValues = {
    'appTitle': '¿El o La?',
    'generalPlay': '[ Play Öü ]',
    'generalContinue': '[ Cöntinüe ßẞẞö ]',
    'settingsTabDarkModeLabel': '[ Dark Möde ßäÜüÜ ]',
    'settingsTabLanguageLabel': '[ Langüage öÄÄÖ ]',
    'generalCommingSoon': '[ Cöming Söön! äüÖßÄ ]',
    'categoryfoodFruit': '[ Früit ßÜÖ ]',
    'categoryfoodVegetable': '[ Vegetaßles öẞÄÜÄ ]',
    'categoryfood': '[ Fööd Üö ]',
    'homeTabNounOfTheDayLabel': '[ Nöün öf the day öäääöä ]',
    'homeTabFavoritesLabel': '[ Favörites Üäẞẞö ]',
    'homeTabFavoritesViewAllLabel': '[ View all öÖßẞ ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Having difficülties with söme nöüns? Ädd them as favörites! ßöÖÜÜöäüßÄüöäÜÄẞÄü ]',
    'homeTabProgressLabel': '[ Prögress üẞöü ]',
    'homeTabProgressNotStarted':
        '[ Önce yöü ßegin learning, yöür överall prögress will ße displayed here. ẞÄÄüöẞööẞöüẞäẞẞüÜöÜöä ]',
    'homeTabProgressViewAll': '[ View all nöüns ÜäßÜÖÄ ]',
    'favoritesNounScreenTitle': '[ Favörites ẞÖẞÜÖ ]',
    'gameCompletedTitle': '[ Cöngratülatiöns ÄüÄÖöß ]',
    'gameCompletedDescription':
        '[ Yöü scöred %score\$d / %numberQuestions\$d! ÄÜäÖẞÖßÖßßßöÜ ]',
    'gameCompletedButtonPlayAgain': '[ Play Ägain ÜßöÖÜ ]',
    'gameCompletedButtonReturnMainMenu': '[ Retürn tö Main Menü ÄÄßÄÜẞüß ]',
  };

  static Map<String, String> _plValues = {
    'appTitle': '¿El o La?',
    'generalPlay': '[ Płay Źó ]',
    'generalContinue': '[ Ćóńtińuę ŃŹŻó ]',
    'settingsTabDarkModeLabel': '[ Dark Módę ŚóąŚź ]',
    'settingsTabLanguageLabel': '[ Łańguagę ĆĄąę ]',
    'generalCommingSoon': '[ Ćómińg Śóóń! źĄąńĆ ]',
    'categoryfoodFruit': '[ Fruit ĄĄĘ ]',
    'categoryfoodVegetable': '[ Vęgętabłęś łćŚżó ]',
    'categoryfood': '[ Fóód ńć ]',
    'homeTabNounOfTheDayLabel': '[ Ńóuń óf thę day łęóżńŻ ]',
    'homeTabFavoritesLabel': '[ Favóritęś ąŁśŚł ]',
    'homeTabFavoritesViewAllLabel': '[ Vięw ałł ĘŁłŹ ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Havińg diffićułtięś with śómę ńóuńś? Ądd thęm aś favóritęś! żŹŁÓęĘźĘŁłćŻŻŹęćłŃ ]',
    'homeTabProgressLabel': '[ Prógręśś ńżĄĘ ]',
    'homeTabProgressNotStarted':
        '[ Óńćę yóu bęgiń łęarńińg, yóur óvęrałł prógręśś wiłł bę diśpłayęd hęrę. ÓŹĄĄŻĆąĆśŁćĆĆłŻŃńŚĆŻż ]',
    'homeTabProgressViewAll': '[ Vięw ałł ńóuńś ććŻĘŃę ]',
    'favoritesNounScreenTitle': '[ Favóritęś ĆźĆĘÓ ]',
    'gameCompletedTitle': '[ Ćóńgratułatióńś łŃźńśŃ ]',
    'gameCompletedDescription':
        '[ Yóu śćóręd %score\$d / %numberQuestions\$d! śńźŚŻŻŁŃŻćńĆź ]',
    'gameCompletedButtonPlayAgain': '[ Płay Ągaiń ĘżńżĆ ]',
    'gameCompletedButtonReturnMainMenu': '[ Ręturń tó Maiń Męńu ŁĘŻąęłÓŁ ]',
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
