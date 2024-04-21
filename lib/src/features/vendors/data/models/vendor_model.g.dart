// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorModel _$VendorModelFromJson(Map<String, dynamic> json) => VendorModel(
      name: json['name'] as String,
      location: json['location'] as String,
      phoneNumber: json['phone_number'] as String,
      school: json['school'] as String,
      id: json['id'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$VendorModelToJson(VendorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'image': instance.image,
      'location': instance.location,
      'phone_number': instance.phoneNumber,
      'school': instance.school,
    };
