import 'package:meta/meta.dart';

import 'package:elola/models/player_data.dart';
import 'package:elola/services/base_hive_database.dart';

import 'i_player_data_service.dart';

/// A database of the player's data
class PlayerDataService extends BaseHiveDatabase<PlayerData> implements IPlayerDataService {
  //// A name for the box
  String get boxName => 'playerData';

  /// Ensures that the database is in sync with a list of noun ids
  @override
  Future<void> resync({@required Iterable<String> ids}) async {
    for (final id in ids) {
      if (!box.containsKey(id)) {
        await box.put(
          id,
          PlayerData(id: id)..reset(),
        );
      }
    }
  }

  /// Returns `PlayerData` for a given noun id
  ///
  /// If the id is not found, `null` is returned
  PlayerData _getPlayerData({@required String id}) => hasData ? box.get(id) : null;

  /// Updates the progress of a given noun
  @override
  void updateProgress({@required String id, @required bool answeredCorrectly}) {
    final playerData = _getPlayerData(id: id);
    if (playerData != null) {
      playerData.updateProgress(answeredCorrectly: answeredCorrectly);
      box.put(id, playerData);
    }
  }

  /// Returns whether a noun is a favorite
  bool getIsFavorite({@required String id}) {
    final playerData = _getPlayerData(id: id);
    if (playerData != null) {
      return playerData.isFavorite;
    }

    return false;
  }

  /// Toggles whether a noun is a favorite
  void toggleIsFavorite({@required String id}) {
    final playerData = _getPlayerData(id: id);
    if (playerData != null) {
      playerData.isFavorite = !playerData.isFavorite;
      box.put(id, playerData);
    }
  }

  /// Resets the database
  @override
  Future<void> reset() async {
    for (final playerData in box.values) {
      playerData.reset();
      box.put(playerData.id, playerData);
    }
  }
}
