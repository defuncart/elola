import 'package:flutter/material.dart';

class ContentTab extends StatelessWidget {
  final String title;
  final Widget child;

  const ContentTab({
    @required this.title,
    @required this.child,
    Key key,
  })  : assert(title != null),
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child,
    );
  }
}
