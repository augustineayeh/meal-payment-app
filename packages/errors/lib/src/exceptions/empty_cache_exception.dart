import 'package:errors/errors.dart';

/// {@template cache_exception}
///
/// {@endtemplate}
class EmptyCacheException implements AppException {
  /// Cache error message.
  final String errorMessage;

  /// {@macro cache_exception}
  const EmptyCacheException({
    required this.errorMessage,
  });
}
