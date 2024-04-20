// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) => MenuModel(
      name: json['name'] as String,
      details: json['details'] as String,
      dateCreated: json['date_created'] as String,
      price: json['price'] as int,
      vendorId: json['vendor'] as String,
      days: json['days'] as String,
    );

Map<String, dynamic> _$MenuModelToJson(MenuModel instance) => <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      'price': instance.price,
      'days': instance.days,
      'date_created': instance.dateCreated,
      'vendor': instance.vendorId,
    };
