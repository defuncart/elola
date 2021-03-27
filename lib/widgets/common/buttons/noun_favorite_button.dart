import 'package:elola/configs/app_colors.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NounFavoriteButton extends StatefulWidget {
  final Noun noun;

  const NounFavoriteButton({
    @required this.noun,
    Key key,
  })  : assert(noun != null),
        super(key: key);

  @override
  _NounFavoriteButtonState createState() => _NounFavoriteButtonState();
}

class _NounFavoriteButtonState extends State<NounFavoriteButton> {
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
