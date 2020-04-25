import 'package:meta/meta.dart';

/// A model used when importing nouns from json
class ImportNoun {
  final String unicode;
  final String emojiName;
  final String category;
  final String word;

  ImportNoun({
    @required this.unicode,
    @required this.emojiName,
    @required this.category,
    @required this.word,
  });

  factory ImportNoun.fromJson(Map<String, dynamic> json) => ImportNoun(
        unicode: json['unicode'],
        emojiName: json['emojiName'],
        category: json['category'],
        word: json['word'],
      );

  Map<String, dynamic> toJson() => {
        'unicode': emojiName,
        'emojiName': emojiName,
        'category': category,
        'word': word,
      };

  @override
  String toString() => toJson().toString();
}
