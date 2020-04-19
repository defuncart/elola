import 'package:meta/meta.dart';

import 'package:elola/enums/category.dart';
import 'package:elola/models/noun.dart';
import 'package:elola/services/i_database.dart';

/// A database of nouns
abstract class INounDatabase implements IDatabase {
  /// Returns all nouns
  List<Noun> get nouns;

  /// Returns a noun by a given id
  ///
  /// If the id is not found, `null` is returned
  Noun getNoun({@required String id});

  /// Returns a list of nouns with a given category
  List<Noun> getNounsByCategory(Category category);

  /// Returns a list of nouns with given ids
  List<Noun> getNounsByIds(Iterable<String> ids);
}
