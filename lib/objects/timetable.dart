import 'package:freezed_annotation/freezed_annotation.dart';

part 'timetable.g.dart';
part 'timetable.freezed.dart';
@unfreezed
class Timetable with _$Timetable{
  const factory Timetable({
   required int id,
   required String title
  })=_Timetable;
  factory Timetable.fromJson(Map<String, dynamic> json) => _$TimetableFromJson;
}
class TimetableCell{
  int id;
  int timetableId;
  int weekday;
  int lesson;
  String subject;
  String teacher;
  String room;
}