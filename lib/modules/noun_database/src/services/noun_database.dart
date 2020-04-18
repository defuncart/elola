import 'package:meta/meta.dart';

import 'package:elola/enums/category.dart';
import 'package:elola/models/noun.dart';
import 'package:elola/services/base_hive_database.dart';

import 'i_noun_database.dart';
import '../utils/noun_database_importer.dart';

/// A database of nouns
class NounDatabase extends BaseHiveDatabase<Noun> implements INounDatabase {
  /// A name for the box
  @override
  String get boxName => 'nouns';

  /// Custom initialization called after init()
  @override
  Future<void> initialize() async {
    if (!hasData) {
      await _importFromJson();
    }
  }

  /// Imports a database from json
  Future<void> _importFromJson() async {
    final nouns = await NounDatabaseImporter.import();
    for (final noun in nouns) {
      await box.put(noun.id, noun);
    }
  }

  /// Returns all nouns (sorted by emoji value)
  @override
  List<Noun> get nouns {
    if (hasData) {
      final nouns = box.values.toList(growable: false);
      nouns.sort((a, b) => a.emoji.compareTo(b.emoji));
      return nouns;
    }

    return null;
  }

  /// Returns a noun by a given id
  ///
  /// If the id is not found, `null` is returned
  @override
  Noun getNoun({@required String id}) => hasData && id != null ? box.get(id) : null;

  /// Returns a list of nouns with a given category
  @override
  List<Noun> getNouns({@required Category category}) {
    return box.values.where((noun) => noun.category == category).toList();
  }

  /// Resets the database
  @override
  Future<void> reset() async {
    await box.deleteAll(box.keys);

    await _importFromJson();
  }
}
