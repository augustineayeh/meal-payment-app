import 'package:errors/errors.dart';

/// {@template signup_exception}
///
/// {@endtemplate}
class SignupException implements AppException {
  /// Signup error message.
  final String errorMessage;

  /// {@macro signup_exception}
  const SignupException({
    required this.errorMessage,
  });
}
