// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'satisfaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SatisfactionAdapter extends TypeAdapter<Satisfaction> {
  @override
  final int typeId = 4;

  @override
  Satisfaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Satisfaction(
      emoji: fields[0] as String,
      desc: fields[1] as String,
      value: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Satisfaction obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.emoji)
      ..writeByte(1)
      ..write(obj.desc)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SatisfactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
