import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';
import 'package:elola/models/noun.dart';
import 'package:elola/widgets/common/buttons/listen_noun_button.dart';

class NounOfTheDayPanel extends StatelessWidget {
  final Noun noun;

  const NounOfTheDayPanel({
    @required this.noun,
    Key key,
  })  : assert(noun != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              AppLocalizations.homeTabNounOfTheDayTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(height: 8),
          Card(
            color: Theme.of(context).bottomAppBarColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    noun.emoji,
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
                  Text(
                    noun.inFull,
                    style: TextStyle(
                      fontSize: 32.0,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      NounListenButton(noun: noun),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
