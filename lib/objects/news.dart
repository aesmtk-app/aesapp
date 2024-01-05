import 'package:aesapp/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';
part 'news.freezed.dart';
@unfreezed
class NewsPreview with _$NewsPreview{
  factory NewsPreview({
    required int id,
    @JsonKey()
    required DateTime created,
    required String title,
    required String preview,
    required String source,
    required String author,
    @JsonKey(name: "last_edited")
    DateTime? lastEdited,
  })=_NewsPreview;

  factory NewsPreview.fromJson(Map<String, dynamic> json) => _$NewsPreviewFromJson(json);

}

@unfreezed
class NewsArticle with _$NewsArticle{
  factory NewsArticle({
    required int id,
    required DateTime created,
    required String title,
    required String preview,
    required String source,
    required String author,
    required String content,
    @JsonKey(name: "last_edited",)
    DateTime? lastEdited,
  })=_NewsArticle;

  factory NewsArticle.fromJson(Map<String, dynamic> json) => _$NewsArticleFromJson(json);

}