import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/home_screen/content_tab.dart';

class TipsTab extends StatelessWidget {
  const TipsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentTab(
      title: AppLocalizations.tipsTabTitle,
      child: Center(
        child: Text(AppLocalizations.generalCommingSoon),
      ),
    );
  }
}
