import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/noun_of_the_day/noun_of_the_day.dart';
import 'package:elola/widgets/common/buttons/favorite_noun_button.dart';
import 'package:elola/widgets/common/buttons/listen_noun_button.dart';

class NounOfTheDayPanel extends StatelessWidget {
  const NounOfTheDayPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nounOfTheDayService = Provider.of<INounOfTheDayService>(context);
    final nounId = nounOfTheDayService.today;
    final noun = nounId != null ? Provider.of<INounDatabase>(context).getNoun(id: nounId) : null;

    return noun == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  AppLocalizations.homeTabNounOfTheDayLabel,
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
                          FavoriteListenButton(noun: noun),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
