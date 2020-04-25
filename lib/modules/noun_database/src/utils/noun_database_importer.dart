import 'dart:convert';

import 'package:flutter/foundation.dart' show describeEnum, debugPrint;
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_validate_unicode/flutter_validate_unicode.dart';

import 'package:elola/configs/constants.dart' as constants;
import 'package:elola/enums/category.dart';
import 'package:elola/models/noun.dart';

import '../models/import_noun.dart';

/// A helper class to import the noun database from json
class NounDatabaseImporter {
  static const _jsonAssetPath = 'assets/database/nouns.json';
  static const _unicodeDelimiter = '-';

  /// Imports all nouns from database
  static Future<List<Noun>> import() async {
    String data = await rootBundle.loadString(_jsonAssetPath);
    final importNouns = (json.decode(data) as List).map((json) => ImportNoun.fromJson(json)).toList();
    final nouns = <Noun>[];
    for (final importNoun in importNouns) {
      final noun = await _toNoun(importNoun);
      if (noun != null) {
        nouns.add(noun);
      }
    }
    return nouns;
  }

  static Future<Noun> _toNoun(ImportNoun importNoun) async {
    assert(importNoun.emojiName.isNullOrEmpty, 'emojiName should not be null or empty. $importNoun');
    assert(importNoun.category.isNullOrEmpty, 'category should not be null or empty. $importNoun');
    assert(importNoun.word.isNullOrEmpty, 'word should not be null or empty. $importNoun');

    // determine id
    final id = importNoun?.emojiName?.toLowerCase()?.replaceAll(' ', '');
    if (id == null) {
      debugPrint('id isn\'t valid for $importNoun.');
      return null;
    }

    // determine emoji string
    String emoji;
    List<String> components = importNoun?.unicode?.split(_unicodeDelimiter);
    components = components.map((component) => '0x' + component).toList();
    final charCodes = components.map((component) => int.tryParse(component));
    if (charCodes.contains(null)) {
      debugPrint('${importNoun.unicode} isn\'t valid.');
      return null;
    }
    emoji = String.fromCharCodes(charCodes);

    // determine if emoji is supported on device
    if (!await FlutterValidateUnicode.isCharacterSupported(emoji)) {
      debugPrint('${importNoun.emojiName} is not valid for this device.');
      return null;
    }

    // determine category
    final category = Category.values.firstWhere(
      (element) => describeEnum(element) == importNoun.category,
      orElse: () => null,
    );
    if (category == null) {
      debugPrint('Category ${importNoun.category} isn\'t valid.');
      return null;
    }

    // determine gender and withoutArticle
    components = importNoun.word.splitOnFirstOccurance(' ');
    if (!(components[0] == constants.el || components[0] == constants.la)) {
      debugPrint('Article for ${importNoun.word} isn\'t valid.');
      return null;
    }
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
