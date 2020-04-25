import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/home_screen/content_tab.dart';

class InsightsTab extends StatelessWidget {
  const InsightsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentTab(
      title: AppLocalizations.insightsTabTitle,
      child: Center(
        child: Text(AppLocalizations.generalCommingSoon),
      ),
      addScrollability: false,
    );
  }
}
