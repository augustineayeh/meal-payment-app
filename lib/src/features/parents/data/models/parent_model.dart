// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/parent.dart';

part 'parent_model.g.dart';

@JsonSerializable()
class ParentModel extends Parent {
  const ParentModel({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.fullName,
    required super.location,
    required this.wards,
  }) : super(
          firstName: firstName,
          fullName: fullName,
          wards: wards,
          middleName: middleName,
          lastName: lastName,
        );

  @override
  @JsonKey(name: 'first_name')
  final String firstName;

  @override
  @JsonKey(name: 'last_name')
  final String lastName;

  @override
  @JsonKey(name: 'middle_name')
  final String middleName;

  @override
  @JsonKey(name: 'full_name')
  final String fullName;

  @override
  @JsonKey(name: 'students')
  final List<String> wards;

  factory ParentModel.fromJson(Map<String, dynamic> json) =>
      _$ParentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParentModelToJson(this);
}
