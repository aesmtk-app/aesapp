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
  @HiveField(1)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  set id(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: "creation_time")
  @HiveField(2)
  DateTime get creationTime => throw _privateConstructorUsedError;
  @JsonKey(name: "creation_time")
  @HiveField(2)
  set creationTime(DateTime value) => throw _privateConstructorUsedError;
  @JsonKey(name: "is_info")
  @HiveField(3)
  bool get isInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "is_info")
  @HiveField(3)
  set isInfo(bool value) => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(4)
  set date(DateTime value) => throw _privateConstructorUsedError;
  @JsonKey(name: "class")
  @HiveField(5)
  String? get course => throw _privateConstructorUsedError;
  @JsonKey(name: "class")
  @HiveField(5)
  set course(String? value) => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get comment => throw _privateConstructorUsedError;
  @HiveField(6)
  set comment(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "is_cancelled")
  @HiveField(7)
  bool? get isCancelled => throw _privateConstructorUsedError;
  @JsonKey(name: "is_cancelled")
  @HiveField(7)
  set isCancelled(bool? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "lesson_start")
  @HiveField(8)
  int? get lessonStart => throw _privateConstructorUsedError;
  @JsonKey(name: "lesson_start")
  @HiveField(8)
  set lessonStart(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "lesson_end")
  @HiveField(9)
  int? get lessonEnd => throw _privateConstructorUsedError;
  @JsonKey(name: "lesson_end")
  @HiveField(9)
  set lessonEnd(int? value) => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get replacement => throw _privateConstructorUsedError;
  @HiveField(10)
  set replacement(String? value) => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get room => throw _privateConstructorUsedError;
  @HiveField(11)
  set room(String? value) => throw _privateConstructorUsedError;
  @HiveField(12)
  String? get subject => throw _privateConstructorUsedError;
  @HiveField(12)
  set subject(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "subject_old")
  @HiveField(13)
  String? get subjectOld => throw _privateConstructorUsedError;
  @JsonKey(name: "subject_old")
  @HiveField(13)
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
      {@HiveField(1) int id,
      @JsonKey(name: "creation_time") @HiveField(2) DateTime creationTime,
      @JsonKey(name: "is_info") @HiveField(3) bool isInfo,
      @HiveField(4) DateTime date,
      @JsonKey(name: "class") @HiveField(5) String? course,
      @HiveField(6) String? comment,
      @JsonKey(name: "is_cancelled") @HiveField(7) bool? isCancelled,
      @JsonKey(name: "lesson_start") @HiveField(8) int? lessonStart,
      @JsonKey(name: "lesson_end") @HiveField(9) int? lessonEnd,
      @HiveField(10) String? replacement,
      @HiveField(11) String? room,
      @HiveField(12) String? subject,
      @JsonKey(name: "subject_old") @HiveField(13) String? subjectOld});
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
      {@HiveField(1) int id,
      @JsonKey(name: "creation_time") @HiveField(2) DateTime creationTime,
      @JsonKey(name: "is_info") @HiveField(3) bool isInfo,
      @HiveField(4) DateTime date,
      @JsonKey(name: "class") @HiveField(5) String? course,
      @HiveField(6) String? comment,
      @JsonKey(name: "is_cancelled") @HiveField(7) bool? isCancelled,
      @JsonKey(name: "lesson_start") @HiveField(8) int? lessonStart,
      @JsonKey(name: "lesson_end") @HiveField(9) int? lessonEnd,
      @HiveField(10) String? replacement,
      @HiveField(11) String? room,
      @HiveField(12) String? subject,
      @JsonKey(name: "subject_old") @HiveField(13) String? subjectOld});
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
@HiveType(typeId: 1, adapterName: "VPlanEntryAdapter")
class _$VPlanEntryImpl extends _VPlanEntry {
  _$VPlanEntryImpl(
      {@HiveField(1) required this.id,
      @JsonKey(name: "creation_time") @HiveField(2) required this.creationTime,
      @JsonKey(name: "is_info") @HiveField(3) required this.isInfo,
      @HiveField(4) required this.date,
      @JsonKey(name: "class") @HiveField(5) this.course,
      @HiveField(6) this.comment,
      @JsonKey(name: "is_cancelled") @HiveField(7) this.isCancelled,
      @JsonKey(name: "lesson_start") @HiveField(8) this.lessonStart,
      @JsonKey(name: "lesson_end") @HiveField(9) this.lessonEnd,
      @HiveField(10) this.replacement,
      @HiveField(11) this.room,
      @HiveField(12) this.subject,
      @JsonKey(name: "subject_old") @HiveField(13) this.subjectOld})
      : super._();

