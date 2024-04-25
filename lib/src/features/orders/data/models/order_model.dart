import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/order.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends OrderEntity {
  const OrderModel({
    required this.itemOrdered,
    super.id,
    required this.dateOrdered,
    required this.orderedBy,
  }) : super(
          dateOrdered: dateOrdered,
          itemOrdered: itemOrdered,
          orderedBy: orderedBy,
        );

  @override
  @JsonKey(name: 'item_ordered')
  final String itemOrdered;

  @override
  @JsonKey(name: 'date_ordered')
  final String dateOrdered;

  @override
  @JsonKey(name: 'ordered_by')
  final String orderedBy;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
