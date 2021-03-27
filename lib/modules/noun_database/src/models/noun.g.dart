// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noun.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NounAdapter extends TypeAdapter<Noun> {
  @override
  final typeId = 0;

  @override
  Noun read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Noun(
      id: fields[0] as String,
      emoji: fields[1] as String,
      category: fields[2] as Category,
      inFull: fields[3] as String,
      withoutArticle: fields[4] as String,
      gender: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Noun obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.emoji)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.inFull)
      ..writeByte(4)
      ..write(obj.withoutArticle)
      ..writeByte(5)
      ..write(obj.gender);
  }
}
