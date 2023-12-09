// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mensa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      date: Menu._timeFromJson(json['date'] as String),
      creationTime: Menu._tryTimeFromJson(json['creation_time'] as String),
      umbestellbar: json['umbestellbar'] as bool?,
      isAutoGenerated: json['is_auto_generated'] as bool?,
      hidden: json['hidden'] as bool?,
    )
      ..normal = json['normal'] as String?
      ..veggie = json['veggie'] as String?
      ..pasta = json['pasta'] as String?
      ..dessert = json['dessert'] as String?;

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'date': Menu._timeToJson(instance.date),
      'creation_time': Menu._tryTimeToJson(instance.creationTime),
      'normal': instance.normal,
      'veggie': instance.veggie,
      'pasta': instance.pasta,
      'dessert': instance.dessert,
      'umbestellbar': instance.umbestellbar,
      'is_auto_generated': instance.isAutoGenerated,
      'hidden': instance.hidden,
    };

MenuOption _$MenuOptionFromJson(Map<String, dynamic> json) => MenuOption(
      json['category'] as String,
      json['menu'] as String,
    );

Map<String, dynamic> _$MenuOptionToJson(MenuOption instance) =>
    <String, dynamic>{
      'category': instance.category,
      'menu': instance.menu,
    };