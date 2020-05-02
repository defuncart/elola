import 'package:meta/meta.dart';

import 'package:elola/models/player_daily_data.dart';
import 'package:elola/services/i_database.dart';

/// A database of the player's daily data
abstract class IPlayerDailyDataDatabase implements IDatabase {
  /// Ensures that data exists for an id, creating an instance if required
  void ensureDataExists({@required String id});

  /// Updates the progress of a given day
  void updateProgress({@required String id, @required bool isLearned});

  /// Updates the time spent on a given day
  void updateTimeSpent({@required String id, @required int timeSpent});

  /// Returns a list of the last `numDays` `PlayerDailyData`
  ///
  /// Note that this array is never `null` however if there is no valid data, that entry is `null`
  List<PlayerDailyData> recentDailyData({@required numDays});
}
