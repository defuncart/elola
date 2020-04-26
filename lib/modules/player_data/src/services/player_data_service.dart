import 'package:flutter/foundation.dart' show debugPrint;
import 'package:meta/meta.dart';

import 'package:elola/models/player_noun_data.dart';
import 'package:elola/services/base_hive_database.dart';

import 'i_player_data_service.dart';

/// A database of the player's data
class PlayerDataService extends BaseHiveDatabase<PlayerNounData> implements IPlayerDataService {
  //// A name for the box
  @override
  String get boxName => 'playerData';

  /// Ensures that the database is in sync with a list of noun ids
  @override
  Future<void> resync({@required Iterable<String> ids}) async {
    for (final id in ids) {
      if (!box.containsKey(id)) {
        await box.put(
          id,
          PlayerNounData(id: id)..reset(),
        );
      }
    }

    for (final id in box.keys) {
      if (!ids.contains(id)) {
        debugPrint('Data for $id was deleted from device.');
        await box.delete(id);
      }
    }
  }

  /// Returns `PlayerData` for a given noun id
  ///
  /// If the id is not found, `null` is returned
  PlayerNounData _getPlayerData({@required String id}) => hasData && id != null ? box.get(id) : null;

  /// Updates the progress of a given noun
  @override
  void updateProgress({@required String id, @required bool answeredCorrectly}) {
    final playerData = _getPlayerData(id: id);
    if (playerData != null) {
      playerData.updateProgress(answeredCorrectly: answeredCorrectly);
      box.put(id, playerData);
    }
  }

  /// Returns the player's total progress
  @override
  double get totalProgress =>
      hasData ? (box.values.where((playerData) => playerData.attempts > 0).length / box.values.length) : 0;

  /// Watches and returns the player's total progress
  @override
  Stream<double> get watchTotalProgress async* {
    final events = box.watch();
    await for (final _ in events) {
      yield totalProgress;
    }
  }

  /// Whether the user has at least one favorite
  @override
  bool get hasFavorites => hasData ? box.values.where((playerData) => playerData.isFavorite).isNotEmpty : false;

  /// Whether the user has at least one favorite
  @override
  Stream<bool> get watchHasFavorites async* {
    final events = box.watch();
    await for (final _ in events) {
      yield hasFavorites;
    }
  }

  /// Returns an iterable of noun ids which are marked as favorites
  @override
  List<String> get favorites => hasData
      ? box.values.where((playerData) => playerData.isFavorite).map((playerData) => playerData.id).toList()
      : null;

  /// Watches for changes and returns an iterable of noun ids which are marked as favorites
  @override
  Stream<List<String>> get watchFavorites async* {
    final events = box.watch();
    await for (final _ in events) {
      yield favorites;
    }
  }

  /// Returns whether a noun is a favorite
  @override
  bool getIsFavorite({@required String id}) {
    final playerData = _getPlayerData(id: id);
    if (playerData != null) {
      return playerData.isFavorite;
    }

    return false;
  }

  /// Toggles whether a noun is a favorite
  @override
  void toggleIsFavorite({@required String id}) {
    final playerData = _getPlayerData(id: id);
    if (playerData != null) {
      playerData.isFavorite = !playerData.isFavorite;
      box.put(id, playerData);
    }
  }

  /// Watches for changes on `isFavorite` for a given noun
  @override
  Stream<bool> watchIsFavorite({@required String id}) async* {
    final events = box.watch(key: id);
    await for (final event in events) {
      yield event.value.isFavorite;
    }
  }

  /// Resets the database
  @override
  Future<void> reset() async {
    for (final playerData in box.values) {
      playerData.reset();
      box.put(playerData.id, playerData);
    }
  }

  /// The player's `count` number of weakest nouns
  @override
  List<String> weakestNouns({@required int count}) {
    if (hasData && count > 0) {
      if (box.values.length >= count) {
        final copy = List<PlayerNounData>.from(box.values.toList());
        copy.sort((a, b) => a.percentageCorrect.compareTo(b.percentageCorrect));
        final selection = copy.take(count).map((e) => e.id).toList();
        selection.shuffle();
        return selection;
      }
    }

    return null;
  }
}
