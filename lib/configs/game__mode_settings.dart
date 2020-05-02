import 'package:elola/enums/game_mode.dart';
import 'package:meta/meta.dart';

/// A config of settings for game modes
abstract class GameModeSettings {
  static const _mapGameModeNumberNouns = {
    GameMode.learn: 10,
    GameMode.revision: 10,
    GameMode.difficult: 5,
  };

  static int numberNouns({@required GameMode gameMode}) => _mapGameModeNumberNouns[gameMode];
}
