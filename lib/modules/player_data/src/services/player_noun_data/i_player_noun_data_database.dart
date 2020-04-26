import 'package:meta/meta.dart';

import 'package:elola/services/i_database.dart';

/// A database of the player's noun data
abstract class IPlayerNounDataDatabase implements IDatabase {
  /// Ensures that the database is in sync with a list of noun ids
  Future<void> resync({@required Iterable<String> ids});

  /// Updates the progress of a given noun
  void updateProgress({@required String id, @required bool answeredCorrectly});

  /// Returns the player's total progress
  double get totalProgress;

  /// Watches and returns the player's total progress
  Stream<double> get watchTotalProgress;

  /// Whether the user has at least one favorite
  bool get hasFavorites;

  /// Watches for changes if the user has at least one favorite
  Stream<bool> get watchHasFavorites;

  /// Returns an iterable of noun ids which are marked as favorites
  List<String> get favorites;

  /// Watches for changes and returns an iterable of noun ids which are marked as favorites
  Stream<List<String>> get watchFavorites;

  /// Returns whether a noun is a favorite
  bool getIsFavorite({@required String id});

  /// Toggles whether a noun is a favorite
  void toggleIsFavorite({@required String id});

  /// Watches for changes on `isFavorite` for a given noun
  Stream<bool> watchIsFavorite({@required String id});

  /// The player's `count` number of weakest nouns
  List<String> weakestNouns({@required int count});

  /// Returns whether a noun is learned
  bool getIsLearned({@required String id});
}
