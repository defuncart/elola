import 'package:meta/meta.dart';

class ImportModel {
  final String id;
  final Content content;

  ImportModel({
    @required this.id,
    @required this.content,
  });

  factory ImportModel.fromJson(Map<String, dynamic> json) => ImportModel(
        id: json['id'],
        content: Content.fromJson(json['content']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content.toJson(),
      };

  @override
  String toString() => toJson().toString();
}

class Content {
  final LocalizedContent en;
  final LocalizedContent de;
  final LocalizedContent pl;

  Content({
    @required this.en,
    @required this.de,
    @required this.pl,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
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
  final String description;
  final String content;

  LocalizedContent({
    @required this.title,
    @required this.description,
    @required this.content,
  });

  factory LocalizedContent.fromJson(Map<String, dynamic> json) {
    final title = json != null ? json['title'] : null;
    final description = json != null ? json['description'] : null;
    final content = json != null ? json['content'] : null;

    if (title == null || description == null || content == null) {
      return null;
    }

    return LocalizedContent(
      title: title,
      description: description,
      content: content,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'content': content,
      };

  @override
  String toString() => toJson().toString();
}
