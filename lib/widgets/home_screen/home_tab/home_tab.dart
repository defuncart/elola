import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/nouns_screen/nouns_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(AppLocalizations.homeTabViewAllNouns),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => NounsScreen(),
          ),
        ),
      ),
    );
  }
}
