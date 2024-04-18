// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'package:meal_payment_app/src/features/vendors/domain/entities/vendor.dart';

part 'vendor_model.g.dart';

@JsonSerializable(explicitToJson: true)
class VendorModel extends Vendor {
  const VendorModel({
    required this.name,
    required this.location,
    required this.phoneNumber,
    required this.school,
  }) : super(
          name: name,
          location: location,
          phoneNumber: phoneNumber,
          school: school,
        );

  @override
  final String name;
  @override
  final String location;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String school;

  factory VendorModel.fromJson(Map<String, dynamic> json) =>
      _$VendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorModelToJson(this);
}
