import 'package:equatable/equatable.dart';




class Signup extends Equatable {
  
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
