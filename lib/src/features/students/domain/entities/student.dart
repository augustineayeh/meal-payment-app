// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Student extends Equatable {
  const Student({
    this.firstName,
    this.id,
    this.lastName,
    this.middleName,
    this.fingerPrint,
    this.schoolId,
    this.schoolName,
  });

  final String? firstName;
  final String? id;
  final String? lastName;
  final String? middleName;
  final String? fingerPrint;
  final String? schoolId;
  final String? schoolName;

  static const empty = Student(
    firstName: '',
    lastName: '',
    middleName: '',
    fingerPrint: '',
    schoolId: '',
    schoolName: '',
    id: '',
  );

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      middleName,
      fingerPrint,
      schoolId,
      schoolName,
    ];
  }
}
