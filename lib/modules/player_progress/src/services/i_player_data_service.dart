import 'package:meta/meta.dart';

import 'package:elola/services/i_database.dart';

/// A database of the player's data
abstract class IPlayerDataService implements IDatabase {
  /// Ensures that the database is in sync with a list of noun ids
  Future<void> resync({@required Iterable<String> ids});

  /// Updates the progress of a given noun
  void updateProgress({@required String id, @required bool answeredCorrectly});
}
