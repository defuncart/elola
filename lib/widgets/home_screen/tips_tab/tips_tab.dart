import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_tips/noun_tips.dart';
import 'package:elola/widgets/home_screen/content_tab.dart';
import 'package:elola/widgets/home_screen/settings_tab/settings_store.dart';

class TipsTab extends StatelessWidget {
  const TipsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);
    final nounTipsService = Provider.of<INounTipsService>(context);
    final tips = nounTipsService.tips(language: settingsStore.language);

    return ContentTab(
      title: AppLocalizations.tipsTabTitle,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: tips.length,
              itemBuilder: (_, index) => ExpansionTile(
                title: Text(tips[index].title),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Html(
                      data: tips[index].content,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 32),
        ],
      ),
      addScrollability: false,
    );
  }
}
