import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:elola/enums/category.dart';
import 'package:elola/models/noun.dart';
import 'package:elola/models/player_data.dart';

/// A collection of helper methods for hive
class HiveUtils {
  static Future<void> init() async {
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    }
    Hive.registerAdapter(NounAdapter());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(PlayerDataAdapter());
  }
}
