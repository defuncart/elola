import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/home_screen/content_tab.dart';
import 'package:elola/widgets/home_screen/insights_tab/difficult_nouns_panel.dart';
import 'package:elola/widgets/home_screen/insights_tab/statistics_panel.dart';

class InsightsTab extends StatelessWidget {
  const InsightsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentTab(
      title: AppLocalizations.insightsTabTitle,
      child: Column(
        children: <Widget>[
          Container(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DifficultNounsPanel(),
          ),
          Container(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: StatisticsPanel(),
          ),
          Container(height: 32),
        ],
      ),
    );
  }
}
