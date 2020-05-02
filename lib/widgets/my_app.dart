import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/configs/app_themes.dart';
import 'package:elola/configs/constants.dart' as constants;
import 'package:elola/configs/route_names.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/noun_of_the_day/noun_of_the_day.dart';
import 'package:elola/modules/noun_tips/noun_tips.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/modules/text_to_speech/text_to_speech.dart';
import 'package:elola/modules/user_settings/user_settings.dart';
import 'package:elola/utils/hive_utils.dart';
import 'package:elola/widgets/game_screen/game_screen.dart';
import 'package:elola/widgets/game_screen/game_screen_store.dart';
import 'package:elola/widgets/home_screen/home_screen.dart';
import 'package:elola/widgets/home_screen/settings_tab/settings_store.dart';
import 'package:elola/widgets/onboarding_screen/onboarding_screen.dart';
import 'package:elola/widgets/onboarding_screen/onboarding_store.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> _initAppFuture;
  INounDatabase _nounDatabase = NounDatabase();
  IPlayerDataService _playerDataService = PlayerDataService();
  ISettingsDatabase _settingsDatabase = SettingsDatabase();
  ITextToSpeech _textToSpeech = TextToSpeech();
  INounOfTheDayService _nounOfTheDayService = NounOfTheDayService();
  INounTipsService _nounTipsService = NounTipsService();

  @override
  void initState() {
    super.initState();

    _initAppFuture = _initApp();
  }

  Future<bool> _initApp() async {
    // firstly initialize hive
    await HiveUtils.init();

    // then INounDatabase
    await _nounDatabase.init();
    //await _nounDatabase.reset();
    //_nounDatabase.debugPrint();
    //print(_nounDatabase.nouns.length);

    // then IPlayerDataService
    await _playerDataService.init();
    //await _playerDataService.reset();
    // TODO in production this could be trigger on app update
    await _playerDataService.resync(ids: _nounDatabase.nouns.map((noun) => noun.id));
    // _playerDataService.debugPrint();

    // then ISettingsDatabase
    await _settingsDatabase.init();
    // await _settingsDatabase.reset();
    //_settingsDatabase.debugPrint();

    // then INounOfTheDayService
    await _nounOfTheDayService.init();

    // then INounTipService
    await _nounTipsService.init();

    // TODO move to onboarding
    await _textToSpeech.setLanguage(_settingsDatabase.ttsLanguage);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: _initAppFuture,
          builder: (_, AsyncSnapshot<bool> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data == true) {
                  return MultiProvider(
                    providers: [
                      Provider<INounDatabase>.value(
                        value: _nounDatabase,
                      ),
                      Provider<IPlayerDataService>.value(
                        value: _playerDataService,
                      ),
                      Provider<ISettingsDatabase>.value(
                        value: _settingsDatabase,
                      ),
                      Provider<ITextToSpeech>.value(
                        value: _textToSpeech,
                      ),
                      Provider<INounOfTheDayService>.value(
                        value: _nounOfTheDayService,
                      ),
                      Provider<INounTipsService>.value(
                        value: _nounTipsService,
                      ),
                      ProxyProvider2<ISettingsDatabase, IPlayerDataService, SettingsStore>(
                        update: (_, settingsDatabase, playerDataService, __) =>
                            SettingsStore(settingsDatabase, playerDataService),
                      ),
                      ProxyProvider3<INounDatabase, IPlayerDataService, ITextToSpeech, GameScreenStore>(
                        update: (_, nounsDatabase, playerDataService, textToSpeech, __) => GameScreenStore(
                          nounsDatabase,
                          playerDataService,
                          textToSpeech,
                        ),
                        dispose: (_, gameScreenStore) => gameScreenStore.dispose(),
                      ),
                      ProxyProvider<ISettingsDatabase, OnboardingStore>(
                        update: (_, settingsDatabase, __) => OnboardingStore(settingsDatabase),
                      ),
                    ],
                    child: _MyApp(hasOnboarded: _settingsDatabase.hasOnboarded),
                  );
                }
              //TODO else show error
            }

            return Container();
          },
        ),
      ),
    );
  }
}

class _MyApp extends StatelessWidget {
  final bool hasOnboarded;

  const _MyApp({Key key, @required this.hasOnboarded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SettingsStore>(context);

    return Observer(
      builder: (_) => MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizationsDelegate.supportedLocals,
        locale: AppLocalizationsDelegate.supportedLocals.firstWhere(
          (locale) => locale.languageCode == store.language,
          orElse: () => const Locale(constants.defaultLanguage),
        ),
        themeMode: store.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: AppThemes.light,
        darkTheme: AppThemes.dark,
        home: hasOnboarded ? HomeScreen() : OnboardingScreen(),
        routes: {
          RouteNames.homeScreen: (_) => HomeScreen(),
          RouteNames.gameScreen: (_) => GameScreen(),
        },
      ),
    );
  }
}
