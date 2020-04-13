import 'package:meta/meta.dart';

import 'package:elola/models/progress.dart';
import 'package:elola/services/base_hive_database.dart';

import 'i_progress_database.dart';

/// A database of the player's progress
class ProgressDatabase extends BaseHiveDatabase<Progress> implements IProgressDatabase {
  //// A name for the box
  String get boxName => 'progress';

  /// Ensures that the database is in sync with a list of noun ids
  @override
  Future<void> resync({@required Iterable<String> ids}) async {
    for (final id in ids) {
      if (!box.containsKey(id)) {
        await box.put(
          id,
          Progress(id: id, attempts: 0, timesCorrect: 0),
        );
      }
    }
  }

  /// Returns progress by a given noun id
  ///
  /// If the id is not found, `null` is returned
  @override
  Progress getProgress({@required String id}) => hasData ? box.get(id) : null;

  /// Updates the progress of a given noun
  @override
  void updateProgress({@required String id, @required bool answeredCorrectly}) {
    final progress = getProgress(id: id);
    if (progress != null) {
      progress.update(answeredCorrectly: answeredCorrectly);
      box.put(id, progress);
    }
  }

  /// Resets the database
  @override
  Future<void> reset() async {
    for (final progress in box.values) {
      progress.reset();
      box.put(progress.id, progress);
    }
  }
}
