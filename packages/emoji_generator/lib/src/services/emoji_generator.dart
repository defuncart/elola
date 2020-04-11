import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:meta/meta.dart';

/// A service which generates emojis
class EmojiGenerator {
  static final _parser = EmojiParser();

  /// Generates an emoji from a given name.
  ///
  /// Returns null if the given name isn't valid.
  static String generate({@required String name}) {
    final emoji = _parser.get(name);
    return emoji.name.isNotEmpty ? emoji.code : null;
  }
}
