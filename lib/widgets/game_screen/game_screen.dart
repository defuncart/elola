import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';
import 'package:elola/configs/constants.dart' as constants;
import 'package:elola/models/noun.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool hasResolvedDependencies;
  INounDatabase nounDatabase;
  List<Noun> nouns;
  int currentIndex = 0;
  bool isShowingAnswer = false;

  Noun get currentNoun => nouns[currentIndex];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    nounDatabase = Provider.of<INounDatabase>(context, listen: false);
    nouns = nounDatabase.nouns;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Spacer(flex: 1),
            Expanded(
              child: AutoSizeText(
                currentNoun.emoji,
                style: TextStyle(fontSize: 200),
                maxLines: 1,
              ),
              flex: 2,
            ),
            Expanded(
              child: AutoSizeText(
                isShowingAnswer ? currentNoun.inFull : currentNoun.withoutArticle,
                style: TextStyle(fontSize: 60),
                maxLines: 1,
              ),
              flex: 2,
            ),
            isShowingAnswer
                ? RaisedButton(
                    child: Text(AppLocalizations.generalContinue),
                    onPressed: _onContinue,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        child: Text(constants.el),
                        onPressed: () => _answerChosen(0),
                      ),
                      RaisedButton(
                        child: Text(constants.la),
                        onPressed: () => _answerChosen(1),
                      ),
                    ],
                  ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  void _answerChosen(int index) {
    setState(() {
      isShowingAnswer = true;
    });
  }

  void _onContinue() {
    setState(() {
      currentIndex = ++currentIndex % nouns.length;
      isShowingAnswer = false;
    });
  }
}
