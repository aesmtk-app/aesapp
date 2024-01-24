import 'package:aesapp/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';
part 'news.freezed.dart';
@unfreezed
class NewsPreview with _$NewsPreview{
  factory NewsPreview({
    required String id,
    @JsonKey(name: "published_at")
    required DateTime published,
    required String title,
    @JsonKey(name: "preview_text")
    required String preview,
    required String source,
    required String author,
  })=_NewsPreview;

  factory NewsPreview.fromJson(Map<String, dynamic> json) => _$NewsPreviewFromJson(json);

}

@unfreezed
class NewsArticle with _$NewsArticle{
  factory NewsArticle({
    required String id,
    @JsonKey(name: "published_at")
    required DateTime published,
    required String title,
    @JsonKey(name: "preview_text")
    required String preview,
    required String source,
    required String author,
    required String body,
    @JsonKey(name: "creation_time")
    required DateTime created,
  })=_NewsArticle;

  factory NewsArticle.fromJson(Map<String, dynamic> json) => _$NewsArticleFromJson(json);

}