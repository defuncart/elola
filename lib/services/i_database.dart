/// A base interfaces which can be inherited from
abstract class IDatabase {
  /// Initializes the database
  Future<void> init();

  /// Whether the database has data
  bool get hasData;

  /// Resets the database
  Future<void> reset();

  /// Prints the database to the console
  void debugPrint();
}
