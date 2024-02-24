// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Timetable.fromJson(json);
}

/// @nodoc
mixin _$Course {
  @HiveField(1)
  @JsonKey()
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey()
  set id(int value) => throw _privateConstructorUsedError;
  @HiveField(2)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  set name(String value) => throw _privateConstructorUsedError;
  @HiveField(3)
  String get short => throw _privateConstructorUsedError;
  @HiveField(3)
  set short(String value) => throw _privateConstructorUsedError;
  @HiveField(4)
  String get teacherShort => throw _privateConstructorUsedError;
  @HiveField(4)
  set teacherShort(String value) => throw _privateConstructorUsedError;
  @HiveField(5)
  int get color => throw _privateConstructorUsedError;
  @HiveField(5)
  set color(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call(
      {@HiveField(1) @JsonKey() int id,
      @HiveField(2) String name,
      @HiveField(3) String short,
      @HiveField(4) String teacherShort,
      @HiveField(5) int color});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? short = null,
    Object? teacherShort = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      short: null == short
          ? _value.short
          : short // ignore: cast_nullable_to_non_nullable
              as String,
      teacherShort: null == teacherShort
          ? _value.teacherShort
          : teacherShort // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimetableImplCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$TimetableImplCopyWith(
          _$TimetableImpl value, $Res Function(_$TimetableImpl) then) =
      __$$TimetableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) @JsonKey() int id,
      @HiveField(2) String name,
      @HiveField(3) String short,
      @HiveField(4) String teacherShort,
      @HiveField(5) int color});
}

/// @nodoc
class __$$TimetableImplCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$TimetableImpl>
    implements _$$TimetableImplCopyWith<$Res> {
  __$$TimetableImplCopyWithImpl(
      _$TimetableImpl _value, $Res Function(_$TimetableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? short = null,
    Object? teacherShort = null,
    Object? color = null,
  }) {
    return _then(_$TimetableImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      short: null == short
          ? _value.short
          : short // ignore: cast_nullable_to_non_nullable
              as String,
      teacherShort: null == teacherShort
          ? _value.teacherShort
          : teacherShort // ignore: cast_nullable_to_non_nullable
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
@HiveType(typeId: 5, adapterName: "CourseAdapter")
class _$TimetableImpl extends _Timetable {
  _$TimetableImpl(
      {@HiveField(1) @JsonKey() required this.id,
      @HiveField(2) required this.name,
      @HiveField(3) required this.short,
      @HiveField(4) required this.teacherShort,
      @HiveField(5) required this.color})
      : super._();

  factory _$TimetableImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimetableImplFromJson(json);

  @override
  @HiveField(1)
  @JsonKey()
  int id;
  @override
  @HiveField(2)
  String name;
  @override
  @HiveField(3)
  String short;
  @override
  @HiveField(4)
  String teacherShort;
  @override
  @HiveField(5)
  int color;

  @override
  String toString() {
    return 'Course(id: $id, name: $name, short: $short, teacherShort: $teacherShort, color: $color)';
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

abstract class _Timetable extends Course {
  factory _Timetable(
      {@HiveField(1) @JsonKey() required int id,
      @HiveField(2) required String name,
      @HiveField(3) required String short,
      @HiveField(4) required String teacherShort,
      @HiveField(5) required int color}) = _$TimetableImpl;
  _Timetable._() : super._();

  factory _Timetable.fromJson(Map<String, dynamic> json) =
      _$TimetableImpl.fromJson;

  @override
  @HiveField(1)
  @JsonKey()
  int get id;
  @HiveField(1)
  @JsonKey()
  set id(int value);
  @override
  @HiveField(2)
  String get name;
  @HiveField(2)
  set name(String value);
  @override
  @HiveField(3)
  String get short;
  @HiveField(3)
  set short(String value);
  @override
  @HiveField(4)
  String get teacherShort;
  @HiveField(4)
  set teacherShort(String value);
  @override
  @HiveField(5)
  int get color;
  @HiveField(5)
  set color(int value);
  @override
  @JsonKey(ignore: true)
  _$$TimetableImplCopyWith<_$TimetableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
