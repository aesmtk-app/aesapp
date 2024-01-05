// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimetableAdapter extends TypeAdapter<_$TimetableImpl> {
  @override
  final int typeId = 2;

  @override
  _$TimetableImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TimetableImpl(
      id: fields[1] as int,
      title: fields[2] as String,
      days: fields[3] as int,
      maxLessons: fields[4] as int,
      lessonTimes: (fields[5] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as int, (v as List).cast<DateTime>())),
      entries: (fields[6] as HiveList?)?.castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, _$TimetableImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.days)
      ..writeByte(4)
      ..write(obj.maxLessons)
      ..writeByte(5)
      ..write(obj.lessonTimes)
      ..writeByte(6)
      ..write(obj.entries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimetableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimetableEntryAdapter extends TypeAdapter<_$TimetableEntryImpl> {
  @override
  final int typeId = 3;

  @override
  _$TimetableEntryImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TimetableEntryImpl(
      id: fields[0] as int,
      timetableId: fields[1] as int,
      weekday: fields[2] as int,
      lesson: fields[3] as int,
      subject: fields[4] as String,
      teacher: fields[5] as String,
      room: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$TimetableEntryImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.timetableId)
      ..writeByte(2)
      ..write(obj.weekday)
      ..writeByte(3)
      ..write(obj.lesson)
      ..writeByte(4)
      ..write(obj.subject)
      ..writeByte(5)
      ..write(obj.teacher)
      ..writeByte(6)
      ..write(obj.room);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimetableEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimetableImpl _$$TimetableImplFromJson(Map<String, dynamic> json) =>
    _$TimetableImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      days: json['days'] as int,
      maxLessons: json['maxLessons'] as int,
      lessonTimes: (json['lessonTimes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k),
            (e as List<dynamic>)
                .map((e) => DateTime.parse(e as String))
                .toList()),
      ),
    );

Map<String, dynamic> _$$TimetableImplToJson(_$TimetableImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'days': instance.days,
      'maxLessons': instance.maxLessons,
      'lessonTimes': instance.lessonTimes.map((k, e) =>
          MapEntry(k.toString(), e.map((e) => e.toIso8601String()).toList())),
    };

_$TimetableEntryImpl _$$TimetableEntryImplFromJson(Map<String, dynamic> json) =>
    _$TimetableEntryImpl(
      id: json['id'] as int,
      timetableId: json['timetableId'] as int,
      weekday: json['weekday'] as int,
      lesson: json['lesson'] as int,
      subject: json['subject'] as String,
      teacher: json['teacher'] as String,
      room: json['room'] as String,
    );

Map<String, dynamic> _$$TimetableEntryImplToJson(
        _$TimetableEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timetableId': instance.timetableId,
      'weekday': instance.weekday,
      'lesson': instance.lesson,
      'subject': instance.subject,
      'teacher': instance.teacher,
      'room': instance.room,
    };
