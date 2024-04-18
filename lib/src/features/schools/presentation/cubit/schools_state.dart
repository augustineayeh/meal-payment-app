// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'schools_cubit.dart';

enum SchoolStatus { initial, loading, success, failure }

class SchoolState extends Equatable {
  const SchoolState({
    this.name = const Field.pure(),
    this.location = const Field.pure(),
    this.phoneNumber = const Field.pure(),
    this.email = const Field.pure(),
    this.status = SchoolStatus.initial,
    this.school = School.empty,
    this.schools = const <School>[],
    this.errorMessage,
  });
  final Field name;
  final Field location;
  final Field phoneNumber;
  final Field email;
  final SchoolStatus status;
  final School school;
  final List<School> schools;
  final String? errorMessage;

  SchoolState copyWith({
    Field? name,
    Field? location,
    Field? phoneNumber,
    Field? email,
    SchoolStatus? status,
    School? school,
    List<School>? schools,
    String? errorMessage,
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
    ];
  }
}
