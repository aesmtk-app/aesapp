// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vplan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VPlanEntry _$VPlanEntryFromJson(Map<String, dynamic> json) {
  return _VPlanEntry.fromJson(json);
}

/// @nodoc
mixin _$VPlanEntry {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
  DateTime get creationTime => throw _privateConstructorUsedError;
  @JsonKey(name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
  set creationTime(DateTime value) => throw _privateConstructorUsedError;
  @JsonKey(name: "is_info")
  bool get isInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "is_info")
  set isInfo(bool value) => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  set date(DateTime value) => throw _privateConstructorUsedError;
  @JsonKey(name: "class")
  String? get course => throw _privateConstructorUsedError;
  @JsonKey(name: "class")
  set course(String? value) => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  set comment(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "is_cancelled")
  bool? get isCancelled => throw _privateConstructorUsedError;
  @JsonKey(name: "is_cancelled")
  set isCancelled(bool? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "lesson_start")
  int? get lessonStart => throw _privateConstructorUsedError;
  @JsonKey(name: "lesson_start")
  set lessonStart(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "lesson_end")
  int? get lessonEnd => throw _privateConstructorUsedError;
  @JsonKey(name: "lesson_end")
  set lessonEnd(int? value) => throw _privateConstructorUsedError;
  String? get replacement => throw _privateConstructorUsedError;
  set replacement(String? value) => throw _privateConstructorUsedError;
  String? get room => throw _privateConstructorUsedError;
  set room(String? value) => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  set subject(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "subject_old")
  String? get subjectOld => throw _privateConstructorUsedError;
  @JsonKey(name: "subject_old")
  set subjectOld(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VPlanEntryCopyWith<VPlanEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VPlanEntryCopyWith<$Res> {
  factory $VPlanEntryCopyWith(
          VPlanEntry value, $Res Function(VPlanEntry) then) =
      _$VPlanEntryCopyWithImpl<$Res, VPlanEntry>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(
          name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
      DateTime creationTime,
      @JsonKey(name: "is_info") bool isInfo,
      DateTime date,
      @JsonKey(name: "class") String? course,
      String? comment,
      @JsonKey(name: "is_cancelled") bool? isCancelled,
      @JsonKey(name: "lesson_start") int? lessonStart,
      @JsonKey(name: "lesson_end") int? lessonEnd,
      String? replacement,
      String? room,
      String? subject,
      @JsonKey(name: "subject_old") String? subjectOld});
}

/// @nodoc
class _$VPlanEntryCopyWithImpl<$Res, $Val extends VPlanEntry>
    implements $VPlanEntryCopyWith<$Res> {
  _$VPlanEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creationTime = null,
    Object? isInfo = null,
    Object? date = null,
    Object? course = freezed,
    Object? comment = freezed,
    Object? isCancelled = freezed,
    Object? lessonStart = freezed,
    Object? lessonEnd = freezed,
    Object? replacement = freezed,
    Object? room = freezed,
    Object? subject = freezed,
    Object? subjectOld = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isInfo: null == isInfo
          ? _value.isInfo
          : isInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelled: freezed == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lessonStart: freezed == lessonStart
          ? _value.lessonStart
          : lessonStart // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonEnd: freezed == lessonEnd
          ? _value.lessonEnd
          : lessonEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      replacement: freezed == replacement
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as String?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectOld: freezed == subjectOld
          ? _value.subjectOld
          : subjectOld // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VPlanEntryImplCopyWith<$Res>
    implements $VPlanEntryCopyWith<$Res> {
  factory _$$VPlanEntryImplCopyWith(
          _$VPlanEntryImpl value, $Res Function(_$VPlanEntryImpl) then) =
      __$$VPlanEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(
          name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
      DateTime creationTime,
      @JsonKey(name: "is_info") bool isInfo,
      DateTime date,
      @JsonKey(name: "class") String? course,
      String? comment,
      @JsonKey(name: "is_cancelled") bool? isCancelled,
      @JsonKey(name: "lesson_start") int? lessonStart,
      @JsonKey(name: "lesson_end") int? lessonEnd,
      String? replacement,
      String? room,
      String? subject,
      @JsonKey(name: "subject_old") String? subjectOld});
}

/// @nodoc
class __$$VPlanEntryImplCopyWithImpl<$Res>
    extends _$VPlanEntryCopyWithImpl<$Res, _$VPlanEntryImpl>
    implements _$$VPlanEntryImplCopyWith<$Res> {
  __$$VPlanEntryImplCopyWithImpl(
      _$VPlanEntryImpl _value, $Res Function(_$VPlanEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creationTime = null,
    Object? isInfo = null,
    Object? date = null,
    Object? course = freezed,
    Object? comment = freezed,
    Object? isCancelled = freezed,
    Object? lessonStart = freezed,
    Object? lessonEnd = freezed,
    Object? replacement = freezed,
    Object? room = freezed,
    Object? subject = freezed,
    Object? subjectOld = freezed,
  }) {
    return _then(_$VPlanEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isInfo: null == isInfo
          ? _value.isInfo
          : isInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      isCancelled: freezed == isCancelled
          ? _value.isCancelled
          : isCancelled // ignore: cast_nullable_to_non_nullable
              as bool?,
      lessonStart: freezed == lessonStart
          ? _value.lessonStart
          : lessonStart // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonEnd: freezed == lessonEnd
          ? _value.lessonEnd
          : lessonEnd // ignore: cast_nullable_to_non_nullable
              as int?,
      replacement: freezed == replacement
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as String?,
      room: freezed == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      subjectOld: freezed == subjectOld
          ? _value.subjectOld
          : subjectOld // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VPlanEntryImpl implements _VPlanEntry {
  _$VPlanEntryImpl(
      {required this.id,
      @JsonKey(
          name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
      required this.creationTime,
      @JsonKey(name: "is_info") required this.isInfo,
      required this.date,
      @JsonKey(name: "class") this.course,
      this.comment,
      @JsonKey(name: "is_cancelled") this.isCancelled,
      @JsonKey(name: "lesson_start") this.lessonStart,
      @JsonKey(name: "lesson_end") this.lessonEnd,
      this.replacement,
      this.room,
      this.subject,
      @JsonKey(name: "subject_old") this.subjectOld});

  factory _$VPlanEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VPlanEntryImplFromJson(json);

  @override
  int id;
  @override
  @JsonKey(name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
  DateTime creationTime;
  @override
  @JsonKey(name: "is_info")
  bool isInfo;
  @override
  DateTime date;
  @override
  @JsonKey(name: "class")
  String? course;
  @override
  String? comment;
  @override
  @JsonKey(name: "is_cancelled")
  bool? isCancelled;
  @override
  @JsonKey(name: "lesson_start")
  int? lessonStart;
  @override
  @JsonKey(name: "lesson_end")
  int? lessonEnd;
  @override
  String? replacement;
  @override
  String? room;
  @override
  String? subject;
  @override
  @JsonKey(name: "subject_old")
  String? subjectOld;

  @override
  String toString() {
    return 'VPlanEntry(id: $id, creationTime: $creationTime, isInfo: $isInfo, date: $date, course: $course, comment: $comment, isCancelled: $isCancelled, lessonStart: $lessonStart, lessonEnd: $lessonEnd, replacement: $replacement, room: $room, subject: $subject, subjectOld: $subjectOld)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VPlanEntryImplCopyWith<_$VPlanEntryImpl> get copyWith =>
      __$$VPlanEntryImplCopyWithImpl<_$VPlanEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VPlanEntryImplToJson(
      this,
    );
  }
}

abstract class _VPlanEntry implements VPlanEntry {
  factory _VPlanEntry(
      {required int id,
      @JsonKey(
          name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
      required DateTime creationTime,
      @JsonKey(name: "is_info") required bool isInfo,
      required DateTime date,
      @JsonKey(name: "class") String? course,
      String? comment,
      @JsonKey(name: "is_cancelled") bool? isCancelled,
      @JsonKey(name: "lesson_start") int? lessonStart,
      @JsonKey(name: "lesson_end") int? lessonEnd,
      String? replacement,
      String? room,
      String? subject,
      @JsonKey(name: "subject_old") String? subjectOld}) = _$VPlanEntryImpl;

  factory _VPlanEntry.fromJson(Map<String, dynamic> json) =
      _$VPlanEntryImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  @JsonKey(name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
  DateTime get creationTime;
  @JsonKey(name: "creation_time", fromJson: _timeFromJson, toJson: _timeToJson)
  set creationTime(DateTime value);
  @override
  @JsonKey(name: "is_info")
  bool get isInfo;
  @JsonKey(name: "is_info")
  set isInfo(bool value);
  @override
  DateTime get date;
  set date(DateTime value);
  @override
  @JsonKey(name: "class")
  String? get course;
  @JsonKey(name: "class")
  set course(String? value);
  @override
  String? get comment;
  set comment(String? value);
  @override
  @JsonKey(name: "is_cancelled")
  bool? get isCancelled;
  @JsonKey(name: "is_cancelled")
  set isCancelled(bool? value);
  @override
  @JsonKey(name: "lesson_start")
  int? get lessonStart;
  @JsonKey(name: "lesson_start")
  set lessonStart(int? value);
  @override
  @JsonKey(name: "lesson_end")
  int? get lessonEnd;
  @JsonKey(name: "lesson_end")
  set lessonEnd(int? value);
  @override
  String? get replacement;
  set replacement(String? value);
  @override
  String? get room;
  set room(String? value);
  @override
  String? get subject;
  set subject(String? value);
  @override
  @JsonKey(name: "subject_old")
  String? get subjectOld;
  @JsonKey(name: "subject_old")
  set subjectOld(String? value);
  @override
  @JsonKey(ignore: true)
  _$$VPlanEntryImplCopyWith<_$VPlanEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
