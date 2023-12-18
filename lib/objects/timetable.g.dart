// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimetableImpl _$$TimetableImplFromJson(Map<String, dynamic> json) =>
    _$TimetableImpl(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$TimetableImplToJson(_$TimetableImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_$TimetableCellImpl _$$TimetableCellImplFromJson(Map<String, dynamic> json) =>
    _$TimetableCellImpl(
      id: json['id'] as int,
      timetableId: json['timetableId'] as int,
      weekday: json['weekday'] as int,
      lesson: json['lesson'] as int,
      subject: json['subject'] as String,
      teacher: json['teacher'] as String,
      room: json['room'] as String,
    );

Map<String, dynamic> _$$TimetableCellImplToJson(_$TimetableCellImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timetableId': instance.timetableId,
      'weekday': instance.weekday,
      'lesson': instance.lesson,
      'subject': instance.subject,
      'teacher': instance.teacher,
      'room': instance.room,
    };
