import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:elola/configs/hive_adapter_type.dart';

part 'player_daily_data.g.dart';

/// A model represeting a player's data on daily progress
@HiveType(typeId: HiveAdapterType.playerDailyData)
class PlayerDailyData {
  /// An id representing the date
  @HiveField(0)
  final String id;

  /// The number of new nouns learned
  @HiveField(1)
  int nounsLearned;

  /// The number learned nouns practiced
  @HiveField(2)
  int nounsPracticed;

  /// The total time spent (im ms)
  @HiveField(3)
  double timeSpent;

  PlayerDailyData({@required this.id});

  /// The date which this data corresponds to
  DateTime get date => DateTime.tryParse(id);

  /// Inits the model
  void init() {
    nounsLearned = 0;
    nounsPracticed = 0;
    timeSpent = 0;
  }

  @override
  String toString() => '{$id: {nounsLearned: $nounsLearned, nounsPracticed: $nounsPracticed, timeSpent: $timeSpent}}';
}
