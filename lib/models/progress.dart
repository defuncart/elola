import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:elola/configs/hive_adapter_type.dart';

part 'progress.g.dart';

/// A model represeting a player's progress on a given noun
@HiveType(typeId: HiveAdapterType.progress)
class Progress {
  /// A unique id
  @HiveField(0)
  final String id;

  /// The number of attempts
  @HiveField(1)
  int attempts;

  /// The number of times correct
  @HiveField(2)
  int timesCorrect;

  Progress({@required this.id, this.attempts, this.timesCorrect});

  /// Updates the progress
  void update({@required bool answeredCorrectly}) {
    attempts++;
    if (answeredCorrectly) {
      timesCorrect++;
    }
  }

  /// Resets the progress
  void reset() {
    attempts = 0;
    timesCorrect = 0;
  }

  @override
  String toString() => '{$id: {attempts: $attempts, timesCorrect: $timesCorrect}}';
}
