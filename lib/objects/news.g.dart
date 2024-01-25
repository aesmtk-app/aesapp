// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsPreviewImpl _$$NewsPreviewImplFromJson(Map<String, dynamic> json) =>
    _$NewsPreviewImpl(
      id: json['id'] as String,
      published: DateTime.parse(json['published_at'] as String),
      title: json['title'] as String,
      preview: json['preview_text'] as String,
      source: json['source'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$$NewsPreviewImplToJson(_$NewsPreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'published_at': instance.published.toIso8601String(),
      'title': instance.title,
      'preview_text': instance.preview,
      'source': instance.source,
      'author': instance.author,
    };

_$NewsArticleImpl _$$NewsArticleImplFromJson(Map<String, dynamic> json) =>
    _$NewsArticleImpl(
      id: json['id'] as String,
      published: DateTime.parse(json['published_at'] as String),
      title: json['title'] as String,
      preview: json['preview_text'] as String,
      source: json['source'] as String,
      author: json['author'] as String,
      body: json['body'] as String,
      created: DateTime.parse(json['creation_time'] as String),
    );

Map<String, dynamic> _$$NewsArticleImplToJson(_$NewsArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'published_at': instance.published.toIso8601String(),
      'title': instance.title,
      'preview_text': instance.preview,
      'source': instance.source,
      'author': instance.author,
      'body': instance.body,
      'creation_time': instance.created.toIso8601String(),
    };
