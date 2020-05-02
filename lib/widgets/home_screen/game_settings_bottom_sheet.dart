import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/configs/game_mode_settings.dart';
import 'package:elola/enums/game_mode.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/configs/route_names.dart';
import 'package:elola/widgets/game_screen/game_screen_store.dart';

class GameSettingsBottomSheet extends StatelessWidget {
  const GameSettingsBottomSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<GameScreenStore>(context);
    final playerDataService = Provider.of<IPlayerDataService>(context);
    final hasRevisionNouns =
        playerDataService.hasRevisionNouns(minCount: GameModeSettings.numberNouns(gameMode: GameMode.revision));
    final hasDifficultNouns =
        playerDataService.hasDifficultNouns(minCount: GameModeSettings.numberNouns(gameMode: GameMode.difficult));

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(height: 8),
          _GameButton(
            onPressed: () => _startGame(context, store: store, gameMode: GameMode.learn),
            color: Theme.of(context).accentColor,
            icon: Icons.whatshot,
            iconColor: Theme.of(context).bottomAppBarColor,
            label: AppLocalizations.gameSettingsBottomSheetLearnLabel,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (hasRevisionNouns)
                _GameButton(
                  onPressed: () => _startGame(context, store: store, gameMode: GameMode.revision),
                  color: Theme.of(context).buttonColor,
                  icon: Icons.replay,
                  iconColor: Theme.of(context).textTheme.button.color,
                  label: AppLocalizations.gameSettingsBottomSheetReviseLabel,
                ),
              if (hasDifficultNouns)
                _GameButton(
                  onPressed: () => _startGame(context, store: store, gameMode: GameMode.difficult),
                  color: Theme.of(context).buttonColor,
                  icon: Icons.priority_high,
                  iconColor: Theme.of(context).textTheme.button.color,
                  label: AppLocalizations.gameSettingsBottomSheetDifficultLabel,
                ),
            ],
          ),
          Container(height: 8),
        ],
      ),
    );
  }

  void _startGame(BuildContext context, {@required GameScreenStore store, GameMode gameMode}) {
    store.setUpGame(gameMode: gameMode);
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed(RouteNames.gameScreen);
  }
}

class _GameButton extends StatelessWidget {
  final void Function() onPressed;
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String label;

  const _GameButton({
    Key key,
    @required this.onPressed,
    @required this.color,
    @required this.icon,
    @required this.iconColor,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
          onPressed: onPressed,
          color: color,
          textColor: iconColor,
          child: Icon(
            icon,
            size: 32,
          ),
          padding: EdgeInsets.all(16),
          shape: CircleBorder(),
        ),
        Container(height: 8),
        Text(label),
      ],
    );
  }
}
