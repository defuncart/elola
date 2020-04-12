import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:elola/configs/hive_adapter_type.dart';
import 'package:elola/enums/category.dart';

part 'noun.g.dart';

/// A model represeting a (Spanish) Noun
@HiveType(typeId: HiveAdapterType.noun)
class Noun {
  /// A unique id
  @HiveField(0)
  final String id;

  /// An emoji representing the noun
  @HiveField(1)
  final String emoji;

  /// A category which the noun belongs to
  @HiveField(2)
  final Category category;

  /// The noun in full, i.e. `el sustantivo`
  @HiveField(3)
  final String inFull;

  /// The noun without its article, i.e. `sustantivo`
  @HiveField(4)
  final String withoutArticle;

  /// The noun's gender (0 = masc, 1 = fem)
  @HiveField(5)
  final int gender;

  const Noun({
    @required this.id,
    @required this.emoji,
    @required this.category,
    @required this.inFull,
    @required this.withoutArticle,
    @required this.gender,
  });

  @override
  String toString() => '{$inFull: {category: $category, emoji: $emoji, id: $id, gender: $gender}}';
}
