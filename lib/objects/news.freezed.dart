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
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  set id(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "published_at")
  @HiveField(2)
  DateTime get published => throw _privateConstructorUsedError;
  @JsonKey(name: "published_at")
  @HiveField(2)
  set published(DateTime value) => throw _privateConstructorUsedError;
  @HiveField(3)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  set title(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "preview_text")
  @HiveField(4)
  String get preview => throw _privateConstructorUsedError;
  @JsonKey(name: "preview_text")
  @HiveField(4)
  set preview(String value) => throw _privateConstructorUsedError;
  @HiveField(5)
  String get source => throw _privateConstructorUsedError;
  @HiveField(5)
  set source(String value) => throw _privateConstructorUsedError;
  @HiveField(6)
  String get author => throw _privateConstructorUsedError;
  @HiveField(6)
  set author(String value) => throw _privateConstructorUsedError;

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
      {@HiveField(1) String id,
      @JsonKey(name: "published_at") @HiveField(2) DateTime published,
      @HiveField(3) String title,
      @JsonKey(name: "preview_text") @HiveField(4) String preview,
      @HiveField(5) String source,
      @HiveField(6) String author});
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
    Object? published = null,
    Object? title = null,
    Object? preview = null,
    Object? source = null,
    Object? author = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
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
      {@HiveField(1) String id,
      @JsonKey(name: "published_at") @HiveField(2) DateTime published,
      @HiveField(3) String title,
      @JsonKey(name: "preview_text") @HiveField(4) String preview,
      @HiveField(5) String source,
      @HiveField(6) String author});
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
    Object? published = null,
    Object? title = null,
    Object? preview = null,
    Object? source = null,
    Object? author = null,
  }) {
    return _then(_$NewsPreviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 4, adapterName: "NewsPreviewAdapter")
class _$NewsPreviewImpl extends _NewsPreview {
  _$NewsPreviewImpl(
      {@HiveField(1) required this.id,
      @JsonKey(name: "published_at") @HiveField(2) required this.published,
      @HiveField(3) required this.title,
      @JsonKey(name: "preview_text") @HiveField(4) required this.preview,
      @HiveField(5) required this.source,
      @HiveField(6) required this.author})
      : super._();

  factory _$NewsPreviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsPreviewImplFromJson(json);

  @override
  @HiveField(1)
  String id;
  @override
  @JsonKey(name: "published_at")
  @HiveField(2)
  DateTime published;
  @override
  @HiveField(3)
  String title;
  @override
  @JsonKey(name: "preview_text")
  @HiveField(4)
  String preview;
  @override
  @HiveField(5)
  String source;
  @override
  @HiveField(6)
  String author;

  @override
  String toString() {
    return 'NewsPreview(id: $id, published: $published, title: $title, preview: $preview, source: $source, author: $author)';
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

abstract class _NewsPreview extends NewsPreview {
  factory _NewsPreview(
      {@HiveField(1) required String id,
      @JsonKey(name: "published_at") @HiveField(2) required DateTime published,
      @HiveField(3) required String title,
      @JsonKey(name: "preview_text") @HiveField(4) required String preview,
      @HiveField(5) required String source,
      @HiveField(6) required String author}) = _$NewsPreviewImpl;
  _NewsPreview._() : super._();

  factory _NewsPreview.fromJson(Map<String, dynamic> json) =
      _$NewsPreviewImpl.fromJson;

  @override
  @HiveField(1)
  String get id;
  @HiveField(1)
  set id(String value);
  @override
  @JsonKey(name: "published_at")
  @HiveField(2)
  DateTime get published;
  @JsonKey(name: "published_at")
  @HiveField(2)
  set published(DateTime value);
  @override
  @HiveField(3)
  String get title;
  @HiveField(3)
  set title(String value);
  @override
  @JsonKey(name: "preview_text")
  @HiveField(4)
  String get preview;
  @JsonKey(name: "preview_text")
  @HiveField(4)
  set preview(String value);
  @override
  @HiveField(5)
  String get source;
  @HiveField(5)
  set source(String value);
  @override
  @HiveField(6)
  String get author;
  @HiveField(6)
  set author(String value);
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
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "published_at")
  DateTime get published => throw _privateConstructorUsedError;
  @JsonKey(name: "published_at")
  set published(DateTime value) => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  set title(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "preview_text")
  String get preview => throw _privateConstructorUsedError;
  @JsonKey(name: "preview_text")
  set preview(String value) => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  set source(String value) => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  set author(String value) => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  set body(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: "creation_time")
  DateTime get created => throw _privateConstructorUsedError;
  @JsonKey(name: "creation_time")
  set created(DateTime value) => throw _privateConstructorUsedError;

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
      {String id,
      @JsonKey(name: "published_at") DateTime published,
      String title,
      @JsonKey(name: "preview_text") String preview,
      String source,
      String author,
      String body,
      @JsonKey(name: "creation_time") DateTime created});
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
    Object? published = null,
    Object? title = null,
    Object? preview = null,
    Object? source = null,
    Object? author = null,
    Object? body = null,
    Object? created = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
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
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      {String id,
      @JsonKey(name: "published_at") DateTime published,
      String title,
      @JsonKey(name: "preview_text") String preview,
      String source,
      String author,
      String body,
      @JsonKey(name: "creation_time") DateTime created});
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
    Object? published = null,
    Object? title = null,
    Object? preview = null,
    Object? source = null,
    Object? author = null,
    Object? body = null,
    Object? created = null,
  }) {
    return _then(_$NewsArticleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      published: null == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
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
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsArticleImpl implements _NewsArticle {
  _$NewsArticleImpl(
      {required this.id,
      @JsonKey(name: "published_at") required this.published,
      required this.title,
      @JsonKey(name: "preview_text") required this.preview,
      required this.source,
      required this.author,
      required this.body,
      @JsonKey(name: "creation_time") required this.created});

  factory _$NewsArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsArticleImplFromJson(json);

  @override
  String id;
  @override
  @JsonKey(name: "published_at")
  DateTime published;
  @override
  String title;
  @override
  @JsonKey(name: "preview_text")
  String preview;
  @override
  String source;
  @override
  String author;
  @override
  String body;
  @override
  @JsonKey(name: "creation_time")
  DateTime created;

  @override
  String toString() {
    return 'NewsArticle(id: $id, published: $published, title: $title, preview: $preview, source: $source, author: $author, body: $body, created: $created)';
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
          {required String id,
          @JsonKey(name: "published_at") required DateTime published,
          required String title,
          @JsonKey(name: "preview_text") required String preview,
          required String source,
          required String author,
          required String body,
          @JsonKey(name: "creation_time") required DateTime created}) =
      _$NewsArticleImpl;

  factory _NewsArticle.fromJson(Map<String, dynamic> json) =
      _$NewsArticleImpl.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  @JsonKey(name: "published_at")
  DateTime get published;
  @JsonKey(name: "published_at")
  set published(DateTime value);
  @override
  String get title;
  set title(String value);
  @override
  @JsonKey(name: "preview_text")
  String get preview;
  @JsonKey(name: "preview_text")
  set preview(String value);
  @override
  String get source;
  set source(String value);
  @override
  String get author;
  set author(String value);
  @override
  String get body;
  set body(String value);
  @override
  @JsonKey(name: "creation_time")
  DateTime get created;
  @JsonKey(name: "creation_time")
  set created(DateTime value);
  @override
  @JsonKey(ignore: true)
  _$$NewsArticleImplCopyWith<_$NewsArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
