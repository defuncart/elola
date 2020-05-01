import 'package:elola/models/noun.dart';
import 'package:elola/utils/date_time_utils.dart';
import 'package:elola/widgets/common/buttons/noun_favorite_button.dart';
import 'package:elola/widgets/common/buttons/noun_listen_button.dart';
import 'package:elola/widgets/common/tiles/noun_tile.dart';
import 'package:elola/widgets/home_screen/home_tab/panel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:elola/modules/player_data/player_data.dart';
import 'package:elola/widgets/home_screen/content_tab.dart';

class InsightsTab extends StatelessWidget {
  static const _numberDifficultNouns = 5;

  const InsightsTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ids = Provider.of<IPlayerDataService>(context).difficultNouns(count: _numberDifficultNouns);
    final nouns = ids != null ? Provider.of<INounDatabase>(context).getNounsByIds(ids) : null;
    final recentDailyData = Provider.of<IPlayerDataService>(context).recentDailyData(numDays: 7);
    print(recentDailyData);
    final hasRecentData = !recentDailyData.every((element) => element == null);
    // final labels =
    final dateFormatter = DateFormat('E', AppLocalizations.currentLanguage);
    final labels = List.generate(7, (index) => -index)
        .map((item) => DateTimeUtils.computeUtcMidnight(item))
        .map((e) => dateFormatter.format(e).substring(0, 1))
        .toList()
        .reversed
        .toList();
    print(labels);

    return ContentTab(
      title: AppLocalizations.insightsTabTitle,
      child: Column(
        children: <Widget>[
          Container(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Panel(
              title: AppLocalizations.insightsTabDifficultNounsLabel,
              child: Container(
                width: double.infinity,
                child: nouns != null
                    ? Column(
                        children: <Widget>[
                          for (final noun in nouns) _NounTile(noun: noun),
                        ],
                      )
                    : Text(AppLocalizations.insightsTabNotStarted),
              ),
            ),
          ),
          Container(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Panel(
              title: AppLocalizations.insightsTabStatisticsLabel,
              child: Container(
                width: double.infinity,
                height: 100,
                child: hasRecentData
                    ? Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          for (int index = 0; index < recentDailyData.length; index++)
                            _Bar(
                              nounsLearned: recentDailyData[index]?.nounsLearned ?? 0,
                              nounsPracticed: recentDailyData[index]?.nounsPracticed ?? 0,
                              label: labels[index],
                              barWidth: 15,
                            ),
                        ],
                      )
                    : Center(
                        child: Text(AppLocalizations.insightsTabNotStarted),
                      ),
              ),
            ),
          ),
        ],
      ),
      addScrollability: true,
    );
  }
}

class _Bar extends StatelessWidget {
  static const _maxHeight = 100.0;
  static const _clampNouns = 10.0;

  final int nounsLearned;
  final int nounsPracticed;
  final String label;
  final double barWidth;

  const _Bar({
    @required this.nounsLearned,
    @required this.nounsPracticed,
    @required this.label,
    this.barWidth = 20,
    Key key,
  }) : super(key: key);

  double get _learnedSize => nounsLearned >= _clampNouns ? _maxHeight : (nounsLearned / _clampNouns) * _maxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 1.0,
                ),
                color: Theme.of(context).accentColor,
              ),
              width: barWidth,
              // height: nounsLearned.clamp(0, _clampNouns) * _maxHeight,
              height: _learnedSize,
              // color: Theme.of(context).accentColor,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).accentColor,
                  width: 1.0,
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              width: barWidth,
              height: nounsPracticed.clamp(0, _clampNouns) * _maxHeight,
            )
          ],
        ),
        Container(height: 4),
        Text(label),
      ],
    );
  }
}

// TODO consider if this should be merged with NounTile or named differently
class _NounTile extends StatelessWidget {
  final Noun noun;

  const _NounTile({
    Key key,
    @required this.noun,
  })  : assert(noun != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          noun.emoji,
          style: TextStyle(fontSize: 40),
        ),
        Container(width: 16),
        Expanded(
          child: Text(
            noun.inFull,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NounListenButton(noun: noun),
            NounFavoriteButton(noun: noun),
          ],
        ),
      ],
    );
  }
}
