import 'package:elola/models/noun.dart';
import 'package:elola/widgets/common/buttons/noun_favorite_button.dart';
import 'package:elola/widgets/common/buttons/noun_listen_button.dart';
import 'package:flutter/material.dart';

class NounTile extends StatelessWidget {
  final Noun noun;

  const NounTile({
    Key key,
    @required this.noun,
  })  : assert(noun != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        noun.emoji,
        style: TextStyle(fontSize: 40),
      ),
      title: Text(noun.inFull),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          NounListenButton(noun: noun),
          NounFavoriteButton(noun: noun),
        ],
      ),
    );
  }
}
