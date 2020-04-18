/// A service which determines what noun should be showcased on given days
abstract class INounOfTheDayService {
  /// Initializes the service
  Future<void> init();

  /// Returns the id of the noun of the day for today
  String get today;
}
