import 'dart:core';

class VPlanEntry{
  VPlanEntry({required this.id, required this.creationTime, required this.isInfo, required this.date, this.course, this.comment, this.isCancelled, this.lessonStart, this.lessonEnd, this.replacement, this.room, this.subject, this.subjectOld, required this.isSelfWork});
  int id;
  DateTime creationTime;
  bool isInfo;
  bool isSelfWork;
  DateTime date;
  String? course;
  String? comment;
  bool? isCancelled;
  int? lessonStart;
  int? lessonEnd;
  String? replacement;
  String? room;
  String? subject;
  String? subjectOld;
  VPlanEntry.fromJSON(Map data)
  : id = data["id"],
    isInfo = data["is_info"],
    creationTime = DateTime.parse(data["creation_time"]),
    date = DateTime.parse(data["date"]),
    course = data["class"],
    comment = data["comment"],
    isCancelled = data["is_cancelled"],
    lessonStart = data["lesson_start"],
    lessonEnd = data["lesson_end"],
    replacement = data["replacement"],
    room = data["room"],
    subject = data["subject"],
    isSelfWork = data["replacement"]=="+",
    subjectOld = data["subject_old"];
}