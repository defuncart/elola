import 'package:hive/hive.dart';

import '../configs/hive_adapter_type.dart';

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
