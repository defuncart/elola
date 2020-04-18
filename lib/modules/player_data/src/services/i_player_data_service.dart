import 'package:meta/meta.dart';

import 'package:elola/services/i_database.dart';

/// A database of the player's data
abstract class IPlayerDataService implements IDatabase {
  /// Ensures that the database is in sync with a list of noun ids
  Future<void> resync({@required Iterable<String> ids});

  /// Updates the progress of a given noun
  void updateProgress({@required String id, @required bool answeredCorrectly});

  /// Whether the user has at least one favorite
  bool get hasFavorites;

  /// Watches for changes if the user has at least one favorite
  Stream<bool> get watchHasFavorites;

  /// Returns whether a noun is a favorite
  bool getIsFavorite({@required String id});

  /// Toggles whether a noun is a favorite
  void toggleIsFavorite({@required String id});

  /// Watches for changes on `isFavorite` for a given noun
  Stream<bool> watchIsFavorite({@required String id});
}
