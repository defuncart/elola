import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:elola/configs/route_names.dart';
import 'package:elola/enums/game_mode.dart';
import 'package:elola/localizations.dart';

class ResultsScreen extends StatelessWidget {
  final GameMode gameMode;
  final int score;
  final int numberQuestions;
  final List<String> icons;

  bool get _showTrophy => (score / numberQuestions) >= 0.6;

  const ResultsScreen({
    Key key,
    @required this.gameMode,
    @required this.score,
    @required this.numberQuestions,
    @required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      _showTrophy ? MdiIcons.trophy : MdiIcons.medalOutline,
                      size: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.amber,
                    ),
                    Container(height: 8),
                    AutoSizeText(
                      AppLocalizations.gameCompletedTitle,
                      style: TextStyle(fontSize: 40),
                      maxLines: 1,
                    ),
                  ],
                ),
                Text(
                  _gameModeLocaMethodMap[gameMode](numberQuestions),
                  style: TextStyle(fontSize: 24),
                  maxLines: 1,
                ),
                _IconsGrid(icons: icons),
                RaisedButton(
                  onPressed: () => Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen),
                  child: Text(
                    AppLocalizations.generalContinue,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static final Map<GameMode, Function(int)> _gameModeLocaMethodMap = {
    GameMode.learn: (numberQuestions) => AppLocalizations.gameCompletedGameModelearn(numNouns: numberQuestions),
    GameMode.revision: (numberQuestions) => AppLocalizations.gameCompletedGameModerevision(numNouns: numberQuestions),
    GameMode.difficult: (numberQuestions) => AppLocalizations.gameCompletedGameModedifficult(numNouns: numberQuestions),
  };
}

class _IconsGrid extends StatelessWidget {
  static const _iconsPerRow = 5;

  final List<String> icons;

  const _IconsGrid({Key key, @required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rows = <List<String>>[];
    for (int i = 0; i < (icons.length / _iconsPerRow).floor(); i++) {
      rows.add(icons.sublist(i * _iconsPerRow, (i + 1) * _iconsPerRow));
    }

    return Column(
      children: <Widget>[
        for (final icons in rows)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              for (final icon in icons)
                Text(
                  icon,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
