// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Student extends Equatable {
  const Student({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.fingerPrint,
    required this.schoolId,
    required this.schoolName,
  });

  final String firstName;
  final String lastName;
  final String middleName;
  final String fingerPrint;
  final String schoolId;
  final String schoolName;

  static const empty = Student(
      firstName: '',
      lastName: '',
      middleName: '',
      fingerPrint: '',
      schoolId: '',
      schoolName: '');

  @override
  List<Object> get props {
    return [
      firstName,
      lastName,
      middleName,
      fingerPrint,
      schoolId,
      schoolName,
    ];
  }
}
