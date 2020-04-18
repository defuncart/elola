import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/configs/app_colors.dart';
import 'package:elola/models/noun.dart';
import 'package:elola/modules/player_data/player_data.dart';

class FavoriteListenButton extends StatefulWidget {
  final Noun noun;

  const FavoriteListenButton({
    @required this.noun,
    Key key,
  })  : assert(noun != null),
        super(key: key);

  @override
  _FavoriteListenButtonState createState() => _FavoriteListenButtonState();
}

class _FavoriteListenButtonState extends State<FavoriteListenButton> {
  bool didResolveDependencies = false;
  IPlayerDataService playerDataService;

  bool get isFavorite => playerDataService?.getIsFavorite(id: widget.noun?.id);

  void toggleFavorite() {
    playerDataService?.toggleIsFavorite(id: widget.noun?.id);
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!didResolveDependencies) {
      playerDataService = Provider.of<IPlayerDataService>(context);
      didResolveDependencies = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: isFavorite,
      stream: playerDataService.watchIsFavorite(id: widget.noun.id),
      builder: (_, snapshot) => IconButton(
        icon: Icon(
          snapshot.data ? Icons.favorite : Icons.favorite_border,
          color: AppColors.red,
        ),
        onPressed: toggleFavorite,
      ),
    );
  }
}
