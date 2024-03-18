
import 'package:errors/errors.dart';

/// {@template login_exception}
///
/// {@endtemplate}
class LogoutException implements AppException {
  /// Logout error message.
  final String errorMessage;

  /// {@macro login_exception}
  const LogoutException({
    required this.errorMessage,
  });
}
