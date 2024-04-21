// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      itemOrdered: json['item_ordered'] as String,
      id: json['id'] as String?,
      dateOrdered: json['date_ordered'] as String,
      orderedBy: json['ordered_by'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_ordered': instance.itemOrdered,
      'date_ordered': instance.dateOrdered,
      'ordered_by': instance.orderedBy,
    };
