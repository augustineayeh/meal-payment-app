import 'package:json_annotation/json_annotation.dart';
import 'package:meal_payment_app/src/features/schools/domain/entities/school.dart';

part 'school_model.g.dart';

@JsonSerializable()
class SchoolModel extends School {
  const SchoolModel({
    required super.name,
    required super.location,
    required this.phoneNumber,
    required super.email,
  }) : super(phoneNumber: phoneNumber);

  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  factory SchoolModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolModelFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolModelToJson(this);
}
