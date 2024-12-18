import 'package:aesapp/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';
part 'news.freezed.dart';
@unfreezed
class NewsPreview extends HiveObject with _$NewsPreview{
  @HiveType(typeId: 4, adapterName: "NewsPreviewAdapter")
  factory NewsPreview({
    @HiveField(1)
    required String id,
    @JsonKey(name: "published_at") @HiveField(2)
    required DateTime published,
    @HiveField(3)
    required String title,
    @JsonKey(name: "preview_text") @HiveField(4)
    required String preview,
    @HiveField(5)
    required String source,
    @HiveField(6)
    required String author,
  })=_NewsPreview;
  NewsPreview._();

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