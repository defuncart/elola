// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_daily_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerDailyDataAdapter extends TypeAdapter<PlayerDailyData> {
  @override
  final typeId = 3;

  @override
  PlayerDailyData read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerDailyData(
      id: fields[0] as String,
    )
      ..nounsLearned = fields[1] as int
      ..nounsPracticed = fields[2] as int
      ..timeSpent = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, PlayerDailyData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nounsLearned)
      ..writeByte(2)
      ..write(obj.nounsPracticed)
      ..writeByte(3)
      ..write(obj.timeSpent);
  }
}
