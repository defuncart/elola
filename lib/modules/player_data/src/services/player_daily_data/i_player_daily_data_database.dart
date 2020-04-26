import 'package:meta/meta.dart';

import 'package:elola/services/i_database.dart';

/// A database of the player's daily data
abstract class IPlayerDailyDataDatabase implements IDatabase {
  /// Updates the progress of a given day
  void updateProgress({@required String id, @required bool isLearned});
}
