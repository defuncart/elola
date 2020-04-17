import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';

class CommingSoonTab extends StatelessWidget {
  const CommingSoonTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.generalCommingSoon),
    );
  }
}
