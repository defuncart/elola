import 'package:meta/meta.dart';

import 'package:elola/models/progress.dart';
import 'package:elola/services/i_database.dart';

/// A database of the player's progress
abstract class IProgressDatabase implements IDatabase {
  /// Ensures that the database is in sync with a list of noun ids
  Future<void> resync({@required Iterable<String> ids});

  /// Returns progress by a given noun id
  ///
  /// If the id is not found, `null` is returned
  Progress getProgress({@required String id});

  /// Updates the progress of a given noun
  void updateProgress({@required String id, @required bool answeredCorrectly});
}
