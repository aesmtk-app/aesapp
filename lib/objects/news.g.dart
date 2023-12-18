// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsPreviewImpl _$$NewsPreviewImplFromJson(Map<String, dynamic> json) =>
    _$NewsPreviewImpl(
      id: json['id'] as int,
      created: DateTime.parse(json['created'] as String),
      title: json['title'] as String,
      preview: json['preview'] as String,
      source: json['source'] as String,
      author: json['author'] as String,
      lastEdited: json['last_edited'] == null
          ? null
          : DateTime.parse(json['last_edited'] as String),
    );

Map<String, dynamic> _$$NewsPreviewImplToJson(_$NewsPreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'title': instance.title,
      'preview': instance.preview,
      'source': instance.source,
      'author': instance.author,
      'last_edited': instance.lastEdited?.toIso8601String(),
    };

_$NewsArticleImpl _$$NewsArticleImplFromJson(Map<String, dynamic> json) =>
    _$NewsArticleImpl(
      id: json['id'] as int,
      created: DateTime.parse(json['created'] as String),
      title: json['title'] as String,
      preview: json['preview'] as String,
      source: json['source'] as String,
      author: json['author'] as String,
      content: json['content'] as String,
      lastEdited: json['last_edited'] == null
          ? null
          : DateTime.parse(json['last_edited'] as String),
    );

Map<String, dynamic> _$$NewsArticleImplToJson(_$NewsArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'title': instance.title,
      'preview': instance.preview,
      'source': instance.source,
      'author': instance.author,
      'content': instance.content,
      'last_edited': instance.lastEdited?.toIso8601String(),
    };
