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

  static String get categorypeople => _getText('categorypeople');

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

  static String get insightsTabStatisticsLabel =>
      _getText('insightsTabStatisticsLabel');

  static String get insightsTabNotStarted => _getText('insightsTabNotStarted');

  static String get settingsTabTitle => _getText('settingsTabTitle');

  static String get settingsTabDarkModeLabel =>
      _getText('settingsTabDarkModeLabel');

  static String get settingsTabLanguageLabel =>
      _getText('settingsTabLanguageLabel');

  static String get settingsTabButtonResetData =>
      _getText('settingsTabButtonResetData');

  static String get favoritesNounScreenTitle =>
      _getText('favoritesNounScreenTitle');

  static String get gameSettingsBottomSheetLearnLabel =>
      _getText('gameSettingsBottomSheetLearnLabel');

  static String get gameSettingsBottomSheetReviseLabel =>
      _getText('gameSettingsBottomSheetReviseLabel');

  static String get gameSettingsBottomSheetDifficultLabel =>
      _getText('gameSettingsBottomSheetDifficultLabel');

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
    'categorypeople': 'People',
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
    'insightsTabStatisticsLabel': 'Statistics',
    'insightsTabNotStarted':
        'Your progress is being calculated. Please continue playing.',
    'settingsTabTitle': 'Settings',
    'settingsTabDarkModeLabel': 'Dark Mode',
    'settingsTabLanguageLabel': 'Language',
    'settingsTabButtonResetData': 'Delete all progress',
    'favoritesNounScreenTitle': 'Favorites',
    'gameSettingsBottomSheetLearnLabel': 'Learn',
    'gameSettingsBottomSheetReviseLabel': 'Revise',
    'gameSettingsBottomSheetDifficultLabel': 'Difficult Nouns',
    'gameCompletedTitle': 'Congratulations',
    'gameCompletedDescription': 'You scored %score\$d / %numberQuestions\$d!',
    'gameCompletedButtonPlayAgain': 'Play Again',
    'gameCompletedButtonReturnMainMenu': 'Return to Main Menu',
  };

  static Map<String, String> _deValues = {
    'appTitle': '¿El o La?',
    'generalPlay': '[ Play ÖÜ ]',
    'generalContinue': '[ Cöntinüe üäẞß ]',
    'generalCommingSoon': '[ Cöming Söön! üÄẞÜä ]',
    'categoryfoodDrink': '[ Fööd & Drink ẞÜÜÖÄ ]',
    'categorysport': '[ Spört ßÖẞ ]',
    'categorypeople': '[ Peöple äÜü ]',
    'homeTabTitle': '¿El o La?',
    'homeTabNounOfTheDayLabel': '[ Nöün öf the day ÜÖßüßÖ ]',
    'homeTabFavoritesLabel': '[ Favörites ẞÜöÖä ]',
    'homeTabFavoritesViewAllLabel': '[ View all ẞüßü ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Having difficülties with söme nöüns? Ädd them as favörites! ÄäüüäöÖöẞÖßßẞÄÖööü ]',
    'homeTabProgressLabel': '[ Prögress öüÄä ]',
    'homeTabProgressNotStarted':
        '[ Önce yöü ßegin learning, yöür överall prögress will ße displayed here. öÜüüÜößÖÖüÄÜäÄäüäÖöüü ]',
    'homeTabProgressViewAll': '[ View all nöüns ßööäüß ]',
    'tipsTabTitle': '[ Tips ẞä ]',
    'insightsTabTitle': '[ Insights ßäÄü ]',
    'insightsTabDifficultNounsLabel': '[ Difficült Nöüns ßÖööäÖ ]',
    'insightsTabStatisticsLabel': '[ Statistics ßÖßöẞ ]',
    'insightsTabNotStarted':
        '[ Yöür prögress is ßeing calcülated. Please cöntinüe playing. ÜäöÖßÄÜÄÜÜßäüÜÖÄẞß ]',
    'settingsTabTitle': '[ Settings üÄüẞ ]',
    'settingsTabDarkModeLabel': '[ Dark Möde äẞüÜö ]',
    'settingsTabLanguageLabel': '[ Langüage ßßÖä ]',
    'settingsTabButtonResetData': '[ Delete all prögress äüÜÄßöäÜ ]',
    'favoritesNounScreenTitle': '[ Favörites ÖÜßÖẞ ]',
    'gameSettingsBottomSheetLearnLabel': '[ Learn Üöü ]',
    'gameSettingsBottomSheetReviseLabel': '[ Revise ÖäÄ ]',
    'gameSettingsBottomSheetDifficultLabel': '[ Difficült Nöüns ÜßüüẞÜ ]',
    'gameCompletedTitle': '[ Cöngratülatiöns Äääüäü ]',
    'gameCompletedDescription':
        '[ Yöü scöred %score\$d / %numberQuestions\$d! üÜÜÄöẞßÜẞöößÖ ]',
    'gameCompletedButtonPlayAgain': '[ Play Ägain ẞÜöüÄ ]',
    'gameCompletedButtonReturnMainMenu': '[ Retürn tö Main Menü ÄößäßẞöÜ ]',
  };

  static Map<String, String> _plValues = {
    'appTitle': '¿El o La?',
    'generalPlay': '[ Płay ęŃ ]',
    'generalContinue': '[ Ćóńtińuę ęĆłć ]',
    'generalCommingSoon': '[ Ćómińg Śóóń! ńżŁćż ]',
    'categoryfoodDrink': '[ Fóód & Drińk ĄŹźóŹ ]',
    'categorysport': '[ Śpórt ÓĆń ]',
    'categorypeople': '[ Pęópłę żźś ]',
    'homeTabTitle': '¿El o La?',
    'homeTabNounOfTheDayLabel': '[ Ńóuń óf thę day łĘŃŚŹÓ ]',
    'homeTabFavoritesLabel': '[ Favóritęś ĆżżĄź ]',
    'homeTabFavoritesViewAllLabel': '[ Vięw ałł łĄźń ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Havińg diffićułtięś with śómę ńóuńś? Ądd thęm aś favóritęś! ęĆźŚśżĆĘĄĘęłŁąĄłĄŻ ]',
    'homeTabProgressLabel': '[ Prógręśś ąźĄń ]',
    'homeTabProgressNotStarted':
        '[ Óńćę yóu bęgiń łęarńińg, yóur óvęrałł prógręśś wiłł bę diśpłayęd hęrę. ŻŁŃżążłłŚśśńśźŁóńĘółś ]',
    'homeTabProgressViewAll': '[ Vięw ałł ńóuńś śĄŻŁśź ]',
    'tipsTabTitle': '[ Tipś Żó ]',
    'insightsTabTitle': '[ Ińśightś łóÓŻ ]',
    'insightsTabDifficultNounsLabel': '[ Diffićułt Ńóuńś ĄŚńźĄę ]',
    'insightsTabStatisticsLabel': '[ Śtatiśtićś ŃĆĘźĄ ]',
    'insightsTabNotStarted':
        '[ Yóur prógręśś iś bęińg ćałćułatęd. Płęaśę ćóńtińuę płayińg. ĄźĘŃąęĘęńÓĄżĘĄŁąŁŁ ]',
    'settingsTabTitle': '[ Śęttińgś śżśŚ ]',
    'settingsTabDarkModeLabel': '[ Dark Módę ĘźśĘł ]',
    'settingsTabLanguageLabel': '[ Łańguagę ĘĆąĄ ]',
    'settingsTabButtonResetData': '[ Dęłętę ałł prógręśś ĄÓęęąĆćę ]',
    'favoritesNounScreenTitle': '[ Favóritęś łćÓŚż ]',
    'gameSettingsBottomSheetLearnLabel': '[ Łęarń ńśŁ ]',
    'gameSettingsBottomSheetReviseLabel': '[ Ręviśę ŻćŹ ]',
    'gameSettingsBottomSheetDifficultLabel': '[ Diffićułt Ńóuńś óźćĘĆó ]',
    'gameCompletedTitle': '[ Ćóńgratułatióńś ŻęÓĄżŚ ]',
    'gameCompletedDescription':
        '[ Yóu śćóręd %score\$d / %numberQuestions\$d! żŹÓżĄĘŁęóĄĘĄŹ ]',
    'gameCompletedButtonPlayAgain': '[ Płay Ągaiń żŃęńś ]',
    'gameCompletedButtonReturnMainMenu': '[ Ręturń tó Maiń Męńu źęążĄĘłż ]',
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
