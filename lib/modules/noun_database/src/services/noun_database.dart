import 'package:flutter_core_logic/flutter_core_logic.dart' show BaseHiveDatabase;
import 'package:meta/meta.dart';

import '../enums/category.dart';
import '../models/noun.dart';
import '../utils/noun_database_importer.dart';
import 'i_noun_database.dart';

/// A database of nouns
class NounDatabase extends BaseHiveDatabase<Noun> implements INounDatabase {
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

  @override
  List<Noun> get nouns {
    if (hasData) {
      final nouns = box.values.toList(growable: false);
      nouns.sort((a, b) => a.emoji.compareTo(b.emoji));
      return nouns;
    }

    return null;
  }

  @override
  Noun getNoun({@required String id}) => hasData && id != null ? box.get(id) : null;

  @override
  List<Noun> getNounsByCategory(Category category) {
    return box.values.where((noun) => noun.category == category).toList();
  }

  @override
  List<Noun> getNounsByIds(List<String> ids) {
    final returnList = <Noun>[];
    for (final id in ids) {
      if (box.containsKey(id)) {
        returnList.add(box.get(id));
      }
    }
    return returnList;
  }

  @override
  Future<void> reset() async {
    await box.deleteAll(box.keys);

    await _importFromJson();
  }
}
