import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/models/noun.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/widgets/nouns_screen/favorite_nouns_screen.dart';

class FavoritesPanel extends StatelessWidget {
  const FavoritesPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerDataService = Provider.of<IPlayerDataService>(context);
    final nounsDatabase = Provider.of<INounDatabase>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            AppLocalizations.homeTabFavoritesLabel,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(height: 8),
        Card(
          color: Theme.of(context).bottomAppBarColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: StreamBuilder(
              stream: playerDataService.watchFavorites,
              initialData: playerDataService.favorites,
              builder: (_, AsyncSnapshot<Iterable<String>> snapshot) => snapshot.hasData && snapshot.data.length > 0
                  ? _FavoritesContent(nouns: nounsDatabase.getNounsByIds(snapshot.data))
                  : Text(AppLocalizations.homeTabFavoritesAddSomeLabel),
            ),
          ),
        ),
      ],
    );
  }
}

class _FavoritesContent extends StatelessWidget {
  static const _emojiSize = 32.0;

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
            print(constraints);
            final maxNumber = (constraints.maxWidth / _emojiSize).floor();
            print('maxNumber: $maxNumber');
            print('nouns.length: ${nouns.length}');

            final nounsToDisplay = nouns.length > maxNumber ? nouns.take(maxNumber) : nouns;

            return Row(
              children: <Widget>[
                for (final noun in nounsToDisplay)
                  Container(
                    height: 44,
                    child: Text(
                      noun.emoji,
                      style: TextStyle(
                        fontSize: _emojiSize,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        Container(height: 8),
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
