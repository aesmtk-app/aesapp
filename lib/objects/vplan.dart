import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'vplan.g.dart';
part 'vplan.freezed.dart';

@unfreezed
class VPlanEntry extends HiveObject with _$VPlanEntry{
  factory VPlanEntry.fromJson(Map<String, dynamic> json) => _$VPlanEntryFromJson(json);
  VPlanEntry._();
  @HiveType(typeId: 1, adapterName: "VPlanEntryAdapter")
  factory VPlanEntry({
    @HiveField(1)
    required int id,
    @JsonKey(name: "creation_time") @HiveField(2)
    required DateTime creationTime,
    @JsonKey(name: "is_info") @HiveField(3)
    required bool isInfo,
    @HiveField(4)
    required DateTime date,
    @JsonKey(name: "class") @HiveField(5)
    String? course,
    @HiveField(6)
    String? comment,
    @JsonKey(name: "is_cancelled") @HiveField(7)
    bool? isCancelled,
    @JsonKey(name: "lesson_start") @HiveField(8)
    int? lessonStart,
    @JsonKey(name: "lesson_end")@HiveField(9)
    int? lessonEnd,
    @HiveField(10)
    String? replacement,
    @HiveField(11)
    String? room,
    @HiveField(12)
    String? subject,
    @JsonKey(name: "subject_old")@HiveField(13)
    String? subjectOld
  })=_VPlanEntry;


  bool isSelfWork ()=> "+"==replacement?.trim();
}