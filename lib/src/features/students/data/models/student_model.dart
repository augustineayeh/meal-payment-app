// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/student.dart';

part 'student_model.g.dart';

@JsonSerializable()
class StudentModel extends Student {
  const StudentModel({
    this.firstName,
    this.lastName,
    this.middleName,
    this.fingerPrint,
    this.schoolId,
    this.schoolName,
    super.id,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          middleName: middleName,
          fingerPrint: fingerPrint,
          schoolId: schoolId,
          schoolName: schoolName,
        );

  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'middle_name')
  final String? middleName;
  @override
  @JsonKey(name: 'fingerprint')
  final String? fingerPrint;

  @override
  @JsonKey(name: 'school')
  final String? schoolId;

  @override
  @JsonKey(name: 'school_name')
  final String? schoolName;

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
}
