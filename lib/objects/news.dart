import 'package:aesapp/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';
part 'news.freezed.dart';
@unfreezed
class NewsPreview with _$NewsPreview{
  factory NewsPreview({
    required int id,
    @JsonKey(toJson: _timeToJson, fromJson: _timeFromJson)
    required DateTime created,
    required String title,
    required String preview,
    required String source,
    required String author,
    @JsonKey(name: "last_edited", toJson: _tryTimeToJson, fromJson: _tryTimeFromJson)
    DateTime? lastEdited,
  })=_NewsPreview;

  factory NewsPreview.fromJson(Map<String, dynamic> json) => _$NewsPreviewFromJson(json);

  static DateTime? _tryTimeFromJson(String s) =>DateTime.tryParse(s);
  static DateTime _timeFromJson(String s) =>DateTime.parse(s);

  static String _timeToJson(DateTime dt)=>dt.toIso8601String();
  static String _tryTimeToJson(DateTime? dt)=>dt?.toIso8601String()??"";
}

@unfreezed
class NewsArticle with _$NewsArticle{
  factory NewsArticle({
    required int id,
    @JsonKey(toJson: _timeToJson, fromJson: _timeFromJson)
    required DateTime created,
    required String title,
    required String preview,
    required String source,
    required String author,
    required String content,
    @JsonKey(name: "last_edited", toJson: _tryTimeToJson, fromJson: _tryTimeFromJson)
    DateTime? lastEdited,
  })=_NewsArticle;

  factory NewsArticle.fromJson(Map<String, dynamic> json) => _$NewsArticleFromJson(json);


  static DateTime? _tryTimeFromJson(String s) =>DateTime.tryParse(s);
  static DateTime _timeFromJson(String s) =>DateTime.parse(s);

  static String _timeToJson(DateTime dt)=>dt.toIso8601String();
  static String _tryTimeToJson(DateTime? dt)=>dt?.toIso8601String()??"";
}