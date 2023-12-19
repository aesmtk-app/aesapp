import 'package:freezed_annotation/freezed_annotation.dart';

part 'timetable.g.dart';
part 'timetable.freezed.dart';
@unfreezed
class Timetable with _$Timetable{
  factory Timetable({
   required int id,
   required String title
  })=_Timetable;
  factory Timetable.fromJson(Map<String, dynamic> json) => _$TimetableFromJson(json);
}

@unfreezed
class TimetableEntry with _$TimetableEntry{
  factory TimetableEntry({
    required int id,
    required int timetableId,
    required int weekday,
    required int lesson,
    required String subject,
    required String teacher,
    required String room
  })=_TimetableEntry;
  factory TimetableEntry.fromJson(Map<String, dynamic> json) => _$TimetableEntryFromJson(json);
}