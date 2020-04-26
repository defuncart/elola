import 'package:meta/meta.dart';

import 'i_player_data_service.dart';
import 'player_noun_data/i_player_noun_data_database.dart';
import 'player_noun_data/player_noun_data_database.dart';

/// A service which interacts with player data databases
class PlayerDataService implements IPlayerDataService {
  IPlayerNounDataDatabase _playerNounDataDatabase = PlayerNounDataDatabase();

  /// Initializes the service
  @override
  Future<void> init() async => await _playerNounDataDatabase.init();

  /// Ensures that the database is in sync with a list of noun ids
  @override
  Future<void> resync({@required Iterable<String> ids}) async => await _playerNounDataDatabase.resync(ids: ids);

  /// Updates the progress of a given noun
  @override
  void updateProgress({@required String id, @required bool answeredCorrectly}) =>
      _playerNounDataDatabase.updateProgress(id: id, answeredCorrectly: answeredCorrectly);

  /// Returns the player's total progress
  @override
  double get totalProgress => _playerNounDataDatabase.totalProgress;

  /// Watches and returns the player's total progress
  @override
  Stream<double> get watchTotalProgress => _playerNounDataDatabase.watchTotalProgress;

  /// Whether the user has at least one favorite
  @override
  bool get hasFavorites => _playerNounDataDatabase.hasFavorites;

  /// Whether the user has at least one favorite
  @override
  Stream<bool> get watchHasFavorites => _playerNounDataDatabase.watchHasFavorites;

  /// Returns an iterable of noun ids which are marked as favorites
  @override
  List<String> get favorites => _playerNounDataDatabase.favorites;

  /// Watches for changes and returns an iterable of noun ids which are marked as favorites
  @override
  Stream<List<String>> get watchFavorites => _playerNounDataDatabase.watchFavorites;

  /// Returns whether a noun is a favorite
  @override
  bool getIsFavorite({@required String id}) => _playerNounDataDatabase.getIsFavorite(id: id);

  /// Toggles whether a noun is a favorite
  @override
  void toggleIsFavorite({@required String id}) => _playerNounDataDatabase.toggleIsFavorite(id: id);

  /// Watches for changes on `isFavorite` for a given noun
  @override
  Stream<bool> watchIsFavorite({@required String id}) => _playerNounDataDatabase.watchIsFavorite(id: id);

  /// Resets the service
  @override
  Future<void> reset() async => await _playerNounDataDatabase.reset();

  /// The player's `count` number of weakest nouns
  @override
  List<String> weakestNouns({@required int count}) => _playerNounDataDatabase.weakestNouns(count: count);

  /// Prints the service to the console
  @override
  void debugPrint() => _playerNounDataDatabase.debugPrint();
}
