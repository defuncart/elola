import 'package:auto_size_text/auto_size_text.dart';
import 'package:elola/localizations.dart';
import 'package:elola/widgets/game_screen/game_screen.dart';
import 'package:flutter/material.dart';

class GameCompletedScreen extends StatelessWidget {
  final int score;
  final int numberQuestions;

  const GameCompletedScreen({
    Key key,
    @required this.score,
    @required this.numberQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AutoSizeText(
              AppLocalizations.gameCompletedTitle,
              style: TextStyle(fontSize: 80),
              maxLines: 1,
            ),
            AutoSizeText(
              AppLocalizations.gameCompletedDescription(score: score, numberQuestions: numberQuestions),
              style: TextStyle(fontSize: 40),
              maxLines: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => GameScreen(),
                    ),
                  ),
                  child: Text(
                    AppLocalizations.gameCompletedButtonPlayAgain,
                  ),
                ),
                RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    AppLocalizations.gameCompletedButtonReturnMainMenu,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
