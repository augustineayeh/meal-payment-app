// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolModel _$SchoolModelFromJson(Map<String, dynamic> json) => SchoolModel(
      name: json['name'] as String,
      location: json['location'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$SchoolModelToJson(SchoolModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
    };
