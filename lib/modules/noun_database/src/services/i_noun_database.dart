import 'package:flutter_core_logic/flutter_core_logic.dart' show IDatabase;
import 'package:meta/meta.dart';

import '../enums/category.dart';
import '../models/noun.dart';

/// A database of nouns
abstract class INounDatabase implements IDatabase {
  /// Returns all nouns (sorted by emoji value)
  List<Noun> get nouns;

  /// Returns a noun by a given id
  ///
  /// If the id is not found, `null` is returned
  Noun getNoun({@required String id});

  /// Returns a list of nouns with a given category
  List<Noun> getNounsByCategory(Category category);

  /// Returns a list of nouns from given ids
  List<Noun> getNounsByIds(List<String> ids);
}
