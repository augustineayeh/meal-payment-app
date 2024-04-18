// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class School extends Equatable {
  const School({
    required this.name,
    required this.location,
    required this.phoneNumber,
    required this.email,
  });

  final String name;
  final String location;
  final String phoneNumber;
  final String email;

  static const empty = School(
    name: '',
    location: '',
    phoneNumber: '',
    email: '',
  );

  @override
  List<Object> get props => [name, location, phoneNumber, email];
}
