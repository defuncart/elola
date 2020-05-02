import 'package:flutter/material.dart';

import 'package:elola/configs/route_names.dart';

class GameSettingsBottomSheet extends StatelessWidget {
  const GameSettingsBottomSheet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(height: 16),
          _GameButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(RouteNames.gameScreen);
            },
            color: Theme.of(context).accentColor,
            icon: Icons.new_releases,
            iconColor: Theme.of(context).bottomAppBarColor,
            label: 'Learn',
          ),
          Container(height: 16),
          Row(
            children: <Widget>[
              _GameButton(
                onPressed: () {},
                color: Theme.of(context).buttonColor,
                icon: Icons.replay,
                iconColor: Theme.of(context).textTheme.button.color,
                label: 'Revise',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GameButton extends StatelessWidget {
  final void Function() onPressed;
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String label;

  const _GameButton({
    Key key,
    @required this.onPressed,
    @required this.color,
    @required this.icon,
    @required this.iconColor,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
          onPressed: onPressed,
          color: color,
          textColor: iconColor,
          child: Icon(
            icon,
            size: 32,
          ),
          padding: EdgeInsets.all(16),
          shape: CircleBorder(),
        ),
        Container(height: 8),
        Text(label),
      ],
    );
  }
}
