// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmotionAdapter extends TypeAdapter<Emotion> {
  @override
  final int typeId = 5;

  @override
  Emotion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Emotion(
      game: fields[0] as Game,
      attitude: fields[1] as Attitude,
      result: fields[2] as Result,
      processEmotion: fields[3] as ProcessEmotion,
      sideNote: fields[4] as String?,
      satisfaction: fields[5] as Satisfaction,
      comingBack: fields[6] as bool,
      rating: fields[7] as int,
      note: fields[8] as String?,
      name: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Emotion obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.game)
      ..writeByte(1)
      ..write(obj.attitude)
      ..writeByte(2)
      ..write(obj.result)
      ..writeByte(3)
      ..write(obj.processEmotion)
      ..writeByte(4)
      ..write(obj.sideNote)
      ..writeByte(5)
      ..write(obj.satisfaction)
      ..writeByte(6)
      ..write(obj.comingBack)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.note)
      ..writeByte(9)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmotionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
