// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timetable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return _Timetable.fromJson(json);
}

/// @nodoc
mixin _$Timetable {
  @HiveField(1)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  set id(int value) => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  set title(String value) => throw _privateConstructorUsedError;
  @HiveField(3)
  int get days => throw _privateConstructorUsedError;
  @HiveField(3)
  set days(int value) => throw _privateConstructorUsedError;
  @HiveField(4)
  int get maxLessons => throw _privateConstructorUsedError;
  @HiveField(4)
  set maxLessons(int value) => throw _privateConstructorUsedError;
  @HiveField(5)
  Map<int, List<DateTime>> get lessonTimes =>
      throw _privateConstructorUsedError;
  @HiveField(5)
  set lessonTimes(Map<int, List<DateTime>> value) =>
      throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(includeFromJson: false, includeToJson: false)
  HiveList<HiveObjectMixin>? get entries => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(includeFromJson: false, includeToJson: false)
  set entries(HiveList<HiveObjectMixin>? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableCopyWith<Timetable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableCopyWith<$Res> {
  factory $TimetableCopyWith(Timetable value, $Res Function(Timetable) then) =
      _$TimetableCopyWithImpl<$Res, Timetable>;
  @useResult
  $Res call(
      {@HiveField(1) int id,
      @HiveField(2) String title,
      @HiveField(3) int days,
      @HiveField(4) int maxLessons,
      @HiveField(5) Map<int, List<DateTime>> lessonTimes,
      @HiveField(6)
      @JsonKey(includeFromJson: false, includeToJson: false)
      HiveList<HiveObjectMixin>? entries});
}

/// @nodoc
class _$TimetableCopyWithImpl<$Res, $Val extends Timetable>
    implements $TimetableCopyWith<$Res> {
  _$TimetableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? days = null,
    Object? maxLessons = null,
    Object? lessonTimes = null,
    Object? entries = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      maxLessons: null == maxLessons
          ? _value.maxLessons
          : maxLessons // ignore: cast_nullable_to_non_nullable
              as int,
      lessonTimes: null == lessonTimes
          ? _value.lessonTimes
          : lessonTimes // ignore: cast_nullable_to_non_nullable
              as Map<int, List<DateTime>>,
      entries: freezed == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as HiveList<HiveObjectMixin>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimetableImplCopyWith<$Res>
    implements $TimetableCopyWith<$Res> {
  factory _$$TimetableImplCopyWith(
          _$TimetableImpl value, $Res Function(_$TimetableImpl) then) =
      __$$TimetableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) int id,
      @HiveField(2) String title,
      @HiveField(3) int days,
      @HiveField(4) int maxLessons,
      @HiveField(5) Map<int, List<DateTime>> lessonTimes,
      @HiveField(6)
      @JsonKey(includeFromJson: false, includeToJson: false)
      HiveList<HiveObjectMixin>? entries});
}

