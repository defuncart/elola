import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class AppLocalizations {
  static final _pluralsRegExp = RegExp(r"\|(.*?)\|");

  static String get appTitle => _getText('appTitle');

  static String get generalPlay => _getText('generalPlay');

  static String get generalContinue => _getText('generalContinue');

  static String get generalCommingSoon => _getText('generalCommingSoon');

  static String get generalGetStarted => _getText('generalGetStarted');

  static String get categoryfoodDrink => _getText('categoryfoodDrink');

  static String get categorysport => _getText('categorysport');

  static String get categorypeople => _getText('categorypeople');

  static String get categorynature => _getText('categorynature');

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

  static String gameCompletedGameModelearn({
    @required int numNouns,
  }) {
    String text = _getText('gameCompletedGameModelearn');
    if (numNouns != null) {
      text = text.replaceAll("%numNouns\$d", numNouns.toString());
    }
    final plurals =
        _pluralsRegExp.firstMatch(text).group(0).replaceAll('|', '').split(':');
    if (plurals.length != 6) {
      return 'Issue with key gameCompletedGameModelearn. Incorrect number of plurals.';
    }
    return Intl.plural(
      numNouns,
      zero: text.replaceAll(_pluralsRegExp, plurals[0]),
      one: text.replaceAll(_pluralsRegExp, plurals[1]),
      two: text.replaceAll(_pluralsRegExp, plurals[2]),
      few: text.replaceAll(_pluralsRegExp, plurals[3]),
      many: text.replaceAll(_pluralsRegExp, plurals[4]),
      other: text.replaceAll(_pluralsRegExp, plurals[5]),
    );
  }

  static String gameCompletedGameModerevision({
    @required int numNouns,
  }) {
    String text = _getText('gameCompletedGameModerevision');
    if (numNouns != null) {
      text = text.replaceAll("%numNouns\$d", numNouns.toString());
    }
    final plurals =
        _pluralsRegExp.firstMatch(text).group(0).replaceAll('|', '').split(':');
    if (plurals.length != 6) {
      return 'Issue with key gameCompletedGameModerevision. Incorrect number of plurals.';
    }
    return Intl.plural(
      numNouns,
      zero: text.replaceAll(_pluralsRegExp, plurals[0]),
      one: text.replaceAll(_pluralsRegExp, plurals[1]),
      two: text.replaceAll(_pluralsRegExp, plurals[2]),
      few: text.replaceAll(_pluralsRegExp, plurals[3]),
      many: text.replaceAll(_pluralsRegExp, plurals[4]),
      other: text.replaceAll(_pluralsRegExp, plurals[5]),
    );
  }

  static String gameCompletedGameModedifficult({
    @required int numNouns,
  }) {
    String text = _getText('gameCompletedGameModedifficult');
    if (numNouns != null) {
      text = text.replaceAll("%numNouns\$d", numNouns.toString());
    }
    final plurals =
        _pluralsRegExp.firstMatch(text).group(0).replaceAll('|', '').split(':');
    if (plurals.length != 6) {
      return 'Issue with key gameCompletedGameModedifficult. Incorrect number of plurals.';
    }
    return Intl.plural(
      numNouns,
      zero: text.replaceAll(_pluralsRegExp, plurals[0]),
      one: text.replaceAll(_pluralsRegExp, plurals[1]),
      two: text.replaceAll(_pluralsRegExp, plurals[2]),
      few: text.replaceAll(_pluralsRegExp, plurals[3]),
      many: text.replaceAll(_pluralsRegExp, plurals[4]),
      other: text.replaceAll(_pluralsRegExp, plurals[5]),
    );
  }

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
    'categorynature': 'Nature',
    'onboardingStartDescriptionLabel':
        'Test your knowledge on spanish articles',
    'onboardingEndTitelLabel': 'Congratulations!',
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
    'gameCompletedTitle': 'Congratulations!',
    'gameCompletedGameModelearn':
        'You have learned %numNouns\$d |new nouns:new noun:new nouns:new nouns:new nouns:new nouns|.',
    'gameCompletedGameModerevision':
        'You have revised %numNouns\$d |learned nouns:learned noun:learned nouns:learned nouns:learned nouns:learned nouns|.',
    'gameCompletedGameModedifficult':
        'You have revised %numNouns\$d |difficult nouns:difficult noun:difficult nouns:difficult nouns:difficult nouns:difficult nouns|.',
  };

  static Map<String, String> _deValues = {
    'appTitle': '¿El o La?',
    'generalPlay': '[ Play ẞß ]',
    'generalContinue': '[ Cöntinüe üÖÜÖ ]',
    'generalCommingSoon': '[ Cöming Söön! üßẞöÖ ]',
    'generalGetStarted': '[ Get started ẞßüßß ]',
    'categoryfoodDrink': '[ Fööd & Drink äääüä ]',
    'categorysport': '[ Spört ẞöü ]',
    'categorypeople': '[ Peöple ÜÖÜ ]',
    'categorynature': '[ Natüre üüö ]',
    'onboardingStartDescriptionLabel':
        '[ Test yöür knöwledge ön spanish articles äẞßüßßẞßäßöÖ ]',
    'onboardingEndTitelLabel': '[ Cöngratülatiöns! Üöäßöüü ]',
    'onboardingEndDescriptionLabel':
        '[ Yöü are nöw ready tö get started with ¿El o La?. ÜßÜßẞäöäÖẞßÄäẞä ]',
    'onboardingEndTestInfoLabel':
        '[ Äs ¿El o La? is presently in develöpment, all cöntent is süßject tö change. Yöür feedßack is greatly appreciated! ÄäÄẞßÖÜöÄößÜßÜöÜöÖÖäßöÄßäßÜÖöÜÜÖßö ]',
    'homeTabTitle': '¿El o La?',
    'homeTabNounOfTheDayLabel': '[ Nöün öf the day ßäüÖÄö ]',
    'homeTabFavoritesLabel': '[ Favörites öẞäẞö ]',
    'homeTabFavoritesViewAllLabel': '[ View all ẞßÄÖ ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Having difficülties with söme nöüns? Ädd them as favörites! öäÖßÖÜßäẞÖẞÄöüßÄöß ]',
    'homeTabProgressLabel': '[ Prögress öÜẞö ]',
    'homeTabProgressNotStarted':
        '[ Önce yöü ßegin learning, yöür överall prögress will ße displayed here. ßüääÄÖÄüÖßÖÄÄÖẞẞäÄẞüÜ ]',
    'homeTabProgressViewAll': '[ View all nöüns ßÜöÜÜÜ ]',
    'tipsTabTitle': '[ Tips Äß ]',
    'insightsTabTitle': '[ Insights ÜüÜÄ ]',
    'insightsTabDifficultNounsLabel': '[ Difficült Nöüns ÜäÖÜÜẞ ]',
    'insightsTabStatisticsLabel': '[ Statistics üäẞöÖ ]',
    'insightsTabNotStarted':
        '[ Yöür prögress is ßeing calcülated. Please cöntinüe playing. ößẞßßÄÜäÄẞßÄäÄÄÄöÜ ]',
    'settingsTabTitle': '[ Settings ÖÖÜẞ ]',
    'settingsTabDarkModeLabel': '[ Dark Möde ẞäẞÄö ]',
    'settingsTabLanguageLabel': '[ Langüage ÖööÖ ]',
    'settingsTabButtonResetData': '[ Delete all prögress ÖöößÖÜäö ]',
    'favoritesNounScreenTitle': '[ Favörites ßẞäöä ]',
    'gameSettingsBottomSheetLearnLabel': '[ Learn ẞßä ]',
    'gameSettingsBottomSheetReviseLabel': '[ Revise öüÜ ]',
    'gameSettingsBottomSheetDifficultLabel': '[ Difficült Nöüns ẞäßüÜü ]',
    'gameCompletedTitle': '[ Cöngratülatiöns! ÜöẞäẞÄÜ ]',
    'gameCompletedGameModelearn':
        '[ Yöü have learned %numNouns\$d |new nouns:new noun:new nouns:new nouns:new nouns:new nouns|. üääÖöäÖÖöüüÜöẞÄäßÜäẞÖßÄÄÖüÜ ]',
    'gameCompletedGameModerevision':
        '[ Yöü have revised %numNouns\$d |learned nouns:learned noun:learned nouns:learned nouns:learned nouns:learned nouns|. ÖüäÖÜÜÜÜüßÜÖẞÜÄÜÖßäẞßÄööööößüẞßööẞÜ ]',
    'gameCompletedGameModedifficult':
        '[ Yöü have revised %numNouns\$d |difficult nouns:difficult noun:difficult nouns:difficult nouns:difficult nouns:difficult nouns|. ößÜäüüẞÄÖÜẞööÄöÄäẞüẞÄäßäẞÜÖöäÖẞüüÜÜäẞü ]',
  };

  static Map<String, String> _plValues = {
    'appTitle': '¿El o La?',
    'generalPlay': '[ Płay ÓŁ ]',
    'generalContinue': '[ Ćóńtińuę ÓĆĄń ]',
    'generalCommingSoon': '[ Ćómińg Śóóń! ĄŃĘŹń ]',
    'generalGetStarted': '[ Gęt śtartęd łóĘąŃ ]',
    'categoryfoodDrink': '[ Fóód & Drińk ĆźżżŚ ]',
    'categorysport': '[ Śpórt Źłą ]',
    'categorypeople': '[ Pęópłę ŚŻń ]',
    'categorynature': '[ Ńaturę żŹń ]',
    'onboardingStartDescriptionLabel':
        '[ Tęśt yóur kńówłędgę óń śpańiśh artićłęś óźńąĘćŹŹąŹźó ]',
    'onboardingEndTitelLabel': '[ Ćóńgratułatióńś! źżŻĘĆŚć ]',
    'onboardingEndDescriptionLabel':
        '[ Yóu arę ńów ręady tó gęt śtartęd with ¿El o La?. ĘłŁóĆęŚĘŚąóńźćŃ ]',
    'onboardingEndTestInfoLabel':
        '[ Ąś ¿El o La? iś pręśęńtły iń dęvęłópmęńt, ałł ćóńtęńt iś śubjęćt tó ćhańgę. Yóur fęędbaćk iś gręatły appręćiatęd! ęÓźŚĘźćÓńćęóŹłńŁęśóŹąĘŹćĄśśżąĄŃóćć ]',
    'homeTabTitle': '¿El o La?',
    'homeTabNounOfTheDayLabel': '[ Ńóuń óf thę day ŁŹóĘĘś ]',
    'homeTabFavoritesLabel': '[ Favóritęś ćŻąŁł ]',
    'homeTabFavoritesViewAllLabel': '[ Vięw ałł ŹÓÓĆ ]',
    'homeTabFavoritesAddSomeLabel':
        '[ Havińg diffićułtięś with śómę ńóuńś? Ądd thęm aś favóritęś! ĄżźŹŁĘŻŚćŁżźĘĘóżźć ]',
    'homeTabProgressLabel': '[ Prógręśś śńŻź ]',
    'homeTabProgressNotStarted':
        '[ Óńćę yóu bęgiń łęarńińg, yóur óvęrałł prógręśś wiłł bę diśpłayęd hęrę. ŹĆżóĆńÓÓżęŁóŚżźĆóżłęś ]',
    'homeTabProgressViewAll': '[ Vięw ałł ńóuńś ŚŹśąÓć ]',
    'tipsTabTitle': '[ Tipś ęŹ ]',
    'insightsTabTitle': '[ Ińśightś ęŃżó ]',
    'insightsTabDifficultNounsLabel': '[ Diffićułt Ńóuńś ŹŻÓąźĄ ]',
    'insightsTabStatisticsLabel': '[ Śtatiśtićś śźżÓÓ ]',
    'insightsTabNotStarted':
        '[ Yóur prógręśś iś bęińg ćałćułatęd. Płęaśę ćóńtińuę płayińg. ŁĆŻŁłżŃĘóŁąĆŃĄęĘŁÓ ]',
    'settingsTabTitle': '[ Śęttińgś ćÓŚĆ ]',
    'settingsTabDarkModeLabel': '[ Dark Módę ÓńąćŻ ]',
    'settingsTabLanguageLabel': '[ Łańguagę ŻśŃń ]',
    'settingsTabButtonResetData': '[ Dęłętę ałł prógręśś ćĄśŃńĘśŚ ]',
    'favoritesNounScreenTitle': '[ Favóritęś ężŻźń ]',
    'gameSettingsBottomSheetLearnLabel': '[ Łęarń ÓćŃ ]',
    'gameSettingsBottomSheetReviseLabel': '[ Ręviśę źżĘ ]',
    'gameSettingsBottomSheetDifficultLabel': '[ Diffićułt Ńóuńś źĆŁłŹĘ ]',
    'gameCompletedTitle': '[ Ćóńgratułatióńś! łźŁÓńłĄ ]',
    'gameCompletedGameModelearn':
        '[ Yóu havę łęarńęd %numNouns\$d |new nouns:new noun:new nouns:new nouns:new nouns:new nouns|. ŻŹŹŃłłŃÓćĄśńŃŚŁćĘŻźłŹóźęĆÓĘ ]',
    'gameCompletedGameModerevision':
        '[ Yóu havę ręviśęd %numNouns\$d |learned nouns:learned noun:learned nouns:learned nouns:learned nouns:learned nouns|. żźŚśŻŹĆóŹąśżćźÓŹŚŚŁĘŹźęŃńśńźłłĆążźś ]',
    'gameCompletedGameModedifficult':
        '[ Yóu havę ręviśęd %numNouns\$d |difficult nouns:difficult noun:difficult nouns:difficult nouns:difficult nouns:difficult nouns|. ĆĆŚśŃóŚŹśŃĄŻćłęŹąęęĆłćóĘććĘżĘęĘśóŹęĘĘŚ ]',
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
