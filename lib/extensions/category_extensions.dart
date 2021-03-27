import 'package:elola/localizations.dart';
import 'package:elola/modules/noun_database/noun_database.dart';
import 'package:flutter/foundation.dart' show describeEnum;

extension CategoryExtensions on Category {
  String get localizedName {
    final key = 'category${describeEnum(this)}';
    return AppLocalizations.getText(key);
  }
}
