import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/models/noun.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/widgets/home_screen/home_tab/panel.dart';
import 'package:elola/widgets/nouns_screen/favorite_nouns_screen.dart';

class FavoritesPanel extends StatelessWidget {
  const FavoritesPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerDataService = Provider.of<IPlayerDataService>(context);
    final nounsDatabase = Provider.of<INounDatabase>(context);

    return Panel(
      title: AppLocalizations.homeTabFavoritesLabel,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        // TODO this is even triggered when widget isn't visible
        child: StreamBuilder(
          stream: playerDataService.watchFavorites,
          initialData: playerDataService.favorites,
          builder: (_, AsyncSnapshot<Iterable<String>> snapshot) => snapshot.hasData && snapshot.data.isNotEmpty
              ? _FavoritesContent(nouns: nounsDatabase.getNounsByIds(snapshot.data))
              : Text(AppLocalizations.homeTabFavoritesAddSomeLabel),
        ),
      ),
    );
  }
}

class _FavoritesContent extends StatelessWidget {
  static const _emojiSize = 32.0;
  static const _fontSizePercentage = 0.85;

  final List<Noun> nouns;

  const _FavoritesContent({
    Key key,
    @required this.nouns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LayoutBuilder(
          builder: (_, constraints) {
            final maxNumber = (constraints.maxWidth / _emojiSize).floor();
            final nounsToDisplay = nouns.length > maxNumber ? nouns.take(maxNumber) : nouns;

            return Row(
              children: <Widget>[
                for (final noun in nounsToDisplay)
                  Flexible(
                    child: Text(
                      noun.emoji,
                      style: TextStyle(
                        fontSize: _emojiSize * _fontSizePercentage,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        Container(height: 16),
        Center(
          child: RaisedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => FavoriteNounsScreen(),
              ),
            ),
            child: Text(AppLocalizations.homeTabFavoritesViewAllLabel),
          ),
        ),
      ],
    );
  }
}
