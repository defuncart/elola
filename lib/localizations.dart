import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class AppLocalizations {
  static String get appTitle => _getText('appTitle');

  static String get generalPlay => _getText('generalPlay');

  static String get generalContinue => _getText('generalContinue');

  static String get generalCommingSoon => _getText('generalCommingSoon');

  static String get categoryfoodDrink => _getText('categoryfoodDrink');

  static String get categorysport => _getText('categorysport');

  static String get homeTabTitle => _getText('homeTabTitle');

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

  static String get tipsTabTitle => _getText('tipsTabTitle');

  static String get insightsTabTitle => _getText('insightsTabTitle');

  static String get insightsTabDifficultNounsLabel =>
      _getText('insightsTabDifficultNounsLabel');

  static String get insightsTabDifficultNounsNotStarted =>
      _getText('insightsTabDifficultNounsNotStarted');

  static String get settingsTabTitle => _getText('settingsTabTitle');

  static String get settingsTabDarkModeLabel =>
      _getText('settingsTabDarkModeLabel');

  static String get settingsTabLanguageLabel =>
      _getText('settingsTabLanguageLabel');

  static String get settingsTabButtonResetData =>
      _getText('settingsTabButtonResetData');

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
    'generalCommingSoon': 'Coming Soon!',
    'categoryfoodDrink': 'Food & Drink',
    'categorysport': 'Sport',
    'homeTabTitle': '¿El o La?',
    'homeTabNounOfTheDayLabel': 'Noun of the day',
    'homeTabFavoritesLabel': 'Favorites',
    'homeTabFavoritesViewAllLabel': 'View all',
    'homeTabFavoritesAddSomeLabel':
        'Having difficulties with some nouns? Add them as favorites!',
    'homeTabProgressLabel': 'Progress',
    'homeTabProgressNotStarted':
        'Once you begin learning, your overall progress will be displayed here.',
    'homeTabProgressViewAll': 'View all nouns',
    'tipsTabTitle': 'Tips',
    'insightsTabTitle': 'Insights',
    'insightsTabDifficultNounsLabel': 'Difficult Nouns',
    'insightsTabDifficultNounsNotStarted':
        'Once you begin learning, nouns you find difficult will be displayed here.',
    'settingsTabTitle': 'Settings',
    'settingsTabDarkModeLabel': 'Dark Mode',
    'settingsTabLanguageLabel': 'Language',
    'settingsTabButtonResetData': 'Delete all progress',
    'favoritesNounScreenTitle': 'Favorites',
    'gameCompletedTitle': 'Congratulations',
    'gameCompletedDescription': 'You scored %score\$d / %numberQuestions\$d!',
    'gameCompletedButtonPlayAgain': 'Play Again',
    'gameCompletedButtonReturnMainMenu': 'Return to Main Menu',
  };

  static Map<String, String> _deValues = {
    'appTitle': '¿El o La?',
    'generalPlay': '[ Play ẞä ]',
    'generalContinue': '[ Cöntinüe ÜääÖ ]',
    'generalCommingSoon': '[ Cöming Söön! ääÜüÄ ]',
    'categoryfoodDrink': '[ Fööd & Drink ßüÖÖẞ ]',
    'categorysport': '[ Spört ÜÖü ]',
    'homeTabTitle': '¿El o La?',
    'homeTabNounOfTheDayLabel': '[ Nöün öf the day üÖüÜÖä ]',
    'homeTabFavoritesLabel': '[ Favörites äÜÜäÜ ]',
    'homeTabFavoritesViewAllLabel': '[ View all ÖÄüä ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Having difficülties with söme nöüns? Ädd them as favörites! ÖÄẞäüööüöÜÄääẞẞÜöÜ ]',
    'homeTabProgressLabel': '[ Prögress ÖẞßÜ ]',
    'homeTabProgressNotStarted':
        '[ Önce yöü ßegin learning, yöür överall prögress will ße displayed here. äÄöÖÄẞẞÖÖäẞÖäüßÄẞäÜÜß ]',
    'homeTabProgressViewAll': '[ View all nöüns ßüẞüÖÖ ]',
    'tipsTabTitle': '[ Tips Üä ]',
    'insightsTabTitle': '[ Insights ßöÄÄ ]',
    'insightsTabDifficultNounsLabel': '[ Difficült Nöüns ÄäüüÄä ]',
    'insightsTabDifficultNounsNotStarted':
        '[ Önce yöü ßegin learning, nöüns yöü find difficült will ße displayed here. ÄÄÜÜüööößäöẞÜßöüüẞẞÜÜß ]',
    'settingsTabTitle': '[ Settings Üßöẞ ]',
    'settingsTabDarkModeLabel': '[ Dark Möde ßßööä ]',
    'settingsTabLanguageLabel': '[ Langüage ÖöÄß ]',
    'settingsTabButtonResetData': '[ Delete all prögress ÖẞÖüßüöü ]',
    'favoritesNounScreenTitle': '[ Favörites ÖßÜÜß ]',
    'gameCompletedTitle': '[ Cöngratülatiöns ßßääüÖ ]',
    'gameCompletedDescription':
        '[ Yöü scöred %score\$d / %numberQuestions\$d! ÜÖÜßüäÄöÜöÜöß ]',
    'gameCompletedButtonPlayAgain': '[ Play Ägain ßÖẞßẞ ]',
    'gameCompletedButtonReturnMainMenu': '[ Retürn tö Main Menü ÄÜäÜüẞÄÄ ]',
  };

  static Map<String, String> _plValues = {
    'appTitle': '¿El o La?',
    'generalPlay': '[ Płay óŹ ]',
    'generalContinue': '[ Ćóńtińuę ńÓŁĘ ]',
    'generalCommingSoon': '[ Ćómińg Śóóń! śżńćż ]',
    'categoryfoodDrink': '[ Fóód & Drińk ŹŹÓńś ]',
    'categorysport': '[ Śpórt ęĄĄ ]',
    'homeTabTitle': '¿El o La?',
    'homeTabNounOfTheDayLabel': '[ Ńóuń óf thę day ąĄŻęćŃ ]',
    'homeTabFavoritesLabel': '[ Favóritęś ŚłŃąć ]',
    'homeTabFavoritesViewAllLabel': '[ Vięw ałł ńźÓż ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Havińg diffićułtięś with śómę ńóuńś? Ądd thęm aś favóritęś! ąĄŹęŃśŁĆÓńĘÓńęĆóŁź ]',
    'homeTabProgressLabel': '[ Prógręśś Óćłż ]',
    'homeTabProgressNotStarted':
        '[ Óńćę yóu bęgiń łęarńińg, yóur óvęrałł prógręśś wiłł bę diśpłayęd hęrę. óÓćńśąĄęĄóŁśśŁĘżżĆĘĘŃ ]',
    'homeTabProgressViewAll': '[ Vięw ałł ńóuńś ąłżóŻĆ ]',
    'tipsTabTitle': '[ Tipś ęż ]',
    'insightsTabTitle': '[ Ińśightś śąÓń ]',
    'insightsTabDifficultNounsLabel': '[ Diffićułt Ńóuńś ŁŁłŚŹŚ ]',
    'insightsTabDifficultNounsNotStarted':
        '[ Óńćę yóu bęgiń łęarńińg, ńóuńś yóu fińd diffićułt wiłł bę diśpłayęd hęrę. ŃęźńłŻłąńÓÓŹŃĄŻĘŹĆąęźŚ ]',
    'settingsTabTitle': '[ Śęttińgś ÓóźŚ ]',
    'settingsTabDarkModeLabel': '[ Dark Módę ęĘńĘż ]',
    'settingsTabLanguageLabel': '[ Łańguagę łĘĄń ]',
    'settingsTabButtonResetData': '[ Dęłętę ałł prógręśś źŚŹńęÓŹŻ ]',
    'favoritesNounScreenTitle': '[ Favóritęś ŻŁźąś ]',
    'gameCompletedTitle': '[ Ćóńgratułatióńś ĄŃĄŹŹĘ ]',
    'gameCompletedDescription':
        '[ Yóu śćóręd %score\$d / %numberQuestions\$d! ŁŻćżŃĘŻęńęćĘŹ ]',
    'gameCompletedButtonPlayAgain': '[ Płay Ągaiń źłńŃę ]',
    'gameCompletedButtonReturnMainMenu': '[ Ręturń tó Maiń Męńu ŁćźłĄŹźń ]',
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
