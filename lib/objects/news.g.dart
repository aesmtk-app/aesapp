// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsPreviewAdapter extends TypeAdapter<_$NewsPreviewImpl> {
  @override
  final int typeId = 4;

  @override
  _$NewsPreviewImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$NewsPreviewImpl(
      id: fields[1] as String,
      published: fields[2] as DateTime,
      title: fields[3] as String,
      preview: fields[4] as String,
      source: fields[5] as String,
      author: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$NewsPreviewImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.published)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.preview)
      ..writeByte(5)
      ..write(obj.source)
      ..writeByte(6)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsPreviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
