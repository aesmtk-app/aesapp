import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vplan.g.dart';
part 'vplan.freezed.dart';

@unfreezed
class VPlanEntry with _$VPlanEntry{
  factory VPlanEntry.fromJson(Map<String, dynamic> json) => _$VPlanEntryFromJson(json);

  factory VPlanEntry({
  required int id,
  @JsonKey(name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
  required DateTime creationTime,
  @JsonKey(name: "is_info")
  required bool isInfo,
  required DateTime date,
  @JsonKey(name: "class")
  String? course,
  String? comment,
  @JsonKey(name: "is_cancelled")
  bool? isCancelled,
  @JsonKey(name: "lesson_start")
  int? lessonStart,
  @JsonKey(name: "lesson_end")
  int? lessonEnd,
  String? replacement,
  String? room,
  String? subject,
  @JsonKey(name: "subject_old")
  String? subjectOld
  })=_VPlanEntry;


  bool isSelfWork ()=> "+"==replacement?.trim();

  static DateTime _timeFromJson(String s) =>DateTime.parse(s);
  static String _timeToJson(DateTime dt)=>dt.toIso8601String();
}