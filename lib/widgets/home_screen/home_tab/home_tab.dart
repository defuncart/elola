import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/widgets/nouns_screen/nouns_screen.dart';
import 'package:elola/widgets/home_screen/home_tab/noun_of_the_day_panel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                AppLocalizations.appTitle,
                style: Theme.of(context).textTheme.headline3,
              ),
              Container(height: 24),
              NounOfTheDayPanel(noun: Provider.of<INounDatabase>(context).nouns.first),
              Container(height: 24),
              RaisedButton(
                child: Text(AppLocalizations.homeTabViewAllNouns),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => NounsScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
