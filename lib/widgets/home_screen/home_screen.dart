import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_database/noun_database.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

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
