import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/widgets/game_screen/game_screen.dart';
import 'package:elola/widgets/home_screen/home_tab/panel.dart';
import 'package:elola/widgets/nouns_screen/nouns_screen.dart';

class ProgressPanel extends StatelessWidget {
  const ProgressPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalProgress = Provider.of<IPlayerDataService>(context).totalProgress;

    return Panel(
      title: AppLocalizations.homeTabProgressLabel,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: Column(
          children: <Widget>[
            totalProgress > 0
                ? Column(
                    children: <Widget>[
                      LinearProgressIndicator(value: totalProgress),
                      Container(height: 16),
                      Center(
                        child: RaisedButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => NounsScreen(),
                            ),
                          ),
                          child: Text(AppLocalizations.homeTabProgressViewAll),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      Text(AppLocalizations.homeTabProgressNotStarted),
                      Container(height: 16),
                      Center(
                        child: RaisedButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => GameScreen(),
                            ),
                          ),
                          child: Text(AppLocalizations.generalPlay),
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
