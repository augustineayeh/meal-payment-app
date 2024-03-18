import 'package:errors/errors.dart';

/// {@template login_exception}
///
/// {@endtemplate}
class LoginException implements AppException {
  /// Login error message.
  final String errorMessage;

  /// {@macro login_exception}
  const LoginException({
    required this.errorMessage,
  });
}
