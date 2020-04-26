// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_noun_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerNounDataAdapter extends TypeAdapter<PlayerNounData> {
  @override
  final typeId = 2;

  @override
  PlayerNounData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerNounData(
      id: fields[0] as String,
    )
      ..attempts = fields[1] as int
      ..timesCorrect = fields[2] as int
      ..isFavorite = fields[3] as bool
      ..lastSeen = fields[4] as DateTime;
  }

  @override
  void write(BinaryWriter writer, PlayerNounData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.attempts)
      ..writeByte(2)
      ..write(obj.timesCorrect)
      ..writeByte(3)
      ..write(obj.isFavorite)
      ..writeByte(4)
      ..write(obj.lastSeen);
  }
}
