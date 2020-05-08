import 'package:elola/models/player_daily_data.dart';
import 'package:elola/models/player_noun_data.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// A collection of helper methods for hive
class HiveUtils {
  static Future<void> init() async {
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    }
    Hive.registerAdapter(NounAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(PlayerNounDataAdapter());
    Hive.registerAdapter(PlayerDailyDataAdapter());
  }
}
