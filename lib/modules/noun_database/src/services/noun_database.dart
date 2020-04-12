import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:elola/enums/category.dart';
import 'package:elola/models/noun.dart';

import 'i_noun_database.dart';
import '../utils/noun_database_importer.dart';

/// A database of nouns
class NounDatabase implements INounDatabase {
  /// A box to store all nouns
  Box<Noun> _box;

  /// A name for the nouns box
  static const _boxName = 'nouns';

  /// Initializes the database
  @override
  Future<void> init() async {
    if (_box == null) {
      _box = await Hive.openBox<Noun>(_boxName);
    }

    if (!hasData) {
      await _importFromJson();
    }
  }

  /// Imports a database from json
  Future<void> _importFromJson() async {
    final nouns = await NounDatabaseImporter.import();
    for (final noun in nouns) {
      await _box.put(noun.id, noun);
    }
  }

  /// Whether the database has data
  @override
  bool get hasData => _box != null && _box.length > 0;

  /// Returns all nouns (sorted by emoji value)
  @override
  List<Noun> get nouns {
    if (hasData) {
      final nouns = _box.values.toList(growable: false);
      nouns.sort((a, b) => a.emoji.compareTo(b.emoji));
      return nouns;
    }

    return null;
  }

  /// Returns a noun by a given id
  ///
  /// If the id is not found, `null` is returned
  @override
  Noun getNoun({@required String id}) => hasData ? _box.get(id) : null;

  /// Returns a list of nouns with a given category
  @override
  List<Noun> getNouns({@required Category category}) {
    return _box.values.where((noun) => noun.category == category).toList();
  }

  /// Resets the database
  @override
  Future<void> reset() async {
    if (hasData) {
      _box.deleteAll(_box.keys);
    }

    await _importFromJson();
  }
}
