// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) => MenuModel(
      id: json['id'] as String,
      name: json['name'] as String,
      details: json['details'] as List<dynamic>,
      dateCreated: json['date_created'] as String,
      price: json['price'] as double,
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
