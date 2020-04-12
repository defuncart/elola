import 'package:meta/meta.dart';

import 'package:elola/models/progress.dart';

/// A database of the player's progress
abstract class IProgressDatabase {
  /// Initializes the database
  Future<void> init();

  /// Creates the database with a list of noun ids
  Future<void> create({@required Iterable<String> ids});

  /// Whether the database has data
  bool get hasData;

  /// Returns progress by a given noun id
  ///
  /// If the id is not found, `null` is returned
  Progress getProgress({@required String id});

  /// Updates the progress of a given noun
  void updateProgress({@required String id, @required bool answeredCorrectly});

  /// Resets all progress
  void reset();

  /// Prints the database to the console
  void debugPrint();
}
