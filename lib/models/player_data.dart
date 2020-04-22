import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:elola/configs/hive_adapter_type.dart';

part 'player_data.g.dart';

/// A model represeting a player's data on a given noun
@HiveType(typeId: HiveAdapterType.playerData)
class PlayerData {
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

  PlayerData({@required this.id});

  /// The percentage (between 0 and 1) that the player was correct
  double get percentageCorrect => attempts > 0 ? timesCorrect / attempts : 0;

  /// Updates the progress
  void updateProgress({@required bool answeredCorrectly}) {
    attempts++;
    if (answeredCorrectly) {
      timesCorrect++;
    }
  }

  /// Resets the progress
  void reset() {
    attempts = 0;
    timesCorrect = 0;
    isFavorite = false;
  }

  @override
  String toString() =>
      '{$id: {attempts: $attempts, timesCorrect: $timesCorrect, isFavorite: $isFavorite, percentageCorrect: $percentageCorrect}}';
}
