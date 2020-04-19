import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/services/i_noun_service.dart';
import 'package:elola/widgets/nouns_screen/nouns_screen.dart';

class FavoritesPanel extends StatelessWidget {
  const FavoritesPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerDataService = Provider.of<IPlayerDataService>(context);
    final nounService = Provider.of<INounService>(context);

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
              stream: playerDataService.watchHasFavorites,
              initialData: playerDataService.hasFavorites,
              builder: (_, snapshot) => snapshot.data
                  ? RaisedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => NounsScreen(
                            title: AppLocalizations.homeTabFavoritesLabel,
                            nouns: nounService.favorites,
                          ),
                        ),
                      ),
                      child: Text(AppLocalizations.homeTabFavoritesViewAllLabel),
                    )
                  : Text(AppLocalizations.homeTabFavoritesAddSomeLabel),
            ),
          ),
        ),
      ],
    );
  }
}
