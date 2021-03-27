import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:meta/meta.dart';

import '../models/import_model.dart';
import '../models/tip.dart';
import 'i_noun_tips_service.dart';

/// A service which offers various noun tips
class NounTipsService implements INounTipsService {
  static const _jsonAssetPath = 'assets/database/tips.json';
  List<Tip> _tips;

  @override
  Future<void> init() async {
    final data = await rootBundle.loadString(_jsonAssetPath);
    final importModels = (json.decode(data) as List).map((json) => ImportModel.fromJson(json)).toList();
    _tips = <Tip>[];
    LocalizedTip toLocalizedTip(LocalizedContent content) {
      return content != null
          ? LocalizedTip(
              title: content?.title,
              content: content?.content,
            )
          : null;
    }

    for (final importModel in importModels) {
      final en = toLocalizedTip(importModel.localization.en);
      _tips.add(
        Tip(
          id: importModel.id,
          localizedTips: {
            'en': en,
            'de': toLocalizedTip(importModel.localization.de) ?? en,
            'pl': toLocalizedTip(importModel.localization.pl) ?? en,
          },
        ),
      );
    }
  }

  List<LocalizedTip> tips({@required String language}) {
    if (_tips != null) {
      return _tips.map((tip) => tip.localizedTip(language: language)).toList();
    }
    return null;
  }
}
