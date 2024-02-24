import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'course.g.dart';
part 'course.freezed.dart';

@unfreezed
class Course extends HiveObject with _$Course{
  Course._();
  @HiveType(typeId: 5, adapterName: "CourseAdapter")
  factory Course({
    @HiveField(1) @JsonKey()
    required int id,
    @HiveField(2)
    required String name,
    @HiveField(3)
    required String short,
    @HiveField(4)
    required String teacherShort,
    @HiveField(5)
    required int color
  })=_Timetable;
  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}


