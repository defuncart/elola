import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/widgets/common/buttons/noun_favorite_button.dart';
import 'package:elola/widgets/common/buttons/noun_listen_button.dart';
import 'package:elola/widgets/common/panels/panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DifficultNounsPanel extends StatelessWidget {
  static const _numberDifficultNouns = 5;

  const DifficultNounsPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ids = Provider.of<IPlayerDataService>(context).difficultNouns(count: _numberDifficultNouns);
    final nouns = ids != null ? Provider.of<INounDatabase>(context).getNounsByIds(ids) : null;

    return Panel(
      title: AppLocalizations.insightsTabDifficultNounsLabel,
      child: Container(
        width: double.infinity,
        child: nouns != null
            ? Column(
                children: <Widget>[
                  for (final noun in nouns) _NounTile(noun: noun),
                ],
              )
            : Text(AppLocalizations.insightsTabNotStarted),
      ),
    );
  }
}

// TODO consider if this should be merged with NounTile or named differently
class _NounTile extends StatelessWidget {
  final Noun noun;

  const _NounTile({
    Key key,
    @required this.noun,
  })  : assert(noun != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          noun.emoji,
          style: TextStyle(fontSize: 40),
        ),
        Container(width: 16),
        Expanded(
          child: Text(
            noun.inFull,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NounListenButton(noun: noun),
            NounFavoriteButton(noun: noun),
          ],
        ),
      ],
    );
  }
}
