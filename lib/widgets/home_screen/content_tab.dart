import 'package:flutter/material.dart';

class ContentTab extends StatelessWidget {
  final String title;
  final Widget child;
  final bool addScrollability;

  const ContentTab({
    @required this.title,
    @required this.child,
    this.addScrollability = true,
    Key key,
  })  : assert(title != null),
        assert(child != null),
        assert(addScrollability != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: addScrollability ? SingleChildScrollView(child: child) : child,
    );
  }
}
