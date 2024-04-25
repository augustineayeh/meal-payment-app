// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) => SchoolModel(
      name: json['name'] as String,
      id: json['id'] as String?,
      location: json['location'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$SchoolModelToJson(SchoolModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'image': instance.image,
      'phone_number': instance.phoneNumber,
    };
