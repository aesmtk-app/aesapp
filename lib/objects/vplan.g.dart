// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vplan.dart';

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
