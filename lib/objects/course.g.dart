// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseAdapter extends TypeAdapter<_$TimetableImpl> {
  @override
  final int typeId = 5;

  @override
  _$TimetableImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TimetableImpl(
      id: fields[1] as int,
      name: fields[2] as String,
      short: fields[3] as String,
      teacherShort: fields[4] as String,
      color: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$TimetableImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.short)
      ..writeByte(4)
      ..write(obj.teacherShort)
      ..writeByte(5)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimetableImpl _$$TimetableImplFromJson(Map<String, dynamic> json) =>
    _$TimetableImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      short: json['short'] as String,
      teacherShort: json['teacherShort'] as String,
      color: json['color'] as int,
    );

Map<String, dynamic> _$$TimetableImplToJson(_$TimetableImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short': instance.short,
      'teacherShort': instance.teacherShort,
      'color': instance.color,
    };
