import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/game_screen/game_screen.dart';

class LearnTab extends StatelessWidget {
  const LearnTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(AppLocalizations.generalPlay),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GameScreen(),
          ),
        ),
      ),
    );
  }
}