import 'package:aesapp/database/database.dart';
import 'package:drift/drift.dart';

@DataClassName("VPlanEntry")
class VPlanEntries extends Table{
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isInfo => boolean()();
  TextColumn get course => text()();
  TextColumn get subjectNew => text()();
  TextColumn get subjectOld => text()();
  IntColumn get lessonStart => integer()();
  IntColumn get lessonEnd => integer()();

  TextColumn get teacherNew => text()();
  TextColumn get teacherOld => text()();

  TextColumn get roomNew => text()();
  TextColumn get roomOld => text()();

  TextColumn get infoText => text()();

  BoolColumn get isSelfWork => boolean()();
  BoolColumn get isDropped => boolean()();

  @override
  Set<Column> get primaryKey => {date, isInfo, course, subjectNew, subjectOld, lessonEnd, lessonStart};

  static VPlanEntry fromSupabase(Map map){
    return VPlanEntry(
        createdAt: DateTime.parse(map["created_at"]),
        date: DateTime.parse(map["date"]),
        isInfo: map["is_info"],
        course: map["course"],
        subjectNew: map["subject_new"],
        subjectOld: map["subject_old"],
        lessonStart: map["lesson_start"],
        lessonEnd: map["lesson_end"],
        teacherNew: map["teacher_new"],
        teacherOld: map["teacher_old"],
        roomNew: map["room_new"],
        roomOld: map["room_old"],
        infoText: map["info_text"],
        isSelfWork: map["is_self_work"],
        isDropped: map["is_dropped"]
    );
  }
}

/*
created_at timestamp with time zone null default now(),
    date date not null,
    is_info boolean not null,
    course text not null,
    subject_new text not null,
    lesson_start bigint not null,
    lesson_end bigint not null,
    teacher_new text null,
    teacher_old text null,
    room_new text null,
    room_old text null,
    text text null,
    is_self_work boolean null,
    is_dropped boolean null,
 */
