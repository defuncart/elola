import 'package:meta/meta.dart';

class Tip {
  final String id;
  final Map<String, LocalizedTip> localizedTips;

  Tip({
    @required this.id,
    @required this.localizedTips,
  })  : assert(id != null),
        assert(localizedTips != null);

  LocalizedTip localizedTip({@required String language}) {
    if (language != null) {
      return localizedTips[language];
    }

    return null;
  }

  @override
  String toString() => '{id: $id, localizedTips: $localizedTips}';
}

class LocalizedTip {
  final String title;
  final String content;

  LocalizedTip({
    @required this.title,
    @required this.content,
  });

  @override
  String toString() => '{title: $title, content: $content}';
}
