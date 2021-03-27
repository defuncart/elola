import 'package:flutter_core_logic/flutter_core_logic.dart' show BaseItemOfTheDayService;
import 'package:meta/meta.dart';

import 'i_noun_of_the_day_service.dart';

/// A service which determines what noun should be showcased on given days
class NounOfTheDayService extends BaseItemOfTheDayService implements INounOfTheDayService {
  static const _jsonAssetPath = 'assets/database/nouns_of_the_day.json';

  @protected
  String get jsonAssetPath => _jsonAssetPath;

  @protected
  bool get shouldLoop => true;
}
