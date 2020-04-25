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

  /// Initializes the service
  @override
  Future<void> init() async {
    final data = await rootBundle.loadString(_jsonAssetPath);
    final importModels = (json.decode(data) as List).map((json) => ImportModel.fromJson(json)).toList();
    print(importModels);
    _tips = <Tip>[];
    LocalizedTip toLocalizedTip(LocalizedContent content) {
      return content != null
          ? LocalizedTip(
              title: content?.title,
              description: content?.description,
              content: content?.content,
            )
          : null;
    }

    for (final importModel in importModels) {
      final en = toLocalizedTip(importModel.content.en);
      _tips.add(
        Tip(
          id: importModel.id,
          localizedTips: {
            'en': en,
            'de': toLocalizedTip(importModel.content.de) ?? en,
            'pl': toLocalizedTip(importModel.content.pl) ?? en,
          },
        ),
      );
    }

    print(_tips);
  }

  /// Returns all tips for a given langauge
  List<LocalizedTip> tips({@required String language}) {
    if (_tips != null) {
      return _tips.map((tip) => tip.localizedTip(language: language)).toList();
    }
    return null;
  }
}
