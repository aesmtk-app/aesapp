import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'timetable.g.dart';
part 'timetable.freezed.dart';

@unfreezed
class Timetable extends HiveObject with _$Timetable{
  @HiveType(typeId: 2, adapterName: "TimetableAdapter")
  factory Timetable({
    @HiveField(1)
    required int id,
    @HiveField(2)
    required String title,
    @HiveField(3)
    required int days,
    @HiveField(4)
    required int maxLessons,
    @HiveField(5)
    required Map<int, List<DateTime>> lessonTimes,
    @HiveField(6) @JsonKey(includeFromJson: false, includeToJson: false)
    HiveList? entries
  })=_Timetable;
  factory Timetable.fromJson(Map<String, dynamic> json) => _$TimetableFromJson(json);
}

@unfreezed
class TimetableEntry extends HiveObject with _$TimetableEntry{
  @HiveType(typeId: 3, adapterName: "TimetableEntryAdapter")
  factory TimetableEntry({
    @HiveField(0)
    required int id,
    @HiveField(1)
    required int timetableId,
    @HiveField(2)
    required int weekday,
    @HiveField(3)
    required int lesson,
    @HiveField(4)
    required String subject,
    @HiveField(5)
    required String teacher,
    @HiveField(6)
    required String room
  })=_TimetableEntry;
  factory TimetableEntry.fromJson(Map<String, dynamic> json) => _$TimetableEntryFromJson(json);
}