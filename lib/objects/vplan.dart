import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'vplan.g.dart';

@JsonSerializable()
class VPlanEntry{
  VPlanEntry({required this.id, required this.creationTime, required this.isInfo, required this.date, this.course, this.comment, this.isCancelled, this.lessonStart, this.lessonEnd, this.replacement, this.room, this.subject, this.subjectOld,});

  factory VPlanEntry.fromJson(Map<String, dynamic> json) => _$VPlanEntryFromJson(json);

  int id;
  @JsonKey(name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
  DateTime creationTime;
  @JsonKey(name: "is_info")
  bool isInfo;
  DateTime date;
  @JsonKey(name: "class")
  String? course;
  String? comment;
  @JsonKey(name: "is_cancelled")
  bool? isCancelled;
  @JsonKey(name: "lesson_start")
  int? lessonStart;
  @JsonKey(name: "lesson_end")
  int? lessonEnd;
  String? replacement;
  String? room;
  String? subject;
  @JsonKey(name: "subject_old")
  String? subjectOld;

  bool get isSelfWork => "+"==replacement?.trim();

  static DateTime _timeFromJson(String s) =>DateTime.parse(s);
  static String _timeToJson(DateTime dt)=>dt.toIso8601String();

  Map<String, dynamic> toJson()=> _$VPlanEntryToJson(this);
}