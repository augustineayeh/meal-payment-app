import 'package:equatable/equatable.dart';

class Parent extends Equatable {
  final String? id;
  final String firstName;
  final String lastName;
  final String middleName;
  final String fullName;
  final String location;
  final List<String> wards;

  const Parent({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.fullName,
    required this.location,
    required this.wards,
  });

  static const empty = Parent(
    firstName: '',
    lastName: '',
    middleName: '',
    fullName: '',
    location: '',
    wards: [],
  );

  @override
  List<Object?> get props =>
      [id, firstName, lastName, middleName, fullName, location, wards];
}
