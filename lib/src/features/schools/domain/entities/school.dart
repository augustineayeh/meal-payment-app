// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class School extends Equatable {
  const School({
    this.id,
    required this.name,
    required this.location,
    required this.phoneNumber,
     this.email,
    this.image,
  });
  final String? id;
  final String name;
  final String location;
  final String phoneNumber;
  final String? email;
  final String? image;

  static const empty = School(
    id: '',
    name: '',
    location: '',
    phoneNumber: '',
    email: '',
    image: '',
  );

  @override
  List<Object?> get props => [
        name,
        location,
        phoneNumber,
        email,
        image,
      ];
}
