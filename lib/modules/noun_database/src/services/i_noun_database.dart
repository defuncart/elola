import 'package:meta/meta.dart';

import 'package:elola/models/noun.dart';

/// A database of nouns
abstract class INounDatabase {
  /// Initializes the database
  Future<void> init();

  /// Whether the database has data
  bool get hasData;

  /// Returns a noun by a given id
  ///
  /// If the id is not found, `null` is returned
  Noun getNoun({@required String id});

  /// Returns all nouns
  List<Noun> get nouns;

  /// Resets the database
  Future<void> reset();
}