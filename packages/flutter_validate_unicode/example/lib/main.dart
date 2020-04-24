import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_validate_unicode/flutter_validate_unicode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String character = '\u{1fff}';
  // String character = '\u{1f1e6}\u{1f1e8}';
  String character = '\u{1F980}'; //crab supported
  // String character = '\u{1F9AA}'; //oyster not supported
  bool _isSupported = false;
  bool _isComplete = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _isSupported = await FlutterValidateUnicode.isCharacterSupported(character);
    } on PlatformException catch (e) {
      print('Platform exception: $e');
      _isSupported = true;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (mounted) {
      setState(() {
        _isComplete = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_validate_unicode'),
        ),
        body: Center(
          child: _isComplete
              ? Text(
                  'character is ' + (_isSupported ? '' : 'not ') + 'supported',
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
