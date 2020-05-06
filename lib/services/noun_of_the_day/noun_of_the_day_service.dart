import 'package:meta/meta.dart';

import 'package:flutter_core_logic/flutter_core_logic.dart' show BaseItemOfTheDayService;

import 'i_noun_of_the_day_service.dart';

/// A service which determines what noun should be showcased on given days
class NounOfTheDayService extends BaseItemOfTheDayService implements INounOfTheDayService {
  static const _jsonAssetPath = 'assets/database/nouns_of_the_day.json';

  /// A path to the json asset
  @protected
  String get jsonAssetPath => _jsonAssetPath;

  /// Whether the items should be looped when all have already been shown
  @protected
  bool get shouldLoop => true;
}
