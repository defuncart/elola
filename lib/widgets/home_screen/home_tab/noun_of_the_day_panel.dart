import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/noun_of_the_day/noun_of_the_day.dart';
import 'package:elola/widgets/common/buttons/noun_favorite_button.dart';
import 'package:elola/widgets/common/buttons/noun_listen_button.dart';
import 'package:elola/widgets/home_screen/home_tab/panel.dart';

class NounOfTheDayPanel extends StatelessWidget {
  const NounOfTheDayPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nounId = Provider.of<INounOfTheDayService>(context).today;
    final noun = nounId != null ? Provider.of<INounDatabase>(context).getNoun(id: nounId) : null;

    return noun == null
        ? Container()
        : Panel(
            title: AppLocalizations.homeTabNounOfTheDayLabel,
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
                Expanded(
                  child: Text(
                    noun.inFull,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 32.0,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    NounListenButton(noun: noun),
                    NounFavoriteButton(noun: noun),
                  ],
                ),
              ],
            ),
          );
  }
}
