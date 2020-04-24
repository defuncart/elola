import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validate_unicode/flutter_validate_unicode.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_validate_unicode');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return true;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isCharacterSupported', () async {
    expect(await FlutterValidateUnicode.isCharacterSupported('bla'), true);
  });
}
