import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/configs/app_colors.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/widgets/nouns_screen/noun_tile.dart';
import 'package:elola/modules/player_data/player_data.dart';

class FavoriteNounsScreen extends StatelessWidget {
  const FavoriteNounsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerDataService = Provider.of<IPlayerDataService>(context);
    final nounsDatabase = Provider.of<INounDatabase>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.favoritesNounScreenTitle),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: playerDataService.watchFavorites,
          initialData: playerDataService.favorites,
          builder: (_, AsyncSnapshot<Iterable<String>> snapshot) {
            final nouns = nounsDatabase.getNounsByIds(snapshot.data);
            nouns.sort((a, b) => a.withoutArticle.compareTo(b.withoutArticle));

            return ListView.builder(
              itemCount: nouns.length,
              itemBuilder: (_, index) {
                final noun = nouns[index];

                return Dismissible(
                  key: Key(noun.id),
                  onDismissed: (_) => playerDataService.toggleIsFavorite(id: noun.id),
                  background: Container(
                    color: AppColors.red,
                  ),
                  child: NounTile(
                    noun: noun,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
