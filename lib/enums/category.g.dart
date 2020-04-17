// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final typeId = 1;

  @override
  Category read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Category.foodFruit;
      case 1:
        return Category.foodVegetable;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.foodFruit:
        writer.writeByte(0);
        break;
      case Category.foodVegetable:
        writer.writeByte(1);
        break;
    }
  }
}
