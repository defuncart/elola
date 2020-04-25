import 'package:flutter/material.dart';

import 'package:elola/localizations.dart';
import 'package:elola/widgets/home_screen/content_tab.dart';
import 'package:elola/widgets/home_screen/home_tab/favorites_panel.dart';
import 'package:elola/widgets/home_screen/home_tab/noun_of_the_day_panel.dart';
import 'package:elola/widgets/home_screen/home_tab/progress_panel.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentTab(
      title: AppLocalizations.homeTabTitle,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NounOfTheDayPanel(),
            ),
            Container(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ProgressPanel(),
            ),
            Container(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FavoritesPanel(),
            ),
            Container(height: 24),
          ],
        ),
      ),
    );
  }
}
