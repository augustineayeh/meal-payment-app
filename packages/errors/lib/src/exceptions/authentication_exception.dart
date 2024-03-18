import 'package:errors/errors.dart';

/// {@template cache_exception}
///
/// {@endtemplate}
class AuthenticationException implements AppException {
  /// Cache error message.
  final String errorMessage;

  /// {@macro cache_exception}
  const AuthenticationException({
    required this.errorMessage,
  });
}
