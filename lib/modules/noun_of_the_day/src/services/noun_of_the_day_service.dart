import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'i_noun_of_the_day_service.dart';
import '../models/import_model.dart';

/// A service which determines what noun should be showcased on given days
class NounOfTheDayService implements INounOfTheDayService {
  static const _jsonAssetPath = 'assets/database/nouns_of_the_day.json';

  List<String> _order;
  DateTime _startDate;

  bool get _hasValidData => _order != null && _order.length > 0 && _startDate != null;
  int get _cycleLength => _order?.length;

  /// Initializes the service
  Future<void> init() async {
    String data = await rootBundle.loadString(_jsonAssetPath);
    final importModel = ImportModel.fromJson(json.decode(data));
    _order = importModel?.order;
    _startDate = importModel?.startDate;
  }

  /// Returns the id of the noun of the day for today
  ///
  /// `null` implies that there is no valid noun for today
  String get today {
    if (_hasValidData) {
      final nowUtc = DateTime.now().toUtc();
      final todayUtcMidnight = DateTime.utc(nowUtc.year, nowUtc.month, nowUtc.day);
      final numberDaysSinceCycleBegan = todayUtcMidnight.difference(_startDate).inDays;

      if (numberDaysSinceCycleBegan >= 0) {
        final index = numberDaysSinceCycleBegan % _cycleLength;
        return _order[index];
      }
    }

    return null;
  }
}
