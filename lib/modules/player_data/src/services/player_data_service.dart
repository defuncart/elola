import 'package:elola/utils/date_time_utils.dart';
import 'package:meta/meta.dart';

import '../models/player_daily_data.dart';
import 'i_player_data_service.dart';
import 'player_daily_data/i_player_daily_data_database.dart';
import 'player_daily_data/player_daily_data_database.dart';
import 'player_noun_data/i_player_noun_data_database.dart';
import 'player_noun_data/player_noun_data_database.dart';

/// A service which interacts with player data databases
class PlayerDataService implements IPlayerDataService {
  IPlayerNounDataDatabase _nounDataDatabase = PlayerNounDataDatabase();
  IPlayerDailyDataDatabase _dailyDataDatabase = PlayerDailyDataDatabase();
  Stopwatch _stopwatch = Stopwatch();

  /// Initializes the service
  @override
  Future<void> init() async {
    await _nounDataDatabase.init();
    await _dailyDataDatabase.init();
  }

  /// Ensures that the database is in sync with a list of noun ids
  @override
  Future<void> resync({@required Iterable<String> ids}) async => await _nounDataDatabase.resync(ids: ids);

  String get _dailyId => DateTimeUtils.todayUtcMidnight.toString();

  /// Updates the progress of a given noun
  @override
  void updateProgress({@required String id, @required bool answeredCorrectly}) {
    bool isLearned = _nounDataDatabase.getIsLearned(id: id);
    _nounDataDatabase.updateProgress(id: id, answeredCorrectly: answeredCorrectly);
    _dailyDataDatabase.updateProgress(id: _dailyId, isLearned: isLearned);
  }

  /// Updates the time the user has spent playing
  void updateTimeSpent({@required isPlaying}) {
    _dailyDataDatabase.ensureDataExists(id: _dailyId);

    if (isPlaying && !_stopwatch.isRunning) {
      _stopwatch.start();
    } else if (!isPlaying) {
      _stopwatch.stop();
      _dailyDataDatabase.updateTimeSpent(id: _dailyId, timeSpent: _stopwatch.elapsedMilliseconds);
      _stopwatch.reset();
    }
  }

  /// Returns the player's total progress
  @override
  double get totalProgress => _nounDataDatabase.totalProgress;

  /// Watches and returns the player's total progress
  @override
  Stream<double> get watchTotalProgress => _nounDataDatabase.watchTotalProgress;

  /// Whether the user has at least one favorite
  @override
  bool get hasFavorites => _nounDataDatabase.hasFavorites;

  /// Whether the user has at least one favorite
  @override
  Stream<bool> get watchHasFavorites => _nounDataDatabase.watchHasFavorites;

  /// Returns an iterable of noun ids which are marked as favorites
  @override
  List<String> get favorites => _nounDataDatabase.favorites;

  /// Watches for changes and returns an iterable of noun ids which are marked as favorites
  @override
  Stream<List<String>> get watchFavorites => _nounDataDatabase.watchFavorites;

  /// Returns whether a noun is a favorite
  @override
  bool getIsFavorite({@required String id}) => _nounDataDatabase.getIsFavorite(id: id);

  /// Toggles whether a noun is a favorite
  @override
  void toggleIsFavorite({@required String id}) => _nounDataDatabase.toggleIsFavorite(id: id);

  /// Watches for changes on `isFavorite` for a given noun
  @override
  Stream<bool> watchIsFavorite({@required String id}) => _nounDataDatabase.watchIsFavorite(id: id);

  /// Resets the service
  @override
  Future<void> reset() async {
    await _nounDataDatabase.reset();
    await _dailyDataDatabase.reset();
  }

  /// A `count` number of nouns which the user should be shown next
  @override
  List<String> nextNouns({@required int count}) => _nounDataDatabase.nextNouns(count: count);

  /// The player's `count` number of nouns which can be revised
  ///
  /// Returns `null` if `count` amount does not exist
  @override
  List<String> revisionNouns({@required int count}) => _nounDataDatabase.revisionNouns(count: count);

  /// Returns whether the player has a `minCount` of nouns to revise
  @override
  bool hasRevisionNouns({@required int minCount}) => _nounDataDatabase.numberLearnedNouns >= minCount;

  /// The player's `count` number of difficult nouns (which have been learned)
  ///
  /// Returns 'null' if `count` amount does not exist.
  @override
  List<String> difficultNouns({@required int count}) => _nounDataDatabase.difficultNouns(count: count);

  /// Returns whether the player has a `minCount` of difficult nouns.
  @override
  bool hasDifficultNouns({@required int minCount}) => _nounDataDatabase.numberDifficultNouns >= minCount;

  /// Prints the service to the console
  @override
  void debugPrint() {
    _nounDataDatabase.debugPrint();
    _dailyDataDatabase.debugPrint();
  }

  /// Returns a list of the last `numDays` `PlayerDailyData`
  ///
  /// Note that this array is never `null` however if there is no valid data, that entry is `null`
  List<PlayerDailyData> recentDailyData({@required numDays}) => _dailyDataDatabase.recentDailyData(numDays: numDays);

  @override
  String toString() =>
      'learned: ${_nounDataDatabase.numberLearnedNouns}, ' +
      'difficult: ${_nounDataDatabase.numberDifficultNouns}, ' +
      'hasFavorites: ${_nounDataDatabase.hasFavorites}';
}
