// import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class FlutterValidateUnicodePlugin {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'flutter_validate_unicode',
      const StandardMethodCodec(),
      registrar.messenger,
    );
    final FlutterValidateUnicodePlugin instance = FlutterValidateUnicodePlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'isCharacterSupported':
        // TODO implement web check
        return true;
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'The method ${call.method} isn\'t implemented',
        );
    }
  }
}
