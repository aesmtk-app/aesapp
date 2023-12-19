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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return _Timetable.fromJson(json);
}

/// @nodoc
mixin _$Timetable {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;

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
  $Res call({int id, String title});
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
  $Res call({int id, String title});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimetableImpl implements _Timetable {
  _$TimetableImpl({required this.id, required this.title});

  factory _$TimetableImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableImplFromJson(json);

  @override
  int id;
  @override
  String title;

  @override
  String toString() {
    return 'Timetable(id: $id, title: $title)';
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

abstract class _Timetable implements Timetable {
  factory _Timetable({required int id, required String title}) =
      _$TimetableImpl;

  factory _Timetable.fromJson(Map<String, dynamic> json) =
      _$TimetableImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  String get title;
  set title(String value);
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
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  int get timetableId => throw _privateConstructorUsedError;
  set timetableId(int value) => throw _privateConstructorUsedError;
  int get weekday => throw _privateConstructorUsedError;
  set weekday(int value) => throw _privateConstructorUsedError;
  int get lesson => throw _privateConstructorUsedError;
  set lesson(int value) => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  set subject(String value) => throw _privateConstructorUsedError;
  String get teacher => throw _privateConstructorUsedError;
  set teacher(String value) => throw _privateConstructorUsedError;
  String get room => throw _privateConstructorUsedError;
  set room(String value) => throw _privateConstructorUsedError;

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
      {int id,
      int timetableId,
      int weekday,
      int lesson,
      String subject,
      String teacher,
      String room});
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
      {int id,
      int timetableId,
      int weekday,
      int lesson,
      String subject,
      String teacher,
      String room});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimetableEntryImpl implements _TimetableEntry {
  _$TimetableEntryImpl(
      {required this.id,
      required this.timetableId,
      required this.weekday,
      required this.lesson,
      required this.subject,
      required this.teacher,
      required this.room});

  factory _$TimetableEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableEntryImplFromJson(json);

  @override
  int id;
  @override
  int timetableId;
  @override
  int weekday;
  @override
  int lesson;
  @override
  String subject;
  @override
  String teacher;
  @override
  String room;

  @override
  String toString() {
    return 'TimetableEntry(id: $id, timetableId: $timetableId, weekday: $weekday, lesson: $lesson, subject: $subject, teacher: $teacher, room: $room)';
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

abstract class _TimetableEntry implements TimetableEntry {
  factory _TimetableEntry(
      {required int id,
      required int timetableId,
      required int weekday,
      required int lesson,
      required String subject,
      required String teacher,
      required String room}) = _$TimetableEntryImpl;

  factory _TimetableEntry.fromJson(Map<String, dynamic> json) =
      _$TimetableEntryImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  int get timetableId;
  set timetableId(int value);
  @override
  int get weekday;
  set weekday(int value);
  @override
  int get lesson;
  set lesson(int value);
  @override
  String get subject;
  set subject(String value);
  @override
  String get teacher;
  set teacher(String value);
  @override
  String get room;
  set room(String value);
  @override
  @JsonKey(ignore: true)
  _$$TimetableEntryImplCopyWith<_$TimetableEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
