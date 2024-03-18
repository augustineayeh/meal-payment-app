import 'package:equatable/equatable.dart';

/// {@template login}
/// Represents a User who wants to login
/// {@endtemplate}
class Login extends Equatable {
  /// {@macro login}
  const Login({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  @override
  List<Object> get props => [
        email,
        password,
      ];
}
