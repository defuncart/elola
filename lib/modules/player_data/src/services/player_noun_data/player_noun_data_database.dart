import 'package:flutter/foundation.dart' show debugPrint;
import 'package:meta/meta.dart';

import 'package:elola/models/player_noun_data.dart';
import 'package:elola/services/base_hive_database.dart';

import 'i_player_noun_data_database.dart';

/// A database of the player's data
class PlayerNounDataDatabase extends BaseHiveDatabase<PlayerNounData> implements IPlayerNounDataDatabase {
  //// A name for the box
  @override
  String get boxName => 'playerNounData';

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

    assert(box.length == ids.length, 'Database size mis-match.');
  }

  /// Returns `PlayerNounData` for a given noun id
  ///
  /// If the id is not found, `null` is returned
  PlayerNounData _getPlayerNounData({@required String id}) => hasData && id != null ? box.get(id) : null;

  /// Updates the progress of a given noun
  @override
  void updateProgress({@required String id, @required bool answeredCorrectly}) {
    final playerNounData = _getPlayerNounData(id: id);
    if (playerNounData != null) {
      playerNounData.updateProgress(answeredCorrectly: answeredCorrectly);
      box.put(id, playerNounData);
    }
  }

  /// Returns the player's total progress
  @override
  double get totalProgress =>
      hasData ? (box.values.where((playerNounData) => playerNounData.attempts > 0).length / box.values.length) : 0;

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
  bool get hasFavorites => hasData ? box.values.where((playerNounData) => playerNounData.isFavorite).isNotEmpty : false;

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
      ? box.values
          .where((playerNounData) => playerNounData.isFavorite)
          .map((playerNounData) => playerNounData.id)
          .toList()
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
    final playerNounData = _getPlayerNounData(id: id);
    if (playerNounData != null) {
      return playerNounData.isFavorite;
    }

    return false;
  }

  /// Toggles whether a noun is a favorite
  @override
  void toggleIsFavorite({@required String id}) {
    final playerNounData = _getPlayerNounData(id: id);
    if (playerNounData != null) {
      playerNounData.isFavorite = !playerNounData.isFavorite;
      box.put(id, playerNounData);
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
    for (final playerNounData in box.values) {
      playerNounData.reset();
      box.put(playerNounData.id, playerNounData);
    }
  }

  /// A `count` number of nouns which the user should learn next
  @override
  List<String> nextNouns({@required int count}) {
    if (hasData && count > 0) {
      if (box.values.length >= count) {
        final unlearnedNouns = box.values.where((element) => !element.isLearned).toList();
        unlearnedNouns.shuffle();
        final learnedNouns = box.values.where((element) => element.isLearned).toList();
        learnedNouns.sort((a, b) => a.percentageCorrect.compareTo(b.percentageCorrect));
        final combinedNouns = [...unlearnedNouns, ...learnedNouns];
        return combinedNouns.take(count).map((e) => e.id).toList();
      }
    }

    return null;
  }

  /// The player's `count` number of nouns which can be revised
  ///
  /// Returns `null` if `count` amount does not exist
  List<String> revisionNouns({@required int count}) {
    if (hasData && count > 0) {
      final learnedNouns = box.values.where((element) => element.isLearned).toList();
      if (learnedNouns.length >= count) {
        // TODO consider spaced repetition
        learnedNouns.shuffle();
        return learnedNouns.take(count).map((e) => e.id).toList();
      }
    }

    return null;
  }

  /// The player's `count` number of difficult nouns (which have been learned)
  ///
  /// Returns 'null' if `count` amount does not exist
  @override
  List<String> difficultNouns({@required int count}) {
    if (hasData && count > 0) {
      final learnedNouns = box.values.where((element) => element.hasMistakes).toList();
      if (learnedNouns.length >= count) {
        learnedNouns.sort((a, b) => a.percentageCorrect.compareTo(b.percentageCorrect));
        learnedNouns.shuffle();
        return learnedNouns.take(count).map((e) => e.id).toList();
      }
    }

    return null;
  }

  /// Returns whether a noun is learned
  @override
  bool getIsLearned({@required String id}) => _getPlayerNounData(id: id)?.isLearned ?? false;
}
