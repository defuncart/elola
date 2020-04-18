import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/configs/app_themes.dart';
import 'package:elola/configs/constants.dart' as constants;
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/noun_of_the_day/noun_of_the_day.dart';
import 'package:elola/modules/player_progress/player_progress.dart';
import 'package:elola/modules/text_to_speech/text_to_speech.dart';
import 'package:elola/modules/user_settings/user_settings.dart';
import 'package:elola/utils/hive_utils.dart';
import 'package:elola/widgets/home_screen/home_screen.dart';
import 'package:elola/widgets/home_screen/settings_tab/settings_store.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> _initAppFuture;
  INounDatabase _nounDatabase = NounDatabase();
  IPlayerDataService _progressDatabase = PlayerDataService();
  ISettingsDatabase _settingsDatabase = SettingsDatabase();
  ITextToSpeech _textToSpeech = TextToSpeech();
  INounOfTheDayService _nounOfTheDayService = NounOfTheDayService();

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
    _nounDatabase.debugPrint();

    // then IProgressDatabase
    await _progressDatabase.init();
    // TODO in production this could be trigger on app update
    await _progressDatabase.resync(ids: _nounDatabase.nouns.map((noun) => noun.id));
    // await _progressDatabase.reset();
    _progressDatabase.debugPrint();

    // then ISettingsDatabase
    await _settingsDatabase.init();
    _settingsDatabase.debugPrint();

    // then INounOfTheDayService
    await _nounOfTheDayService.init();

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
                        value: _progressDatabase,
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
                      ProxyProvider<ISettingsDatabase, SettingsStore>(
                        update: (_, settingsDatabase, __) => SettingsStore(settingsDatabase),
                      ),
                    ],
                    child: _MyApp(),
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
  const _MyApp({Key key}) : super(key: key);

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
        home: HomeScreen(),
      ),
    );
  }
}
