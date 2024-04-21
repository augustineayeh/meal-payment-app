// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'schools_cubit.dart';

enum SchoolStatus { initial, loading, success, failure }

class SchoolState extends Equatable {
  const SchoolState({
    this.name = const Field.pure(),
    this.location = const Field.pure(),
    this.phoneNumber = const Field.pure(),
    this.email = const Email.pure(),
    this.status = SchoolStatus.initial,
    this.school = School.empty,
    this.schools = const <School>[],
    this.formStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });
  final Field name;
  final Field location;
  final Field phoneNumber;
  final Email email;
  final SchoolStatus status;
  final School school;
  final List<School> schools;
  final String? errorMessage;
  final FormzSubmissionStatus formStatus;
  final bool isValid;

  SchoolState copyWith({
    Field? name,
    Field? location,
    Field? phoneNumber,
    Email? email,
    SchoolStatus? status,
    School? school,
    List<School>? schools,
    String? errorMessage,
    bool? isValid,
    FormzSubmissionStatus? formStatus,
  }) {
    return SchoolState(
      name: name ?? this.name,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      status: status ?? this.status,
      school: school ?? this.school,
      schools: schools ?? this.schools,
      errorMessage: errorMessage ?? errorMessage,
      isValid: isValid ?? this.isValid,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      location,
      phoneNumber,
      email,
      status,
      school,
      schools,
      errorMessage,
      isValid,
      formStatus,
    ];
  }
}
