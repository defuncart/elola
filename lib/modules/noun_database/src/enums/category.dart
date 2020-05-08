import 'package:flutter/foundation.dart' show describeEnum;
import 'package:hive/hive.dart';

import 'package:elola/configs/hive_adapter_type.dart';
import 'package:elola/localizations.dart';

part 'category.g.dart';

/// An enum representing the types of noun categories
@HiveType(typeId: HiveAdapterType.category)
enum Category {
  @HiveField(0)
  foodDrink,
  @HiveField(1)
  sport,
  @HiveField(2)
  people,
  @HiveField(3)
  nature,
}

extension CategoryExtenions on Category {
  String get localizedName {
    final key = 'category${describeEnum(this)}';
    return AppLocalizations.getText(key);
  }
}