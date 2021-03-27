import 'package:flutter_core_logic/flutter_core_logic.dart' show IService;
import 'package:meta/meta.dart';

import '../models/player_daily_data.dart';

/// A service which interacts with player data databases
abstract class IPlayerDataService implements IService {
  /// Ensures that the database is in sync with a list of noun ids
  Future<void> resync({@required Iterable<String> ids});

  /// Updates the progress of a given noun
  void updateProgress({@required String id, @required bool answeredCorrectly});

  /// Updates the time the user has spent playing
  void updateTimeSpent({@required isPlaying});

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

  /// A `count` number of nouns which the user should learn next
  List<String> nextNouns({@required int count});

  /// The player's `count` number of nouns which can be revised
  ///
  /// Returns `null` if `count` amount does not exist
  List<String> revisionNouns({@required int count});

  /// Returns whether the player has a `minCount` of nouns to revise
  bool hasRevisionNouns({@required int minCount});

  /// The player's `count` number of difficult nouns (which have been learned)
  ///
  /// Returns `null` if `count` amount does not exist
  List<String> difficultNouns({@required int count});

  /// Returns whether the player has a `minCount` of difficult nouns
  bool hasDifficultNouns({@required int minCount});

  /// Returns a list of the last `numDays` `PlayerDailyData`
  ///
  /// Note that this array is never `null` however if there is no valid data, that entry is `null`
  List<PlayerDailyData> recentDailyData({@required numDays});
}
