import 'package:equatable/equatable.dart';

/// {template user}
/// Represents an Authenticated user
/// {endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.bio,
    required this.avatar,
    required this.phone,
    required this.birthday,
    required this.city,
    required this.country,
    this.interests,
    this.languages,
    required this.created,
    required this.updated,
    //  required this.gender,
  });
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String bio;
  final String avatar;
  final String phone;
  final DateTime? birthday;
  final String city;
  final String country;
  final List<String>? interests;
  final List<String>? languages;
  final DateTime? created;
  final DateTime? updated;
  // final Gender gender;

  /// Represents an empty user. This is done so that
  /// null is not passed to the app. This can represent
  /// an unauthenticated user when `User.empty` is returned.
  static const empty = User(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    bio: '',
    avatar: '',
    phone: '',
    birthday: null,
    city: '',
    country: '',
    interests: [],
    languages: [],
    created: null,
    updated: null,
    // gender: Gender.none,
  );

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        bio,
        avatar,
        phone,
        birthday,
        city,
        country,
        interests,
        languages,
        created,
        updated,
        //     gender,
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
