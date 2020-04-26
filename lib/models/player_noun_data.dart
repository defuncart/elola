import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:elola/configs/hive_adapter_type.dart';

part 'player_noun_data.g.dart';

/// A model represeting a player's data on a given noun
@HiveType(typeId: HiveAdapterType.playerNounData)
class PlayerNounData {
  /// The noun's id
  @HiveField(0)
  final String id;

  /// The number of attempts
  @HiveField(1)
  int attempts;

  /// The number of times correct
  @HiveField(2)
  int timesCorrect;

  /// Whether the noun is a favorite
  @HiveField(3)
  bool isFavorite;

  /// When the noun was last seen
  @HiveField(4)
  DateTime lastSeen;

  PlayerNounData({@required this.id});

  /// Whether the noun is learned
  ///
  /// In the future this could be calculated more inteligently, i.e. considering lastSeen
  bool get isLearned => attempts > 0;

  /// The percentage (between 0 and 1) that the player was correct
  double get percentageCorrect => isLearned ? timesCorrect / attempts : 0;

  /// Updates the progress
  void updateProgress({@required bool answeredCorrectly}) {
    attempts++;
    if (answeredCorrectly) {
      timesCorrect++;
    }
    lastSeen = DateTime.now().toUtc();
  }

  /// Resets the progress
  void reset() {
    attempts = 0;
    timesCorrect = 0;
    isFavorite = false;
    lastSeen = null;
  }

  @override
  String toString() =>
      '{$id: {attempts: $attempts, timesCorrect: $timesCorrect, isFavorite: $isFavorite, isLearned: $isLearned, percentageCorrect: $percentageCorrect, lastSeen: $lastSeen}}';
}
