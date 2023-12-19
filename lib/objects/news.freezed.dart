// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsPreview _$NewsPreviewFromJson(Map<String, dynamic> json) {
  return _NewsPreview.fromJson(json);
}

/// @nodoc
mixin _$NewsPreview {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  @JsonKey()
  DateTime get created => throw _privateConstructorUsedError;
  @JsonKey()
  set created(DateTime value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get preview => throw _privateConstructorUsedError;
  set preview(String value) => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  set source(String value) => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  set author(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "last_edited")
  DateTime? get lastEdited => throw _privateConstructorUsedError;
  @JsonKey(name: "last_edited")
  set lastEdited(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsPreviewCopyWith<NewsPreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsPreviewCopyWith<$Res> {
  factory $NewsPreviewCopyWith(
          NewsPreview value, $Res Function(NewsPreview) then) =
      _$NewsPreviewCopyWithImpl<$Res, NewsPreview>;
  @useResult
  $Res call(
      {int id,
      @JsonKey() DateTime created,
      String title,
      String preview,
      String source,
      String author,
      @JsonKey(name: "last_edited") DateTime? lastEdited});
}

/// @nodoc
class _$NewsPreviewCopyWithImpl<$Res, $Val extends NewsPreview>
    implements $NewsPreviewCopyWith<$Res> {
  _$NewsPreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? title = null,
    Object? preview = null,
    Object? source = null,
    Object? author = null,
    Object? lastEdited = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      lastEdited: freezed == lastEdited
          ? _value.lastEdited
          : lastEdited // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsPreviewImplCopyWith<$Res>
    implements $NewsPreviewCopyWith<$Res> {
  factory _$$NewsPreviewImplCopyWith(
          _$NewsPreviewImpl value, $Res Function(_$NewsPreviewImpl) then) =
      __$$NewsPreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey() DateTime created,
      String title,
      String preview,
      String source,
      String author,
      @JsonKey(name: "last_edited") DateTime? lastEdited});
}

/// @nodoc
class __$$NewsPreviewImplCopyWithImpl<$Res>
    extends _$NewsPreviewCopyWithImpl<$Res, _$NewsPreviewImpl>
    implements _$$NewsPreviewImplCopyWith<$Res> {
  __$$NewsPreviewImplCopyWithImpl(
      _$NewsPreviewImpl _value, $Res Function(_$NewsPreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? title = null,
    Object? preview = null,
    Object? source = null,
    Object? author = null,
    Object? lastEdited = freezed,
  }) {
    return _then(_$NewsPreviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      lastEdited: freezed == lastEdited
          ? _value.lastEdited
          : lastEdited // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsPreviewImpl implements _NewsPreview {
  _$NewsPreviewImpl(
      {required this.id,
      @JsonKey() required this.created,
      required this.title,
      required this.preview,
      required this.source,
      required this.author,
      @JsonKey(name: "last_edited") this.lastEdited});

  factory _$NewsPreviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsPreviewImplFromJson(json);

  @override
  int id;
  @override
  @JsonKey()
  DateTime created;
  @override
  String title;
  @override
  String preview;
  @override
  String source;
  @override
  String author;
  @override
  @JsonKey(name: "last_edited")
  DateTime? lastEdited;

  @override
  String toString() {
    return 'NewsPreview(id: $id, created: $created, title: $title, preview: $preview, source: $source, author: $author, lastEdited: $lastEdited)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsPreviewImplCopyWith<_$NewsPreviewImpl> get copyWith =>
      __$$NewsPreviewImplCopyWithImpl<_$NewsPreviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsPreviewImplToJson(
      this,
    );
  }
}

abstract class _NewsPreview implements NewsPreview {
  factory _NewsPreview(
      {required int id,
      @JsonKey() required DateTime created,
      required String title,
      required String preview,
      required String source,
      required String author,
      @JsonKey(name: "last_edited") DateTime? lastEdited}) = _$NewsPreviewImpl;

  factory _NewsPreview.fromJson(Map<String, dynamic> json) =
      _$NewsPreviewImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  @JsonKey()
  DateTime get created;
  @JsonKey()
  set created(DateTime value);
  @override
  String get title;
  set title(String value);
  @override
  String get preview;
  set preview(String value);
  @override
  String get source;
  set source(String value);
  @override
  String get author;
  set author(String value);
  @override
  @JsonKey(name: "last_edited")
  DateTime? get lastEdited;
  @JsonKey(name: "last_edited")
  set lastEdited(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$NewsPreviewImplCopyWith<_$NewsPreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) {
  return _NewsArticle.fromJson(json);
}

/// @nodoc
mixin _$NewsArticle {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  set created(DateTime value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  String get preview => throw _privateConstructorUsedError;
  set preview(String value) => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  set source(String value) => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  set author(String value) => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  set content(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "last_edited")
  DateTime? get lastEdited => throw _privateConstructorUsedError;
  @JsonKey(name: "last_edited")
  set lastEdited(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsArticleCopyWith<NewsArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsArticleCopyWith<$Res> {
  factory $NewsArticleCopyWith(
          NewsArticle value, $Res Function(NewsArticle) then) =
      _$NewsArticleCopyWithImpl<$Res, NewsArticle>;
  @useResult
  $Res call(
      {int id,
      DateTime created,
      String title,
      String preview,
      String source,
      String author,
      String content,
      @JsonKey(name: "last_edited") DateTime? lastEdited});
}

/// @nodoc
class _$NewsArticleCopyWithImpl<$Res, $Val extends NewsArticle>
    implements $NewsArticleCopyWith<$Res> {
  _$NewsArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? title = null,
    Object? preview = null,
    Object? source = null,
    Object? author = null,
    Object? content = null,
    Object? lastEdited = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      lastEdited: freezed == lastEdited
          ? _value.lastEdited
          : lastEdited // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsArticleImplCopyWith<$Res>
    implements $NewsArticleCopyWith<$Res> {
  factory _$$NewsArticleImplCopyWith(
          _$NewsArticleImpl value, $Res Function(_$NewsArticleImpl) then) =
      __$$NewsArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime created,
      String title,
      String preview,
      String source,
      String author,
      String content,
      @JsonKey(name: "last_edited") DateTime? lastEdited});
}

/// @nodoc
class __$$NewsArticleImplCopyWithImpl<$Res>
    extends _$NewsArticleCopyWithImpl<$Res, _$NewsArticleImpl>
    implements _$$NewsArticleImplCopyWith<$Res> {
  __$$NewsArticleImplCopyWithImpl(
      _$NewsArticleImpl _value, $Res Function(_$NewsArticleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? title = null,
    Object? preview = null,
    Object? source = null,
    Object? author = null,
    Object? content = null,
    Object? lastEdited = freezed,
  }) {
    return _then(_$NewsArticleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      preview: null == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      lastEdited: freezed == lastEdited
          ? _value.lastEdited
          : lastEdited // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsArticleImpl implements _NewsArticle {
  _$NewsArticleImpl(
      {required this.id,
      required this.created,
      required this.title,
      required this.preview,
      required this.source,
      required this.author,
      required this.content,
      @JsonKey(name: "last_edited") this.lastEdited});

  factory _$NewsArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsArticleImplFromJson(json);

  @override
  int id;
  @override
  DateTime created;
  @override
  String title;
  @override
  String preview;
  @override
  String source;
  @override
  String author;
  @override
  String content;
  @override
  @JsonKey(name: "last_edited")
  DateTime? lastEdited;

  @override
  String toString() {
    return 'NewsArticle(id: $id, created: $created, title: $title, preview: $preview, source: $source, author: $author, content: $content, lastEdited: $lastEdited)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsArticleImplCopyWith<_$NewsArticleImpl> get copyWith =>
      __$$NewsArticleImplCopyWithImpl<_$NewsArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsArticleImplToJson(
      this,
    );
  }
}

abstract class _NewsArticle implements NewsArticle {
  factory _NewsArticle(
      {required int id,
      required DateTime created,
      required String title,
      required String preview,
      required String source,
      required String author,
      required String content,
      @JsonKey(name: "last_edited") DateTime? lastEdited}) = _$NewsArticleImpl;

  factory _NewsArticle.fromJson(Map<String, dynamic> json) =
      _$NewsArticleImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  DateTime get created;
  set created(DateTime value);
  @override
  String get title;
  set title(String value);
  @override
  String get preview;
  set preview(String value);
  @override
  String get source;
  set source(String value);
  @override
  String get author;
  set author(String value);
  @override
  String get content;
  set content(String value);
  @override
  @JsonKey(name: "last_edited")
  DateTime? get lastEdited;
  @JsonKey(name: "last_edited")
  set lastEdited(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$NewsArticleImplCopyWith<_$NewsArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
