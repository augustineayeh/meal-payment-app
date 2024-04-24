// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'parents_cubit.dart';

enum ParentStatus { initial, loading, success, failure }

class ParentState extends Equatable {
  const ParentState({
    this.firstName = const Field.pure(),
    this.lastName = const Field.pure(),
    this.middleName = const Field.pure(),
    this.fullName = const Field.pure(),
    this.location = const Field.pure(),
    // this.phoneNumber = const Field.pure(),
    // this.email = const Email.pure(),
    this.status = ParentStatus.initial,
    this.parent = Parent.empty,
    this.parents = const <Parent>[],
    this.wards = const <String>[],
    this.formStatus = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });
  final Field firstName;
  final Field lastName;
  final Field middleName;
  final Field fullName;
  final Field location;
  final List<String> wards;

  // final Field phoneNumber;
  // final Email email;
  final ParentStatus status;
  final Parent parent;
  final List<Parent> parents;
  final String? errorMessage;
  final FormzSubmissionStatus formStatus;
  final bool isValid;

  ParentState copyWith({
    Field? firstName,
    Field? lastName,
    Field? middleName,
    Field? fullName,
    Field? location,
    List<String>? wards,
    ParentStatus? status,
    Parent? parent,
    List<Parent>? parents,
    String? errorMessage,
    FormzSubmissionStatus? formStatus,
    bool? isValid,
  }) {
    return ParentState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      fullName: fullName ?? this.fullName,
      location: location ?? this.location,
      wards: wards ?? this.wards,
      status: status ?? this.status,
      parent: parent ?? this.parent,
      parents: parents ?? this.parents,
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      middleName,
      fullName,
      location,
      wards,
      status,
      parent,
      parents,
      errorMessage,
      formStatus,
      isValid,
    ];
  }
}
