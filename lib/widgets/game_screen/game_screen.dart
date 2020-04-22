import 'package:auto_size_text/auto_size_text.dart';
import 'package:elola/widgets/game_screen/game_completed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/configs/constants.dart' as constants;
import 'package:elola/widgets/common/buttons/noun_favorite_button.dart';
import 'package:elola/widgets/game_screen/game_screen_store.dart';

class GameScreen extends StatelessWidget {
  GameScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<GameScreenStore>(context, listen: false);
    store.nextRound();

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Observer(
            builder: (_) => NounFavoriteButton(noun: store.currentNoun),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(flex: 1),
            Observer(
              builder: (_) => Expanded(
                child: AutoSizeText(
                  store.currentNoun.emoji,
                  style: TextStyle(fontSize: 200),
                  maxLines: 1,
                ),
                flex: 2,
              ),
            ),
            Observer(
              builder: (_) => Expanded(
                child: AutoSizeText(
                  store.isShowingAnswer ? store.currentNoun.inFull : store.currentNoun.withoutArticle,
                  style: TextStyle(fontSize: 60),
                  maxLines: 1,
                ),
                flex: 2,
              ),
            ),
            Observer(
              builder: (_) => store.isShowingAnswer
                  ? RaisedButton(
                      child: Text(AppLocalizations.generalContinue),
                      onPressed: () {
                        if (!store.shouldContinue()) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => GameCompletedScreen(
                                score: store.score,
                                numberQuestions: numberQuestionsPerRound,
                              ),
                            ),
                          );
                        }
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          child: Text(constants.el),
                          onPressed: () => store.answerChosen(0),
                        ),
                        RaisedButton(
                          child: Text(constants.la),
                          onPressed: () => store.answerChosen(1),
                        ),
                      ],
                    ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
