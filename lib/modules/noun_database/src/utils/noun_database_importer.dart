import 'dart:convert';

import 'package:flutter/foundation.dart' show describeEnum, debugPrint;
import 'package:flutter/services.dart' show rootBundle;

import 'package:emoji_generator/emoji_generator.dart';

import 'package:elola/configs/constants.dart' as constants;
import 'package:elola/enums/category.dart';
import 'package:elola/models/noun.dart';

import '../models/import_noun.dart';

/// A helper class to import the verb database from json
class NounDatabaseImporter {
  static const _jsonAssetPath = 'assets/database/nouns.json';

  /// Imports all nouns from database
  static Future<List<Noun>> import() async {
    String data = await rootBundle.loadString(_jsonAssetPath);
    final importNouns = (json.decode(data) as List).map((json) => ImportNoun.fromJson(json)).toList();
    return importNouns.map((importNoun) => _toNoun(importNoun)).toList(growable: false);
  }

  static Noun _toNoun(ImportNoun importNoun) {
    assert(importNoun.emojiName.isNullOrEmpty, 'emojiName should not be null or empty. $importNoun');
    assert(importNoun.category.isNullOrEmpty, 'category should not be null or empty. $importNoun');
    assert(importNoun.word.isNullOrEmpty, 'word should not be null or empty. $importNoun');

    // determine id
    final id = importNoun?.emojiName?.toLowerCase()?.replaceAll(' ', '');
    if (id == null) {
      debugPrint('id isn\'t valid for $importNoun.');
    }

    // determine emoji
    final emoji = EmojiGenerator.generate(name: importNoun.emojiName);
    if (emoji == null) {
      debugPrint('emojiName ${importNoun.emojiName} isn\'t valid.');
    }

    // determine category
    final category =
        Category.values.firstWhere((element) => describeEnum(element) == importNoun.category, orElse: null);
    assert(category != null, 'Category ${importNoun.category} isn\'t valid.');

    // determine gender and withoutArticle
    List<String> components = importNoun.word.splitOnFirstOccurance(' ');
    assert(components.length == 2, 'word ${importNoun.word} isn\'t valid.');
    final gender = components[0] == constants.el ? 0 : 1;
    final withoutArticle = components.length == 2 ? components.last : null;

    return Noun(
      id: id,
      emoji: emoji,
      category: category,
      inFull: importNoun.word,
      withoutArticle: withoutArticle,
      gender: gender,
    );
  }
}

extension StringExtensions on String {
  List<String> splitOnFirstOccurance(String pattern) {
    final index = this.indexOf(pattern);
    return index != -1 ? [this.substring(0, index), this.substring(index + 1)] : [this];
  }

  bool get isNullOrEmpty => this != null ? this.isNotEmpty : false;
}
