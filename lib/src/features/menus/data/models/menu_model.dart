import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/menu.dart';

part 'menu_model.g.dart';

@JsonSerializable()
class MenuModel extends Menu {
  const MenuModel({
    required super.name,
    required super.details,
    this.dateCreated,
    required super.price,
    required this.vendorId,
    required super.days,
    required super.id,
  }) : super(
          dateCreated: dateCreated,
          vendorId: vendorId,
        );

  @override
  @JsonKey(name: 'date_created')
  final String? dateCreated;

  @override
  @JsonKey(name: 'vendor')
  final String vendorId;

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenuModelToJson(this);
}
