import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

import 'package:elola/localizations.dart';

/// A collection of helper methods for `DateTime`
abstract class DateTimeUtils {
  /// Returns a `DateTime` for today at midnight in UTC
  static DateTime get todayUtcMidnight {
    final nowUtc = DateTime.now().toUtc();
    return DateTime.utc(nowUtc.year, nowUtc.month, nowUtc.day);
  }

  /// Returns a `DateTime` for a day with `dayDifference` from today at midnight in UTC
  static DateTime computeUtcMidnight({@required int dayDifference}) {
    final utc = DateTime.now().toUtc().add(Duration(days: dayDifference));
    return DateTime.utc(utc.year, utc.month, utc.day);
  }

  /// Returns a list the last `numberDays` days as single letters using the current selected language
  ///
  /// eg. [S, M, T, W, T, F, S] for English, [n, p, w, ś, c, p, s] polski
  static List<String> recentDayNamesSingleLetterLocalized({@required numberDays}) {
    final dateFormatter = DateFormat('E', AppLocalizations.currentLanguage);
    final labels = List.generate(numberDays, (index) => -index)
        .map((item) => DateTimeUtils.computeUtcMidnight(dayDifference: item))
        .map((item) => dateFormatter.format(item).substring(0, 1))
        .toList()
        .reversed
        .toList();
    return labels;
  }
}
