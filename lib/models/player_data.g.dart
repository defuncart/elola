// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerDataAdapter extends TypeAdapter<PlayerData> {
  @override
  final typeId = 2;

  @override
  PlayerData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerData(
      id: fields[0] as String,
      attempts: fields[1] as int,
      timesCorrect: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.attempts)
      ..writeByte(2)
      ..write(obj.timesCorrect);
  }
}
