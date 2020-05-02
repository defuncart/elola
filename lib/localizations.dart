import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class AppLocalizations {
  static String get appTitle => _getText('appTitle');

  static String get generalPlay => _getText('generalPlay');

  static String get generalContinue => _getText('generalContinue');

  static String get generalCommingSoon => _getText('generalCommingSoon');

  static String get generalGetStarted => _getText('generalGetStarted');

  static String get categoryfoodDrink => _getText('categoryfoodDrink');

  static String get categorysport => _getText('categorysport');

  static String get categorypeople => _getText('categorypeople');

  static String get onboardingStartDescriptionLabel =>
      _getText('onboardingStartDescriptionLabel');

  static String get onboardingEndTitelLabel =>
      _getText('onboardingEndTitelLabel');

  static String get onboardingEndDescriptionLabel =>
      _getText('onboardingEndDescriptionLabel');

  static String get onboardingEndTestInfoLabel =>
      _getText('onboardingEndTestInfoLabel');

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
    'generalGetStarted': 'Get started',
    'categoryfoodDrink': 'Food & Drink',
    'categorysport': 'Sport',
    'categorypeople': 'People',
    'onboardingStartDescriptionLabel':
        'Test your knowledge on spanish articles',
    'onboardingEndTitelLabel': 'Congratulations',
    'onboardingEndDescriptionLabel':
        'You are now ready to get started with ¿El o La?.',
    'onboardingEndTestInfoLabel':
        'As ¿El o La? is presently in development, all content is subject to change. Your feedback is greatly appreciated!',
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
    'appTitle': '[ ¿El o La? ßüÖäÜ ]',
    'generalPlay': '[ Play Öü ]',
    'generalContinue': '[ Cöntinüe ẞäÜÖ ]',
    'generalCommingSoon': '[ Cöming Söön! ẞẞÜüÜ ]',
    'generalGetStarted': '[ Get started ÜöüÖü ]',
    'categoryfoodDrink': '[ Fööd & Drink ßääÖü ]',
    'categorysport': '[ Spört ẞẞÖ ]',
    'categorypeople': '[ Peöple üüß ]',
    'onboardingStartDescriptionLabel':
        '[ Test yöür knöwledge ön spanish articles ÖÖüÜßßüßäÜÜÜ ]',
    'onboardingEndTitelLabel': '[ Cöngratülatiöns ẞẞÄÜüẞ ]',
    'onboardingEndDescriptionLabel':
        '[ Yöü are nöw ready tö get started with ¿El o La?. öÜßüüÄööößäẞöüß ]',
    'onboardingEndTestInfoLabel':
        '[ Äs ¿El o La? is presently in develöpment, all cöntent is süßject tö change. Yöür feedßack is greatly appreciated! ÜÜÜÜÜÜßÄöääÄäääßÜäÜääÄöÜÖẞööüöẞÖäẞ ]',
    'homeTabTitle': '[ ¿El o La? öääüä ]',
    'homeTabNounOfTheDayLabel': '[ Nöün öf the day ÜßÄÄöß ]',
    'homeTabFavoritesLabel': '[ Favörites öÜüüÄ ]',
    'homeTabFavoritesViewAllLabel': '[ View all ÖÖÜä ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Having difficülties with söme nöüns? Ädd them as favörites! ÜäÜÄÖöääßÖÜÜööÄößÜ ]',
    'homeTabProgressLabel': '[ Prögress ÜäÖÜ ]',
    'homeTabProgressNotStarted':
        '[ Önce yöü ßegin learning, yöür överall prögress will ße displayed here. ẞÄÜüÖäẞöÖÖöäÖöääẞẞäßß ]',
    'homeTabProgressViewAll': '[ View all nöüns ÄÜßÄöẞ ]',
    'tipsTabTitle': '[ Tips äÜ ]',
    'insightsTabTitle': '[ Insights ÜÄÜß ]',
    'insightsTabDifficultNounsLabel': '[ Difficült Nöüns ÄÖäÄäß ]',
    'insightsTabStatisticsLabel': '[ Statistics üäÖöÜ ]',
    'insightsTabNotStarted':
        '[ Yöür prögress is ßeing calcülated. Please cöntinüe playing. üÜÜüÄßüÖẞÄÄäÜÖÖßẞü ]',
    'settingsTabTitle': '[ Settings ÜÜäÖ ]',
    'settingsTabDarkModeLabel': '[ Dark Möde ẞÜÄÄß ]',
    'settingsTabLanguageLabel': '[ Langüage öÜÄß ]',
    'settingsTabButtonResetData': '[ Delete all prögress ÄÄäẞäÄöö ]',
    'favoritesNounScreenTitle': '[ Favörites öäÖüÖ ]',
    'gameSettingsBottomSheetLearnLabel': '[ Learn ööü ]',
    'gameSettingsBottomSheetReviseLabel': '[ Revise öÜÜ ]',
    'gameSettingsBottomSheetDifficultLabel': '[ Difficült Nöüns ÖÜöÜüÄ ]',
    'gameCompletedTitle': '[ Cöngratülatiöns üüÄÄÖß ]',
    'gameCompletedDescription':
        '[ Yöü scöred %score\$d / %numberQuestions\$d! ÜÜßÄÄẞääääÖäÖ ]',
    'gameCompletedButtonPlayAgain': '[ Play Ägain öüüÖẞ ]',
    'gameCompletedButtonReturnMainMenu': '[ Retürn tö Main Menü ßÜẞäÜẞÖö ]',
  };

  static Map<String, String> _plValues = {
    'appTitle': '[ ¿El o La? ęÓĄĄĆ ]',
    'generalPlay': '[ Płay żń ]',
    'generalContinue': '[ Ćóńtińuę źąĘĄ ]',
    'generalCommingSoon': '[ Ćómińg Śóóń! ŚńÓĆż ]',
    'generalGetStarted': '[ Gęt śtartęd ŻŻżŚĄ ]',
    'categoryfoodDrink': '[ Fóód & Drińk żńŃąą ]',
    'categorysport': '[ Śpórt ężś ]',
    'categorypeople': '[ Pęópłę Ółś ]',
    'onboardingStartDescriptionLabel':
        '[ Tęśt yóur kńówłędgę óń śpańiśh artićłęś żęÓĆśćŹĆłŚĆń ]',
    'onboardingEndTitelLabel': '[ Ćóńgratułatióńś ćóżŁŹĄ ]',
    'onboardingEndDescriptionLabel':
        '[ Yóu arę ńów ręady tó gęt śtartęd with ¿El o La?. łąóŻĆĘśćĄĘĆłłÓŻ ]',
    'onboardingEndTestInfoLabel':
        '[ Ąś ¿El o La? iś pręśęńtły iń dęvęłópmęńt, ałł ćóńtęńt iś śubjęćt tó ćhańgę. Yóur fęędbaćk iś gręatły appręćiatęd! óńŁćĘĄŃŁŚĘńÓÓŻńęęĄĄĆŁŹŻżŁźĘŃĆżĘŃźż ]',
    'homeTabTitle': '[ ¿El o La? śŹŻŚĘ ]',
    'homeTabNounOfTheDayLabel': '[ Ńóuń óf thę day źŁęŹęę ]',
    'homeTabFavoritesLabel': '[ Favóritęś ęęŻŻą ]',
    'homeTabFavoritesViewAllLabel': '[ Vięw ałł ęŁŁŻ ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Havińg diffićułtięś with śómę ńóuńś? Ądd thęm aś favóritęś! ąęŁśąóąŹĘżęĆŁŚÓćŻń ]',
    'homeTabProgressLabel': '[ Prógręśś ŹŻŹż ]',
    'homeTabProgressNotStarted':
        '[ Óńćę yóu bęgiń łęarńińg, yóur óvęrałł prógręśś wiłł bę diśpłayęd hęrę. ńżńĆóŻńÓążÓęłĄŁŹćŁłĘŃ ]',
    'homeTabProgressViewAll': '[ Vięw ałł ńóuńś śąąŃśĆ ]',
    'tipsTabTitle': '[ Tipś Żą ]',
    'insightsTabTitle': '[ Ińśightś óóĆź ]',
    'insightsTabDifficultNounsLabel': '[ Diffićułt Ńóuńś ĄźŚąĆŁ ]',
    'insightsTabStatisticsLabel': '[ Śtatiśtićś ŁŚśŻś ]',
    'insightsTabNotStarted':
        '[ Yóur prógręśś iś bęińg ćałćułatęd. Płęaśę ćóńtińuę płayińg. śŃćŁźŃłŚśńŚĆŃżŻśęŁ ]',
    'settingsTabTitle': '[ Śęttińgś ĘśżŻ ]',
    'settingsTabDarkModeLabel': '[ Dark Módę żżśąź ]',
    'settingsTabLanguageLabel': '[ Łańguagę óęÓś ]',
    'settingsTabButtonResetData': '[ Dęłętę ałł prógręśś ćŚóĘŁńÓł ]',
    'favoritesNounScreenTitle': '[ Favóritęś ńŁężś ]',
    'gameSettingsBottomSheetLearnLabel': '[ Łęarń śĘŻ ]',
    'gameSettingsBottomSheetReviseLabel': '[ Ręviśę ŻśŚ ]',
    'gameSettingsBottomSheetDifficultLabel': '[ Diffićułt Ńóuńś ŃłźŹńż ]',
    'gameCompletedTitle': '[ Ćóńgratułatióńś ćęÓóćÓ ]',
    'gameCompletedDescription':
        '[ Yóu śćóręd %score\$d / %numberQuestions\$d! ĘŻźŃńńąÓŃńŁŚę ]',
    'gameCompletedButtonPlayAgain': '[ Płay Ągaiń ŚŃŚÓŹ ]',
    'gameCompletedButtonReturnMainMenu': '[ Ręturń tó Maiń Męńu śćŚóŻŻłĘ ]',
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
