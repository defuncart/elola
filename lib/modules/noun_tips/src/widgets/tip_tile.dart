import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TipTile extends StatelessWidget {
  final String title;
  final String content;

  const TipTile({
    Key key,
    @required this.title,
    @required this.content,
  })  : assert(title != null),
        assert(content != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Html(
            data: content,
          ),
        ),
      ],
    );
  }
}
