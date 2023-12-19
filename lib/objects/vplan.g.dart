// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vplan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VPlanEntryAdapter extends TypeAdapter<_$VPlanEntryImpl> {
  @override
  final int typeId = 1;

  @override
  _$VPlanEntryImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$VPlanEntryImpl(
      id: fields[1] as int,
      creationTime: fields[2] as DateTime,
      isInfo: fields[3] as bool,
      date: fields[4] as DateTime,
      course: fields[5] as String?,
      comment: fields[6] as String?,
      isCancelled: fields[7] as bool?,
      lessonStart: fields[8] as int?,
      lessonEnd: fields[9] as int?,
      replacement: fields[10] as String?,
      room: fields[11] as String?,
      subject: fields[12] as String?,
      subjectOld: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$VPlanEntryImpl obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.creationTime)
      ..writeByte(3)
      ..write(obj.isInfo)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.course)
      ..writeByte(6)
      ..write(obj.comment)
      ..writeByte(7)
      ..write(obj.isCancelled)
      ..writeByte(8)
      ..write(obj.lessonStart)
      ..writeByte(9)
      ..write(obj.lessonEnd)
      ..writeByte(10)
      ..write(obj.replacement)
      ..writeByte(11)
      ..write(obj.room)
      ..writeByte(12)
      ..write(obj.subject)
      ..writeByte(13)
      ..write(obj.subjectOld);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VPlanEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VPlanEntryImpl _$$VPlanEntryImplFromJson(Map<String, dynamic> json) =>
    _$VPlanEntryImpl(
      id: json['id'] as int,
      creationTime: DateTime.parse(json['creation_time'] as String),
      isInfo: json['is_info'] as bool,
      date: DateTime.parse(json['date'] as String),
      course: json['class'] as String?,
      comment: json['comment'] as String?,
      isCancelled: json['is_cancelled'] as bool?,
      lessonStart: json['lesson_start'] as int?,
      lessonEnd: json['lesson_end'] as int?,
      replacement: json['replacement'] as String?,
      room: json['room'] as String?,
      subject: json['subject'] as String?,
      subjectOld: json['subject_old'] as String?,
    );

Map<String, dynamic> _$$VPlanEntryImplToJson(_$VPlanEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creation_time': instance.creationTime.toIso8601String(),
      'is_info': instance.isInfo,
      'date': instance.date.toIso8601String(),
      'class': instance.course,
      'comment': instance.comment,
      'is_cancelled': instance.isCancelled,
      'lesson_start': instance.lessonStart,
      'lesson_end': instance.lessonEnd,
      'replacement': instance.replacement,
      'room': instance.room,
      'subject': instance.subject,
      'subject_old': instance.subjectOld,
    };
