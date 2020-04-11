import 'package:elola/enums/category.dart';
import 'package:elola/models/noun.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'i_noun_database.dart';
import '../utils/noun_database_importer.dart';

/// A database of nouns
class NounDatabase implements INounDatabase {
  /// A box to store all verbs
  Box _box;

  /// A name for the nouns box
  static const _boxName = 'nouns';

  /// Initializes the database
  @override
  Future<void> init() async {
    if (_box == null) {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      Hive.registerAdapter(NounAdapter());
      Hive.registerAdapter(CategoryAdapter());
      _box = await Hive.openBox<Noun>(_boxName);
    }

    if (!hasData) {
      await _importFromJson();
    }
  }

  /// Imports a database from json
  Future<void> _importFromJson() async {
    final verbs = await NounDatabaseImporter.import();
    for (final verb in verbs) {
      // hive keys need to be plain ascii, thus normalize infinitiv
      await _box.put(verb.id, verb);
    }
  }

  /// Whether the database has data
  @override
  bool get hasData => _box != null && _box.length > 0;

  /// Returns a noun by a given id
  ///
  /// If the id is not found, `null` is returned
  @override
  Noun getNoun(String id) => hasData ? _box.get(id) : null;

  /// Returns all nouns (sorted by emoji value)
  @override
  List<Noun> getNouns() {
  if(hasData) {
    final nouns = _box.values.toList(growable: false);
    nouns.sort((a, b) => a.emoji.compareTo(b.emoji));
    return nouns;
  }

  return null;
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