/// @nodoc
class __$$TimetableImplCopyWithImpl<$Res>
    extends _$TimetableCopyWithImpl<$Res, _$TimetableImpl>
    implements _$$TimetableImplCopyWith<$Res> {
  __$$TimetableImplCopyWithImpl(
      _$TimetableImpl _value, $Res Function(_$TimetableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? days = null,
    Object? maxLessons = null,
    Object? lessonTimes = null,
    Object? entries = freezed,
  }) {
    return _then(_$TimetableImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      maxLessons: null == maxLessons
          ? _value.maxLessons
          : maxLessons // ignore: cast_nullable_to_non_nullable
              as int,
      lessonTimes: null == lessonTimes
          ? _value.lessonTimes
          : lessonTimes // ignore: cast_nullable_to_non_nullable
              as Map<int, List<DateTime>>,
      entries: freezed == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as HiveList<HiveObjectMixin>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: "TimetableAdapter")
class _$TimetableImpl extends _Timetable {
  _$TimetableImpl(
      {@HiveField(1) required this.id,
      @HiveField(2) required this.title,
      @HiveField(3) required this.days,
      @HiveField(4) required this.maxLessons,
      @HiveField(5) required this.lessonTimes,
      @HiveField(6)
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.entries})
      : super._();

  factory _$TimetableImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableImplFromJson(json);

  @override
  @HiveField(1)
  int id;
  @override
  @HiveField(2)
  String title;
  @override
  @HiveField(3)
  int days;
  @override
  @HiveField(4)
  int maxLessons;
  @override
  @HiveField(5)
  Map<int, List<DateTime>> lessonTimes;
  @override
  @HiveField(6)
  @JsonKey(includeFromJson: false, includeToJson: false)
  HiveList<HiveObjectMixin>? entries;

  @override
  String toString() {
    return 'Timetable(id: $id, title: $title, days: $days, maxLessons: $maxLessons, lessonTimes: $lessonTimes, entries: $entries)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimetableImplCopyWith<_$TimetableImpl> get copyWith =>
      __$$TimetableImplCopyWithImpl<_$TimetableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimetableImplToJson(
      this,
    );
  }
}

abstract class _Timetable extends Timetable {
  factory _Timetable(
      {@HiveField(1) required int id,
      @HiveField(2) required String title,
      @HiveField(3) required int days,
      @HiveField(4) required int maxLessons,
      @HiveField(5) required Map<int, List<DateTime>> lessonTimes,
      @HiveField(6)
      @JsonKey(includeFromJson: false, includeToJson: false)
      HiveList<HiveObjectMixin>? entries}) = _$TimetableImpl;
  _Timetable._() : super._();

  factory _Timetable.fromJson(Map<String, dynamic> json) =
      _$TimetableImpl.fromJson;

  @override
  @HiveField(1)
  int get id;
  @HiveField(1)
  set id(int value);
  @override
  @HiveField(2)
  String get title;
  @HiveField(2)
  set title(String value);
  @override
  @HiveField(3)
  int get days;
  @HiveField(3)
  set days(int value);
  @override
  @HiveField(4)
  int get maxLessons;
  @HiveField(4)
  set maxLessons(int value);
  @override
  @HiveField(5)
  Map<int, List<DateTime>> get lessonTimes;
  @HiveField(5)
  set lessonTimes(Map<int, List<DateTime>> value);
  @override
  @HiveField(6)
  @JsonKey(includeFromJson: false, includeToJson: false)
  HiveList<HiveObjectMixin>? get entries;
  @HiveField(6)
  @JsonKey(includeFromJson: false, includeToJson: false)
  set entries(HiveList<HiveObjectMixin>? value);
  @override
  @JsonKey(ignore: true)
  _$$TimetableImplCopyWith<_$TimetableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimetableEntry _$TimetableEntryFromJson(Map<String, dynamic> json) {
  return _TimetableEntry.fromJson(json);
}

/// @nodoc
mixin _$TimetableEntry {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(0)
  set id(int value) => throw _privateConstructorUsedError;
  @HiveField(1)
  int get timetableId => throw _privateConstructorUsedError;
  @HiveField(1)
  set timetableId(int value) => throw _privateConstructorUsedError;
  @HiveField(2)
  int get weekday => throw _privateConstructorUsedError;
  @HiveField(2)
  set weekday(int value) => throw _privateConstructorUsedError;
  @HiveField(3)
  int get lesson => throw _privateConstructorUsedError;
  @HiveField(3)
  set lesson(int value) => throw _privateConstructorUsedError;
  @HiveField(4)
  String get subject => throw _privateConstructorUsedError;
  @HiveField(4)
  set subject(String value) => throw _privateConstructorUsedError;
  @HiveField(5)
  String get teacher => throw _privateConstructorUsedError;
  @HiveField(5)
  set teacher(String value) => throw _privateConstructorUsedError;
  @HiveField(6)
  String get room => throw _privateConstructorUsedError;
  @HiveField(6)
  set room(String value) => throw _privateConstructorUsedError;
  @HiveField(7)
  int get color => throw _privateConstructorUsedError;
  @HiveField(7)
  set color(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimetableEntryCopyWith<TimetableEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimetableEntryCopyWith<$Res> {
  factory $TimetableEntryCopyWith(
          TimetableEntry value, $Res Function(TimetableEntry) then) =
      _$TimetableEntryCopyWithImpl<$Res, TimetableEntry>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int timetableId,
      @HiveField(2) int weekday,
      @HiveField(3) int lesson,
      @HiveField(4) String subject,
      @HiveField(5) String teacher,
      @HiveField(6) String room,
      @HiveField(7) int color});
}

/// @nodoc
class _$TimetableEntryCopyWithImpl<$Res, $Val extends TimetableEntry>
    implements $TimetableEntryCopyWith<$Res> {
  _$TimetableEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timetableId = null,
    Object? weekday = null,
    Object? lesson = null,
    Object? subject = null,
    Object? teacher = null,
    Object? room = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      timetableId: null == timetableId
          ? _value.timetableId
          : timetableId // ignore: cast_nullable_to_non_nullable
              as int,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int,
      lesson: null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as int,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String,
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimetableEntryImplCopyWith<$Res>
    implements $TimetableEntryCopyWith<$Res> {
  factory _$$TimetableEntryImplCopyWith(_$TimetableEntryImpl value,
          $Res Function(_$TimetableEntryImpl) then) =
      __$$TimetableEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int timetableId,
      @HiveField(2) int weekday,
      @HiveField(3) int lesson,
      @HiveField(4) String subject,
      @HiveField(5) String teacher,
      @HiveField(6) String room,
      @HiveField(7) int color});
}

/// @nodoc
class __$$TimetableEntryImplCopyWithImpl<$Res>
    extends _$TimetableEntryCopyWithImpl<$Res, _$TimetableEntryImpl>
    implements _$$TimetableEntryImplCopyWith<$Res> {
  __$$TimetableEntryImplCopyWithImpl(
      _$TimetableEntryImpl _value, $Res Function(_$TimetableEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timetableId = null,
    Object? weekday = null,
    Object? lesson = null,
    Object? subject = null,
    Object? teacher = null,
    Object? room = null,
    Object? color = null,
  }) {
    return _then(_$TimetableEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      timetableId: null == timetableId
          ? _value.timetableId
          : timetableId // ignore: cast_nullable_to_non_nullable
              as int,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as int,
      lesson: null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as int,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String,
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3, adapterName: "TimetableEntryAdapter")
class _$TimetableEntryImpl extends _TimetableEntry {
  _$TimetableEntryImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.timetableId,
      @HiveField(2) required this.weekday,
      @HiveField(3) required this.lesson,
      @HiveField(4) required this.subject,
      @HiveField(5) required this.teacher,
      @HiveField(6) required this.room,
      @HiveField(7) required this.color})
      : super._();

  factory _$TimetableEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableEntryImplFromJson(json);

  @override
  @HiveField(0)
  int id;
  @override
  @HiveField(1)
  int timetableId;
  @override
  @HiveField(2)
  int weekday;
  @override
  @HiveField(3)
  int lesson;
  @override
  @HiveField(4)
  String subject;
  @override
  @HiveField(5)
  String teacher;
  @override
  @HiveField(6)
  String room;
  @override
  @HiveField(7)
  int color;

  @override
  String toString() {
    return 'TimetableEntry(id: $id, timetableId: $timetableId, weekday: $weekday, lesson: $lesson, subject: $subject, teacher: $teacher, room: $room, color: $color)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimetableEntryImplCopyWith<_$TimetableEntryImpl> get copyWith =>
      __$$TimetableEntryImplCopyWithImpl<_$TimetableEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimetableEntryImplToJson(
      this,
    );
  }
}

abstract class _TimetableEntry extends TimetableEntry {
  factory _TimetableEntry(
      {@HiveField(0) required int id,
      @HiveField(1) required int timetableId,
      @HiveField(2) required int weekday,
      @HiveField(3) required int lesson,
      @HiveField(4) required String subject,
      @HiveField(5) required String teacher,
      @HiveField(6) required String room,
      @HiveField(7) required int color}) = _$TimetableEntryImpl;
  _TimetableEntry._() : super._();

  factory _TimetableEntry.fromJson(Map<String, dynamic> json) =
      _$TimetableEntryImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @HiveField(0)
  set id(int value);
  @override
  @HiveField(1)
  int get timetableId;
  @HiveField(1)
  set timetableId(int value);
  @override
  @HiveField(2)
  int get weekday;
  @HiveField(2)
  set weekday(int value);
  @override
  @HiveField(3)
  int get lesson;
  @HiveField(3)
  set lesson(int value);
  @override
  @HiveField(4)
  String get subject;
  @HiveField(4)
  set subject(String value);
  @override
  @HiveField(5)
  String get teacher;
  @HiveField(5)
  set teacher(String value);
  @override
  @HiveField(6)
  String get room;
  @HiveField(6)
  set room(String value);
  @override
  @HiveField(7)
  int get color;
  @HiveField(7)
  set color(int value);
  @override
  @JsonKey(ignore: true)
  _$$TimetableEntryImplCopyWith<_$TimetableEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
