import 'package:meta/meta.dart';

import 'package:elola/models/player_daily_data.dart';
import 'package:elola/services/i_service.dart';

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

  /// The player's `count` number of difficult nouns (which have been learned)
  List<String> difficultNouns({@required int count});

  /// A `count` number of nouns which the user should be shown next
  List<String> nextNouns({@required int count});

  /// Returns a list of the last `numDays` `PlayerDailyData`
  ///
  /// Note that this array is never `null` however if there is no valid data, that entry is `null`
  List<PlayerDailyData> recentDailyData({@required numDays});
}
