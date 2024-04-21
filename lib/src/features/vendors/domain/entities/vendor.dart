// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Vendor extends Equatable {
  final String name;
  final String? id;
  final String? image;
  final String location;
  final String phoneNumber;
  final String school;
  const Vendor({
    required this.name,
    required this.location,
    required this.phoneNumber,
    this.id,
    this.image,
    required this.school,
  });

  @override
  List<Object?> get props => [
        name,
        id,
        image,
        location,
        phoneNumber,
        school,
      ];

  static const empty = Vendor(
    name: '',
    location: '',
    phoneNumber: '',
    school: '',
    id: '',
    image: '',
  );
}
