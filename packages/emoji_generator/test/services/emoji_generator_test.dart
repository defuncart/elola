import 'package:flutter_test/flutter_test.dart';
import 'package:emoji_generator/emoji_generator.dart';

main() {
  test('Incorrect name', () {
    final emoji = EmojiGenerator.generate(name: 'bla');
    expect(emoji, isNull);
  });

  test('Correct name', () {
    final emoji = EmojiGenerator.generate(name: 'cat');
    expect(emoji, isNotNull);
  });
}
