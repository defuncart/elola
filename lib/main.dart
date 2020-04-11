import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_database/noun_database.dart';

// void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final nounDatabase = NounDatabase();
  await nounDatabase.init();

  nounDatabase.getNouns().forEach((element) => print(element));

  runApp(
    MultiProvider(
      providers: [
        Provider<INounDatabase>.value(
          value: nounDatabase,
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizationsDelegate.supportedLocals,
      home: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noun = Provider.of<INounDatabase>(context).getNouns().first;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.appTitle),
      ),
      body: Center(
        child: Text(
          noun.emoji,
          style: TextStyle(
            fontSize: 200,
          ),
        ),
      ),
    );
  }
}
