import 'dart:async';

import 'package:flutter/services.dart';

class FlutterValidateUnicode {
  static const MethodChannel _channel = const MethodChannel('flutter_validate_unicode');

  static Future<bool> isCharacterSupported(String character) async {
    return await _channel.invokeMethod(
      'isCharacterSupported',
      <String, dynamic>{
        "character": character,
      },
    );
  }
}
