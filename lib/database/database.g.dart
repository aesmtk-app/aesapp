// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WikiEntryTable extends WikiEntry
    with TableInfo<$WikiEntryTable, WikiEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WikiEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<String> authorId = GeneratedColumn<String>(
      'author_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, authorId, created, lastUpdated];
  @override
  String get aliasedName => _alias ?? 'wiki_entry';
  @override
  String get actualTableName => 'wiki_entry';
  @override
  VerificationContext validateIntegrity(Insertable<WikiEntryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  WikiEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WikiEntryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author_id'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $WikiEntryTable createAlias(String alias) {
    return $WikiEntryTable(attachedDatabase, alias);
  }
}

class WikiEntryData extends DataClass implements Insertable<WikiEntryData> {
  final String id;
  final String title;
  final String authorId;
  final DateTime created;
  final DateTime lastUpdated;
  const WikiEntryData(
      {required this.id,
      required this.title,
      required this.authorId,
      required this.created,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['author_id'] = Variable<String>(authorId);
    map['created'] = Variable<DateTime>(created);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  WikiEntryCompanion toCompanion(bool nullToAbsent) {
    return WikiEntryCompanion(
      id: Value(id),
      title: Value(title),
      authorId: Value(authorId),
      created: Value(created),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory WikiEntryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WikiEntryData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      authorId: serializer.fromJson<String>(json['authorId']),
      created: serializer.fromJson<DateTime>(json['created']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'authorId': serializer.toJson<String>(authorId),
      'created': serializer.toJson<DateTime>(created),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  WikiEntryData copyWith(
          {String? id,
          String? title,
          String? authorId,
          DateTime? created,
          DateTime? lastUpdated}) =>
      WikiEntryData(
        id: id ?? this.id,
        title: title ?? this.title,
        authorId: authorId ?? this.authorId,
        created: created ?? this.created,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  @override
  String toString() {
    return (StringBuffer('WikiEntryData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('authorId: $authorId, ')
          ..write('created: $created, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, authorId, created, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WikiEntryData &&
          other.id == this.id &&
          other.title == this.title &&
          other.authorId == this.authorId &&
          other.created == this.created &&
          other.lastUpdated == this.lastUpdated);
}

class WikiEntryCompanion extends UpdateCompanion<WikiEntryData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> authorId;
  final Value<DateTime> created;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const WikiEntryCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.authorId = const Value.absent(),
    this.created = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WikiEntryCompanion.insert({
    required String id,
    required String title,
    required String authorId,
    required DateTime created,
    required DateTime lastUpdated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        authorId = Value(authorId),
        created = Value(created),
        lastUpdated = Value(lastUpdated);
  static Insertable<WikiEntryData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? authorId,
    Expression<DateTime>? created,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (authorId != null) 'author_id': authorId,
      if (created != null) 'created': created,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WikiEntryCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? authorId,
      Value<DateTime>? created,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return WikiEntryCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      authorId: authorId ?? this.authorId,
      created: created ?? this.created,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<String>(authorId.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WikiEntryCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('authorId: $authorId, ')
          ..write('created: $created, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VPlanEntriesTable extends VPlanEntries
    with TableInfo<$VPlanEntriesTable, VPlanEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VPlanEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isInfoMeta = const VerificationMeta('isInfo');
  @override
  late final GeneratedColumn<bool> isInfo = GeneratedColumn<bool>(
      'is_info', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_info" IN (0, 1))'));
  static const VerificationMeta _courseMeta = const VerificationMeta('course');
  @override
  late final GeneratedColumn<String> course = GeneratedColumn<String>(
      'course', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectNewMeta =
      const VerificationMeta('subjectNew');
  @override
  late final GeneratedColumn<String> subjectNew = GeneratedColumn<String>(
      'subject_new', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subjectOldMeta =
      const VerificationMeta('subjectOld');
  @override
  late final GeneratedColumn<String> subjectOld = GeneratedColumn<String>(
      'subject_old', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lessonStartMeta =
      const VerificationMeta('lessonStart');
  @override
  late final GeneratedColumn<int> lessonStart = GeneratedColumn<int>(
      'lesson_start', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lessonEndMeta =
      const VerificationMeta('lessonEnd');
  @override
  late final GeneratedColumn<int> lessonEnd = GeneratedColumn<int>(
      'lesson_end', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _teacherNewMeta =
      const VerificationMeta('teacherNew');
  @override
  late final GeneratedColumn<String> teacherNew = GeneratedColumn<String>(
      'teacher_new', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _teacherOldMeta =
      const VerificationMeta('teacherOld');
  @override
  late final GeneratedColumn<String> teacherOld = GeneratedColumn<String>(
      'teacher_old', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomNewMeta =
      const VerificationMeta('roomNew');
  @override
  late final GeneratedColumn<String> roomNew = GeneratedColumn<String>(
      'room_new', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roomOldMeta =
      const VerificationMeta('roomOld');
  @override
  late final GeneratedColumn<String> roomOld = GeneratedColumn<String>(
      'room_old', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _infoTextMeta =
      const VerificationMeta('infoText');
  @override
  late final GeneratedColumn<String> infoText = GeneratedColumn<String>(
      'info_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isSelfWorkMeta =
      const VerificationMeta('isSelfWork');
  @override
  late final GeneratedColumn<bool> isSelfWork = GeneratedColumn<bool>(
      'is_self_work', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_self_work" IN (0, 1))'));
  static const VerificationMeta _isDroppedMeta =
      const VerificationMeta('isDropped');
  @override
  late final GeneratedColumn<bool> isDropped = GeneratedColumn<bool>(
      'is_dropped', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_dropped" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        createdAt,
        date,
        isInfo,
        course,
        subjectNew,
        subjectOld,
        lessonStart,
        lessonEnd,
        teacherNew,
        teacherOld,
        roomNew,
        roomOld,
        infoText,
        isSelfWork,
        isDropped
      ];
  @override
  String get aliasedName => _alias ?? 'v_plan_entries';
  @override
  String get actualTableName => 'v_plan_entries';
  @override
  VerificationContext validateIntegrity(Insertable<VPlanEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('is_info')) {
      context.handle(_isInfoMeta,
          isInfo.isAcceptableOrUnknown(data['is_info']!, _isInfoMeta));
    } else if (isInserting) {
      context.missing(_isInfoMeta);
    }
    if (data.containsKey('course')) {
      context.handle(_courseMeta,
          course.isAcceptableOrUnknown(data['course']!, _courseMeta));
    } else if (isInserting) {
      context.missing(_courseMeta);
    }
    if (data.containsKey('subject_new')) {
      context.handle(
          _subjectNewMeta,
          subjectNew.isAcceptableOrUnknown(
              data['subject_new']!, _subjectNewMeta));
    } else if (isInserting) {
      context.missing(_subjectNewMeta);
    }
    if (data.containsKey('subject_old')) {
      context.handle(
          _subjectOldMeta,
          subjectOld.isAcceptableOrUnknown(
              data['subject_old']!, _subjectOldMeta));
    } else if (isInserting) {
      context.missing(_subjectOldMeta);
    }
    if (data.containsKey('lesson_start')) {
      context.handle(
          _lessonStartMeta,
          lessonStart.isAcceptableOrUnknown(
              data['lesson_start']!, _lessonStartMeta));
    } else if (isInserting) {
      context.missing(_lessonStartMeta);
    }
    if (data.containsKey('lesson_end')) {
      context.handle(_lessonEndMeta,
          lessonEnd.isAcceptableOrUnknown(data['lesson_end']!, _lessonEndMeta));
    } else if (isInserting) {
      context.missing(_lessonEndMeta);
    }
    if (data.containsKey('teacher_new')) {
      context.handle(
          _teacherNewMeta,
          teacherNew.isAcceptableOrUnknown(
              data['teacher_new']!, _teacherNewMeta));
    } else if (isInserting) {
      context.missing(_teacherNewMeta);
    }
    if (data.containsKey('teacher_old')) {
      context.handle(
          _teacherOldMeta,
          teacherOld.isAcceptableOrUnknown(
              data['teacher_old']!, _teacherOldMeta));
    } else if (isInserting) {
      context.missing(_teacherOldMeta);
    }
    if (data.containsKey('room_new')) {
      context.handle(_roomNewMeta,
          roomNew.isAcceptableOrUnknown(data['room_new']!, _roomNewMeta));
    } else if (isInserting) {
      context.missing(_roomNewMeta);
    }
    if (data.containsKey('room_old')) {
      context.handle(_roomOldMeta,
          roomOld.isAcceptableOrUnknown(data['room_old']!, _roomOldMeta));
    } else if (isInserting) {
      context.missing(_roomOldMeta);
    }
    if (data.containsKey('info_text')) {
      context.handle(_infoTextMeta,
          infoText.isAcceptableOrUnknown(data['info_text']!, _infoTextMeta));
    } else if (isInserting) {
      context.missing(_infoTextMeta);
    }
    if (data.containsKey('is_self_work')) {
      context.handle(
          _isSelfWorkMeta,
          isSelfWork.isAcceptableOrUnknown(
              data['is_self_work']!, _isSelfWorkMeta));
    } else if (isInserting) {
      context.missing(_isSelfWorkMeta);
    }
    if (data.containsKey('is_dropped')) {
      context.handle(_isDroppedMeta,
          isDropped.isAcceptableOrUnknown(data['is_dropped']!, _isDroppedMeta));
    } else if (isInserting) {
      context.missing(_isDroppedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {date, isInfo, course, subjectNew, subjectOld, lessonEnd, lessonStart};
  @override
  VPlanEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VPlanEntry(
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      isInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_info'])!,
      course: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}course'])!,
      subjectNew: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_new'])!,
      subjectOld: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject_old'])!,
      lessonStart: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lesson_start'])!,
      lessonEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lesson_end'])!,
      teacherNew: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}teacher_new'])!,
      teacherOld: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}teacher_old'])!,
      roomNew: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_new'])!,
      roomOld: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}room_old'])!,
      infoText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}info_text'])!,
      isSelfWork: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_self_work'])!,
      isDropped: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_dropped'])!,
    );
  }

  @override
  $VPlanEntriesTable createAlias(String alias) {
    return $VPlanEntriesTable(attachedDatabase, alias);
  }
}

class VPlanEntry extends DataClass implements Insertable<VPlanEntry> {
  final DateTime createdAt;
  final DateTime date;
  final bool isInfo;
  final String course;
  final String subjectNew;
  final String subjectOld;
  final int lessonStart;
  final int lessonEnd;
  final String teacherNew;
  final String teacherOld;
  final String roomNew;
  final String roomOld;
  final String infoText;
  final bool isSelfWork;
  final bool isDropped;
  const VPlanEntry(
      {required this.createdAt,
      required this.date,
      required this.isInfo,
      required this.course,
      required this.subjectNew,
      required this.subjectOld,
      required this.lessonStart,
      required this.lessonEnd,
      required this.teacherNew,
      required this.teacherOld,
      required this.roomNew,
      required this.roomOld,
      required this.infoText,
      required this.isSelfWork,
      required this.isDropped});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    map['date'] = Variable<DateTime>(date);
    map['is_info'] = Variable<bool>(isInfo);
    map['course'] = Variable<String>(course);
    map['subject_new'] = Variable<String>(subjectNew);
    map['subject_old'] = Variable<String>(subjectOld);
    map['lesson_start'] = Variable<int>(lessonStart);
    map['lesson_end'] = Variable<int>(lessonEnd);
    map['teacher_new'] = Variable<String>(teacherNew);
    map['teacher_old'] = Variable<String>(teacherOld);
    map['room_new'] = Variable<String>(roomNew);
    map['room_old'] = Variable<String>(roomOld);
    map['info_text'] = Variable<String>(infoText);
    map['is_self_work'] = Variable<bool>(isSelfWork);
    map['is_dropped'] = Variable<bool>(isDropped);
    return map;
  }

  VPlanEntriesCompanion toCompanion(bool nullToAbsent) {
    return VPlanEntriesCompanion(
      createdAt: Value(createdAt),
      date: Value(date),
      isInfo: Value(isInfo),
      course: Value(course),
      subjectNew: Value(subjectNew),
      subjectOld: Value(subjectOld),
      lessonStart: Value(lessonStart),
      lessonEnd: Value(lessonEnd),
      teacherNew: Value(teacherNew),
      teacherOld: Value(teacherOld),
      roomNew: Value(roomNew),
      roomOld: Value(roomOld),
      infoText: Value(infoText),
      isSelfWork: Value(isSelfWork),
      isDropped: Value(isDropped),
    );
  }

  factory VPlanEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VPlanEntry(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      date: serializer.fromJson<DateTime>(json['date']),
      isInfo: serializer.fromJson<bool>(json['isInfo']),
      course: serializer.fromJson<String>(json['course']),
      subjectNew: serializer.fromJson<String>(json['subjectNew']),
      subjectOld: serializer.fromJson<String>(json['subjectOld']),
      lessonStart: serializer.fromJson<int>(json['lessonStart']),
      lessonEnd: serializer.fromJson<int>(json['lessonEnd']),
      teacherNew: serializer.fromJson<String>(json['teacherNew']),
      teacherOld: serializer.fromJson<String>(json['teacherOld']),
      roomNew: serializer.fromJson<String>(json['roomNew']),
      roomOld: serializer.fromJson<String>(json['roomOld']),
      infoText: serializer.fromJson<String>(json['infoText']),
      isSelfWork: serializer.fromJson<bool>(json['isSelfWork']),
      isDropped: serializer.fromJson<bool>(json['isDropped']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'date': serializer.toJson<DateTime>(date),
      'isInfo': serializer.toJson<bool>(isInfo),
      'course': serializer.toJson<String>(course),
      'subjectNew': serializer.toJson<String>(subjectNew),
      'subjectOld': serializer.toJson<String>(subjectOld),
      'lessonStart': serializer.toJson<int>(lessonStart),
      'lessonEnd': serializer.toJson<int>(lessonEnd),
      'teacherNew': serializer.toJson<String>(teacherNew),
      'teacherOld': serializer.toJson<String>(teacherOld),
      'roomNew': serializer.toJson<String>(roomNew),
      'roomOld': serializer.toJson<String>(roomOld),
      'infoText': serializer.toJson<String>(infoText),
      'isSelfWork': serializer.toJson<bool>(isSelfWork),
      'isDropped': serializer.toJson<bool>(isDropped),
    };
  }

  VPlanEntry copyWith(
          {DateTime? createdAt,
          DateTime? date,
          bool? isInfo,
          String? course,
          String? subjectNew,
          String? subjectOld,
          int? lessonStart,
          int? lessonEnd,
          String? teacherNew,
          String? teacherOld,
          String? roomNew,
          String? roomOld,
          String? infoText,
          bool? isSelfWork,
          bool? isDropped}) =>
      VPlanEntry(
        createdAt: createdAt ?? this.createdAt,
        date: date ?? this.date,
        isInfo: isInfo ?? this.isInfo,
        course: course ?? this.course,
        subjectNew: subjectNew ?? this.subjectNew,
        subjectOld: subjectOld ?? this.subjectOld,
        lessonStart: lessonStart ?? this.lessonStart,
        lessonEnd: lessonEnd ?? this.lessonEnd,
        teacherNew: teacherNew ?? this.teacherNew,
        teacherOld: teacherOld ?? this.teacherOld,
        roomNew: roomNew ?? this.roomNew,
        roomOld: roomOld ?? this.roomOld,
        infoText: infoText ?? this.infoText,
        isSelfWork: isSelfWork ?? this.isSelfWork,
        isDropped: isDropped ?? this.isDropped,
      );
  @override
  String toString() {
    return (StringBuffer('VPlanEntry(')
          ..write('createdAt: $createdAt, ')
          ..write('date: $date, ')
          ..write('isInfo: $isInfo, ')
          ..write('course: $course, ')
          ..write('subjectNew: $subjectNew, ')
          ..write('subjectOld: $subjectOld, ')
          ..write('lessonStart: $lessonStart, ')
          ..write('lessonEnd: $lessonEnd, ')
          ..write('teacherNew: $teacherNew, ')
          ..write('teacherOld: $teacherOld, ')
          ..write('roomNew: $roomNew, ')
          ..write('roomOld: $roomOld, ')
          ..write('infoText: $infoText, ')
          ..write('isSelfWork: $isSelfWork, ')
          ..write('isDropped: $isDropped')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      createdAt,
      date,
      isInfo,
      course,
      subjectNew,
      subjectOld,
      lessonStart,
      lessonEnd,
      teacherNew,
      teacherOld,
      roomNew,
      roomOld,
      infoText,
      isSelfWork,
      isDropped);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VPlanEntry &&
          other.createdAt == this.createdAt &&
          other.date == this.date &&
          other.isInfo == this.isInfo &&
          other.course == this.course &&
          other.subjectNew == this.subjectNew &&
          other.subjectOld == this.subjectOld &&
          other.lessonStart == this.lessonStart &&
          other.lessonEnd == this.lessonEnd &&
          other.teacherNew == this.teacherNew &&
          other.teacherOld == this.teacherOld &&
          other.roomNew == this.roomNew &&
          other.roomOld == this.roomOld &&
          other.infoText == this.infoText &&
          other.isSelfWork == this.isSelfWork &&
          other.isDropped == this.isDropped);
}

class VPlanEntriesCompanion extends UpdateCompanion<VPlanEntry> {
  final Value<DateTime> createdAt;
  final Value<DateTime> date;
  final Value<bool> isInfo;
  final Value<String> course;
  final Value<String> subjectNew;
  final Value<String> subjectOld;
  final Value<int> lessonStart;
  final Value<int> lessonEnd;
  final Value<String> teacherNew;
  final Value<String> teacherOld;
  final Value<String> roomNew;
  final Value<String> roomOld;
  final Value<String> infoText;
  final Value<bool> isSelfWork;
  final Value<bool> isDropped;
  final Value<int> rowid;
  const VPlanEntriesCompanion({
    this.createdAt = const Value.absent(),
    this.date = const Value.absent(),
    this.isInfo = const Value.absent(),
    this.course = const Value.absent(),
    this.subjectNew = const Value.absent(),
    this.subjectOld = const Value.absent(),
    this.lessonStart = const Value.absent(),
    this.lessonEnd = const Value.absent(),
    this.teacherNew = const Value.absent(),
    this.teacherOld = const Value.absent(),
    this.roomNew = const Value.absent(),
    this.roomOld = const Value.absent(),
    this.infoText = const Value.absent(),
    this.isSelfWork = const Value.absent(),
    this.isDropped = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VPlanEntriesCompanion.insert({
    required DateTime createdAt,
    required DateTime date,
    required bool isInfo,
    required String course,
    required String subjectNew,
    required String subjectOld,
    required int lessonStart,
    required int lessonEnd,
    required String teacherNew,
    required String teacherOld,
    required String roomNew,
    required String roomOld,
    required String infoText,
    required bool isSelfWork,
    required bool isDropped,
    this.rowid = const Value.absent(),
  })  : createdAt = Value(createdAt),
        date = Value(date),
        isInfo = Value(isInfo),
        course = Value(course),
        subjectNew = Value(subjectNew),
        subjectOld = Value(subjectOld),
        lessonStart = Value(lessonStart),
        lessonEnd = Value(lessonEnd),
        teacherNew = Value(teacherNew),
        teacherOld = Value(teacherOld),
        roomNew = Value(roomNew),
        roomOld = Value(roomOld),
        infoText = Value(infoText),
        isSelfWork = Value(isSelfWork),
        isDropped = Value(isDropped);
  static Insertable<VPlanEntry> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? date,
    Expression<bool>? isInfo,
    Expression<String>? course,
    Expression<String>? subjectNew,
    Expression<String>? subjectOld,
    Expression<int>? lessonStart,
    Expression<int>? lessonEnd,
    Expression<String>? teacherNew,
    Expression<String>? teacherOld,
    Expression<String>? roomNew,
    Expression<String>? roomOld,
    Expression<String>? infoText,
    Expression<bool>? isSelfWork,
    Expression<bool>? isDropped,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (date != null) 'date': date,
      if (isInfo != null) 'is_info': isInfo,
      if (course != null) 'course': course,
      if (subjectNew != null) 'subject_new': subjectNew,
      if (subjectOld != null) 'subject_old': subjectOld,
      if (lessonStart != null) 'lesson_start': lessonStart,
      if (lessonEnd != null) 'lesson_end': lessonEnd,
      if (teacherNew != null) 'teacher_new': teacherNew,
      if (teacherOld != null) 'teacher_old': teacherOld,
      if (roomNew != null) 'room_new': roomNew,
      if (roomOld != null) 'room_old': roomOld,
      if (infoText != null) 'info_text': infoText,
      if (isSelfWork != null) 'is_self_work': isSelfWork,
      if (isDropped != null) 'is_dropped': isDropped,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VPlanEntriesCompanion copyWith(
      {Value<DateTime>? createdAt,
      Value<DateTime>? date,
      Value<bool>? isInfo,
      Value<String>? course,
      Value<String>? subjectNew,
      Value<String>? subjectOld,
      Value<int>? lessonStart,
      Value<int>? lessonEnd,
      Value<String>? teacherNew,
      Value<String>? teacherOld,
      Value<String>? roomNew,
      Value<String>? roomOld,
      Value<String>? infoText,
      Value<bool>? isSelfWork,
      Value<bool>? isDropped,
      Value<int>? rowid}) {
    return VPlanEntriesCompanion(
      createdAt: createdAt ?? this.createdAt,
      date: date ?? this.date,
      isInfo: isInfo ?? this.isInfo,
      course: course ?? this.course,
      subjectNew: subjectNew ?? this.subjectNew,
      subjectOld: subjectOld ?? this.subjectOld,
      lessonStart: lessonStart ?? this.lessonStart,
      lessonEnd: lessonEnd ?? this.lessonEnd,
      teacherNew: teacherNew ?? this.teacherNew,
      teacherOld: teacherOld ?? this.teacherOld,
      roomNew: roomNew ?? this.roomNew,
      roomOld: roomOld ?? this.roomOld,
      infoText: infoText ?? this.infoText,
      isSelfWork: isSelfWork ?? this.isSelfWork,
      isDropped: isDropped ?? this.isDropped,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (isInfo.present) {
      map['is_info'] = Variable<bool>(isInfo.value);
    }
    if (course.present) {
      map['course'] = Variable<String>(course.value);
    }
    if (subjectNew.present) {
      map['subject_new'] = Variable<String>(subjectNew.value);
    }
    if (subjectOld.present) {
      map['subject_old'] = Variable<String>(subjectOld.value);
    }
    if (lessonStart.present) {
      map['lesson_start'] = Variable<int>(lessonStart.value);
    }
    if (lessonEnd.present) {
      map['lesson_end'] = Variable<int>(lessonEnd.value);
    }
    if (teacherNew.present) {
      map['teacher_new'] = Variable<String>(teacherNew.value);
    }
    if (teacherOld.present) {
      map['teacher_old'] = Variable<String>(teacherOld.value);
    }
    if (roomNew.present) {
      map['room_new'] = Variable<String>(roomNew.value);
    }
    if (roomOld.present) {
      map['room_old'] = Variable<String>(roomOld.value);
    }
    if (infoText.present) {
      map['info_text'] = Variable<String>(infoText.value);
    }
    if (isSelfWork.present) {
      map['is_self_work'] = Variable<bool>(isSelfWork.value);
    }
    if (isDropped.present) {
      map['is_dropped'] = Variable<bool>(isDropped.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VPlanEntriesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('date: $date, ')
          ..write('isInfo: $isInfo, ')
          ..write('course: $course, ')
          ..write('subjectNew: $subjectNew, ')
          ..write('subjectOld: $subjectOld, ')
          ..write('lessonStart: $lessonStart, ')
          ..write('lessonEnd: $lessonEnd, ')
          ..write('teacherNew: $teacherNew, ')
          ..write('teacherOld: $teacherOld, ')
          ..write('roomNew: $roomNew, ')
          ..write('roomOld: $roomOld, ')
          ..write('infoText: $infoText, ')
          ..write('isSelfWork: $isSelfWork, ')
          ..write('isDropped: $isDropped, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $WikiEntryTable wikiEntry = $WikiEntryTable(this);
  late final $VPlanEntriesTable vPlanEntries = $VPlanEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [wikiEntry, vPlanEntries];
}
