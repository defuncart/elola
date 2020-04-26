/// A collection of helper methods for `DateTime`
abstract class DateTimeUtils {
  /// Returns a `DateTime` for today at midnight in UTC
  static DateTime get todayUtcMidnight {
    final nowUtc = DateTime.now().toUtc();
    return DateTime.utc(nowUtc.year, nowUtc.month, nowUtc.day);
  }
}
