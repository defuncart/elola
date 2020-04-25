import 'package:meta/meta.dart';

class ImportModel {
  final String id;
  final Localization localization;

  ImportModel({
    @required this.id,
    @required this.localization,
  });

  factory ImportModel.fromJson(Map<String, dynamic> json) => ImportModel(
        id: json['id'],
        localization: Localization.fromJson(json['localization']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'localization': localization.toJson(),
      };

  @override
  String toString() => toJson().toString();
}

class Localization {
  final LocalizedContent en;
  final LocalizedContent de;
  final LocalizedContent pl;

  Localization({
    @required this.en,
    @required this.de,
    @required this.pl,
  });

  factory Localization.fromJson(Map<String, dynamic> json) => Localization(
        en: LocalizedContent.fromJson(json['en']),
        de: LocalizedContent.fromJson(json['de']),
        pl: LocalizedContent.fromJson(json['pl']),
      );

  Map<String, dynamic> toJson() => {
        'en': en.toJson(),
        'de': de?.toJson(),
        'pl': pl?.toJson(),
      };

  @override
  String toString() => toJson().toString();
}

class LocalizedContent {
  final String title;
  final String content;

  LocalizedContent({
    @required this.title,
    @required this.content,
  });

  factory LocalizedContent.fromJson(Map<String, dynamic> json) {
    final title = json != null ? json['title'] : null;
    final content = json != null ? json['content'] : null;

    if (title == null || content == null) {
      return null;
    }

    return LocalizedContent(
      title: title,
      content: content,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };

  @override
  String toString() => toJson().toString();
}
