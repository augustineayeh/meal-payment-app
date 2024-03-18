import 'package:equatable/equatable.dart';

/// {@template signup}
/// Class which represents a user signing up
/// {@endtemplate}
class Signup extends Equatable {
  /// {@macro signup}
  const Signup({
    required this.firstName,
    this.lastName,
    required this.email,
    required this.password,
  });

  final String firstName;
  final String? lastName;
  final String email;
  final String password;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
      ];
}
