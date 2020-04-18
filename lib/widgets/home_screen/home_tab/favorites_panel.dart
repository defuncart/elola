import 'package:elola/modules/player_data/src/services/i_player_data_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/common/buttons/favorite_noun_button.dart';
import 'package:elola/widgets/common/buttons/listen_noun_button.dart';

class FavoritesPanel extends StatelessWidget {
  const FavoritesPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerDataService = Provider.of<IPlayerDataService>(context);

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
                      onPressed: () {},
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