  factory _$VPlanEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VPlanEntryImplFromJson(json);

  @override
  @HiveField(1)
  int id;
  @override
  @JsonKey(name: "creation_time")
  @HiveField(2)
  DateTime creationTime;
  @override
  @JsonKey(name: "is_info")
  @HiveField(3)
  bool isInfo;
  @override
  @HiveField(4)
  DateTime date;
  @override
  @JsonKey(name: "class")
  @HiveField(5)
  String? course;
  @override
  @HiveField(6)
  String? comment;
  @override
  @JsonKey(name: "is_cancelled")
  @HiveField(7)
  bool? isCancelled;
  @override
  @JsonKey(name: "lesson_start")
  @HiveField(8)
  int? lessonStart;
  @override
  @JsonKey(name: "lesson_end")
  @HiveField(9)
  int? lessonEnd;
  @override
  @HiveField(10)
  String? replacement;
  @override
  @HiveField(11)
  String? room;
  @override
  @HiveField(12)
  String? subject;
  @override
  @JsonKey(name: "subject_old")
  @HiveField(13)
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

abstract class _VPlanEntry extends VPlanEntry {
  factory _VPlanEntry(
          {@HiveField(1) required int id,
          @JsonKey(name: "creation_time")
          @HiveField(2)
          required DateTime creationTime,
          @JsonKey(name: "is_info") @HiveField(3) required bool isInfo,
          @HiveField(4) required DateTime date,
          @JsonKey(name: "class") @HiveField(5) String? course,
          @HiveField(6) String? comment,
          @JsonKey(name: "is_cancelled") @HiveField(7) bool? isCancelled,
          @JsonKey(name: "lesson_start") @HiveField(8) int? lessonStart,
          @JsonKey(name: "lesson_end") @HiveField(9) int? lessonEnd,
          @HiveField(10) String? replacement,
          @HiveField(11) String? room,
          @HiveField(12) String? subject,
          @JsonKey(name: "subject_old") @HiveField(13) String? subjectOld}) =
      _$VPlanEntryImpl;
  _VPlanEntry._() : super._();

  factory _VPlanEntry.fromJson(Map<String, dynamic> json) =
      _$VPlanEntryImpl.fromJson;

  @override
  @HiveField(1)
  int get id;
  @HiveField(1)
  set id(int value);
  @override
  @JsonKey(name: "creation_time")
  @HiveField(2)
  DateTime get creationTime;
  @JsonKey(name: "creation_time")
  @HiveField(2)
  set creationTime(DateTime value);
  @override
  @JsonKey(name: "is_info")
  @HiveField(3)
  bool get isInfo;
  @JsonKey(name: "is_info")
  @HiveField(3)
  set isInfo(bool value);
  @override
  @HiveField(4)
  DateTime get date;
  @HiveField(4)
  set date(DateTime value);
  @override
  @JsonKey(name: "class")
  @HiveField(5)
  String? get course;
  @JsonKey(name: "class")
  @HiveField(5)
  set course(String? value);
  @override
  @HiveField(6)
  String? get comment;
  @HiveField(6)
  set comment(String? value);
  @override
  @JsonKey(name: "is_cancelled")
  @HiveField(7)
  bool? get isCancelled;
  @JsonKey(name: "is_cancelled")
  @HiveField(7)
  set isCancelled(bool? value);
  @override
  @JsonKey(name: "lesson_start")
  @HiveField(8)
  int? get lessonStart;
  @JsonKey(name: "lesson_start")
  @HiveField(8)
  set lessonStart(int? value);
  @override
  @JsonKey(name: "lesson_end")
  @HiveField(9)
  int? get lessonEnd;
  @JsonKey(name: "lesson_end")
  @HiveField(9)
  set lessonEnd(int? value);
  @override
  @HiveField(10)
  String? get replacement;
  @HiveField(10)
  set replacement(String? value);
  @override
  @HiveField(11)
  String? get room;
  @HiveField(11)
  set room(String? value);
  @override
  @HiveField(12)
  String? get subject;
  @HiveField(12)
  set subject(String? value);
  @override
  @JsonKey(name: "subject_old")
  @HiveField(13)
  String? get subjectOld;
  @JsonKey(name: "subject_old")
  @HiveField(13)
  set subjectOld(String? value);
  @override
  @JsonKey(ignore: true)
  _$$VPlanEntryImplCopyWith<_$VPlanEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
