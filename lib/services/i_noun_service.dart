import 'package:elola/models/noun.dart';

/// A convenience service which returns nouns depending on certain conditions
abstract class INounService {
  /// Returns the `Noun` of the day, if applicable, otherwise `null`.
  Noun get nounOfTheDay;

  /// Returns a list of nouns marked as favorites
  List<Noun> get favorites;
}
