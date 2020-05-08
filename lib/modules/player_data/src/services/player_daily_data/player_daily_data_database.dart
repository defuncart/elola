import 'package:elola/models/player_daily_data.dart';
import 'package:elola/utils/date_time_utils.dart';
import 'package:flutter_core_logic/flutter_core_logic.dart' show BaseHiveDatabase;
import 'package:meta/meta.dart';

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

  /// Returns a list of the last `numDays` `PlayerDailyData`
  ///
  /// Assumes that `numDays` is positive
  /// Note that this array is never `null` however if there is no valid data, that entry is `null`
  List<PlayerDailyData> recentDailyData({@required numDays}) {
    assert(numDays > 0);
    final ids = List.generate(numDays, (index) => -index)
        .map((item) => DateTimeUtils.computeUtcMidnight(dayDifference: item).toString());
    return ids.map((id) => box.get(id)).toList().reversed.toList();
  }
}
