import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/player_progress/player_progress.dart';
import 'package:elola/utils/hive_utils.dart';
import 'package:elola/widgets/home_screen/home_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> _initAppFuture;
  INounDatabase _nounDatabase = NounDatabase();
  IProgressDatabase _progressDatabase = ProgressDatabase();

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
    _nounDatabase.nouns.forEach((element) => print(element));

    // then IProgressDatabase
    await _progressDatabase.init();
    if (!_progressDatabase.hasData) {
      await _progressDatabase.create(ids: _nounDatabase.nouns.map((noun) => noun.id));
    }
    _progressDatabase.reset();
    _progressDatabase.debugPrint();

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
                      Provider<IProgressDatabase>.value(
                        value: _progressDatabase,
                      )
                    ],
                    child: MaterialApp(
                      localizationsDelegates: [
                        const AppLocalizationsDelegate(),
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: AppLocalizationsDelegate.supportedLocals,
                      home: HomeScreen(),
                    ),
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
