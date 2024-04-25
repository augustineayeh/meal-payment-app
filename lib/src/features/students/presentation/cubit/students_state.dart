// ignore_for_file: public_member_api_docs, sort_constructors_first






part of 'students_cubit.dart';

enum StudentStatus { initial, loading, success, failure }

class StudentState extends Equatable {
  const StudentState({
    this.firstName = const Field.pure(),
    this.lastName = const Field.pure(),
    this.middleName = const Field.pure(),
    this.fullName = const Field.pure(),
     this.fingerPrint = const Field.pure(),
    this.status = StudentStatus.initial,
    this.schoolName = const Field.pure(),
    this.schoolId = const Field.pure(),
    this.student = Student.empty,
    this.students = const <Student>[],
    this.errorMessage,
     this.formStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
  });

  final Field firstName;
  final Field lastName;
  final Field middleName;
  final Field fullName;
   final Field fingerPrint;
  final Field schoolName;
  final Field schoolId;
  final StudentStatus status;
  final Student student;
  final List<Student> students;
    final FormzSubmissionStatus formStatus;
  final bool isValid;
  final String? errorMessage;

  StudentState copyWith({
    Field? firstName,
    Field? lastName,
    Field? middleName,
    Field? fullName,
    Field? fingerPrint,
    Field? schoolName,
    Field? schoolId,
    StudentStatus? status,
    Student? student,
    List<Student>? students,
    FormzSubmissionStatus? formStatus,
    bool? isValid,
    String? errorMessage,
  }) {
    return StudentState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      fullName: fullName ?? this.fullName,
      fingerPrint: fingerPrint ?? this.fingerPrint,
      schoolName: schoolName ?? this.schoolName,
      schoolId: schoolId ?? this.schoolId,
      status: status ?? this.status,
      student: student ?? this.student,
      students: students ?? this.students,
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      middleName,
      fullName,
      fingerPrint,
      schoolName,
      schoolId,
      status,
      student,
      students,
      formStatus,
      isValid,
      errorMessage,
    ];
  }
}
