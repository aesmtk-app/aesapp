// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      date: DateTime.parse(json['date'] as String),
      creationTime: json['creation_time'] == null
          ? null
          : DateTime.parse(json['creation_time'] as String),
      normal: json['normal'] as String?,
      veggie: json['veggie'] as String?,
      pasta: json['pasta'] as String?,
      dessert: json['dessert'] as String?,
      umbestellbar: json['umbestellbar'] as bool?,
      isAutoGenerated: json['is_auto_generated'] as bool?,
      hidden: json['hidden'] as bool?,
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'creation_time': instance.creationTime?.toIso8601String(),
      'normal': instance.normal,
      'veggie': instance.veggie,
      'pasta': instance.pasta,
      'dessert': instance.dessert,
      'umbestellbar': instance.umbestellbar,
      'is_auto_generated': instance.isAutoGenerated,
      'hidden': instance.hidden,
    };

_$MenuOptionImpl _$$MenuOptionImplFromJson(Map<String, dynamic> json) =>
    _$MenuOptionImpl(
      json['category'] as String,
      json['menu'] as String,
    );

Map<String, dynamic> _$$MenuOptionImplToJson(_$MenuOptionImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'menu': instance.menu,
    };
