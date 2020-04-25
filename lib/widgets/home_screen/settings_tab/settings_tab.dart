import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/home_screen/content_tab.dart';
import 'package:elola/widgets/home_screen/settings_tab/settings_store.dart';

class SettingsTab extends StatelessWidget {
  static final _languages = {
    'en': 'English',
    'de': 'Deutsch',
    'pl': 'Polski',
  };

  const SettingsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<SettingsStore>(context);

    return ContentTab(
      title: AppLocalizations.settingsTabTitle,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppLocalizations.settingsTabDarkModeLabel),
                      Observer(
                        builder: (_) => Switch(
                          value: store.isDarkMode,
                          onChanged: (value) => store.isDarkMode = value,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(AppLocalizations.settingsTabLanguageLabel),
                    ),
                    SizedBox(height: 8.0),
                    Observer(
                      builder: (_) => RadioButtonGroup(
                        labels: _languages.values.toList(),
                        onChange: (_, selectedIndex) => store.language = _languages.keys.toList()[selectedIndex],
                        picked: _languages[store.language],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
