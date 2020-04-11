import 'package:elola/configs/hive_adapter_type.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

/// An enum representing the types of noun categories
@HiveType(typeId: HiveAdapterType.category)
enum Category {
  @HiveField(0)
  foodFruit,
}
