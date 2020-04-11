import 'package:emojis/emoji.dart' as emojis;
import 'package:flutter_emoji/flutter_emoji.dart' as flutterEmoji;
import 'package:meta/meta.dart';

/// A service which generates emojis
class EmojiGenerator {
  static final _parser = flutterEmoji.EmojiParser();

  /// Generates an emoji from a given name.
  ///
  /// Returns null if the given name isn't valid.
  static String generate({@required String name}) {
    final emoji = _parser.get(name);
    if (emoji.name.isEmpty) {
      final emoji = emojis.Emoji.byName(name);
      if (emoji != null) {
        return emoji.char;
      }
    } else {
      return emoji.code;
    }

    return null;
  }
}
