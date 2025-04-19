// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PendingTaskAdapter extends TypeAdapter<PendingTask> {
  @override
  final int typeId = 0;

  @override
  PendingTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PendingTask(
      processInstanceId: fields[0] as String,
      taskInstanceId: fields[1] as String,
      taskName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PendingTask obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.processInstanceId)
      ..writeByte(1)
      ..write(obj.taskInstanceId)
      ..writeByte(2)
      ..write(obj.taskName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PendingTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
