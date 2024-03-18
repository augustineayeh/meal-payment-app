// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
      avatar: json['avatar'] as String,
      phone: json['phone'] as String,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      city: json['city'] as String,
      country: json['country'] as String,
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      created: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'bio': instance.bio,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'birthday': instance.birthday?.toIso8601String(),
      'city': instance.city,
      'country': instance.country,
      'interests': instance.interests,
      'languages': instance.languages,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'created_at': instance.created?.toIso8601String(),
      'updated_at': instance.updated?.toIso8601String(),
    };
