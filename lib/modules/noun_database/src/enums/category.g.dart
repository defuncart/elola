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
        return Category.foodDrink;
      case 1:
        return Category.sport;
      case 2:
        return Category.people;
      case 3:
        return Category.nature;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    switch (obj) {
      case Category.foodDrink:
        writer.writeByte(0);
        break;
      case Category.sport:
        writer.writeByte(1);
        break;
      case Category.people:
        writer.writeByte(2);
        break;
      case Category.nature:
        writer.writeByte(3);
        break;
    }
  }
}
