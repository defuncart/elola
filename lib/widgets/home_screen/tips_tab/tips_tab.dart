import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_tips/noun_tips.dart';
import 'package:elola/widgets/home_screen/content_tab.dart';
import 'package:elola/widgets/home_screen/settings_tab/settings_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              itemBuilder: (_, index) => TipTile(
                title: tips[index].title,
                content: tips[index].content,
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
