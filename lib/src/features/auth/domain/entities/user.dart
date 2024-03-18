import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.created,
    required this.updated,
  });
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  final String phone;

  final DateTime? created;
  final DateTime? updated;

  static const empty = User(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    created: null,
    updated: null,
  );

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        created,
        updated,
      ];
}

enum Gender {
  none,
  male,
  female,
  nonBinary,
  transgender,
  genderqueer,
  agender,
  twoSpirit,
  bigender,
  other,
  preferNotToSay,
}
