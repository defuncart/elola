import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elola/localizations.dart';
import 'package:elola/modules/player_data/src/services/i_player_data_service.dart';
import 'package:elola/utils/date_time_utils.dart';
import 'package:elola/widgets/common/panels/panel.dart';

class StatisticsPanel extends StatelessWidget {
  static const _numberDaysToDisplay = 7;

  const StatisticsPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentDailyData = Provider.of<IPlayerDataService>(context).recentDailyData(numDays: _numberDaysToDisplay);
    final labels = DateTimeUtils.recentDayNamesSingleLetterLocalized(numberDays: _numberDaysToDisplay);

    return Panel(
      title: AppLocalizations.insightsTabStatisticsLabel,
      child: Container(
        width: double.infinity,
        height: 125,
        child: LayoutBuilder(
          builder: (_, constraints) {
            final width = (constraints.maxWidth / (_numberDaysToDisplay + 1)).floorToDouble();
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (int index = 0; index < recentDailyData.length; index++)
                  _NounsLearnedPracticedDailyBar(
                    nounsLearned: recentDailyData[index]?.nounsLearned ?? 0,
                    nounsPracticed: recentDailyData[index]?.nounsPracticed ?? 0,
                    label: labels[index],
                    totalWidth: width,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NounsLearnedPracticedDailyBar extends StatelessWidget {
  static const _maxHeight = 100.0;
  static const _clampNouns = 10.0;

  final int nounsLearned;
  final int nounsPracticed;
  final String label;
  final double totalWidth;

  const _NounsLearnedPracticedDailyBar({
    @required this.nounsLearned,
    @required this.nounsPracticed,
    @required this.label,
    this.totalWidth = 40,
    Key key,
  })  : assert(nounsLearned != null && nounsLearned >= 0),
        assert(nounsPracticed != null && nounsPracticed >= 0),
        assert(label != null),
        assert(totalWidth != null && totalWidth > 0),
        super(key: key);

  double get _barWidth => totalWidth * 0.5;

  double _determineHeightForProgress(int progress) =>
      progress >= _clampNouns ? _maxHeight : (progress / _clampNouns) * _maxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _Bar(
              width: _barWidth,
              height: _determineHeightForProgress(nounsLearned),
              borderColor: Theme.of(context).accentColor,
              fillColor: Theme.of(context).accentColor,
            ),
            _Bar(
              width: _barWidth,
              height: _determineHeightForProgress(nounsPracticed),
              borderColor: Theme.of(context).accentColor,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ],
        ),
        Container(height: 4),
        Text(label),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  final double width;
  final double height;
  final Color borderColor;
  final Color fillColor;

  const _Bar({
    Key key,
    @required this.width,
    @required this.height,
    @required this.borderColor,
    @required this.fillColor,
  })  : assert(width != null && width > 0),
        assert(height != null && height >= 0),
        assert(borderColor != null),
        assert(fillColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: kIsWeb ? 1 : 0,
        ),
        color: fillColor,
      ),
      width: width,
      height: height,
    );
  }
}
