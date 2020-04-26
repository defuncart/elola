import 'package:meta/meta.dart';

import 'package:elola/models/player_daily_data.dart';
import 'package:elola/services/base_hive_database.dart';

import 'i_player_daily_data_database.dart';

/// A database of the player's daily data
class PlayerDailyDataDatabase extends BaseHiveDatabase<PlayerDailyData> implements IPlayerDailyDataDatabase {
  //// A name for the box
  @override
  String get boxName => 'playerDailyData';

  /// Returns `PlayerDailyData` for a given id
  ///
  /// If the id is not found, `null` is returned
  PlayerDailyData _getPlayerDailyData({@required String id}) => hasData && id != null ? box.get(id) : null;

  /// Ensures that data exists for an id, creating an instance if required
  void ensureDataExists({@required String id}) {
    PlayerDailyData playerDailyData = _getPlayerDailyData(id: id);
    if (playerDailyData == null) {
      playerDailyData = PlayerDailyData(id: id)..init();
      box.put(id, playerDailyData);
    }
  }

  /// Updates the progress of a given day
  @override
  void updateProgress({@required String id, @required bool isLearned}) {
    final playerDailyData = _getPlayerDailyData(id: id);
    assert(playerDailyData != null, 'No daily data found for $id');
    if (isLearned) {
      playerDailyData.nounsPracticed++;
    } else {
      playerDailyData.nounsLearned++;
    }
    box.put(id, playerDailyData);
  }

  /// Updates the time spent on a given day
  void updateTimeSpent({@required String id, @required int timeSpent}) {
    final playerDailyData = _getPlayerDailyData(id: id);
    assert(playerDailyData != null, 'No daily data found for $id');
    playerDailyData.timeSpent += timeSpent;
    box.put(id, playerDailyData);
  }

  /// Resets the database
  @override
  Future<void> reset() async => await box.deleteAll(box.keys);
}