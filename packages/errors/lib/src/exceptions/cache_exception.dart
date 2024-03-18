import 'package:errors/errors.dart';

/// {@template cache_exception}
///
/// {@endtemplate}
class CacheException implements AppException {
  /// Cache error message.
  final String errorMessage;

  /// {@macro cache_exception}
  const CacheException({
    required this.errorMessage,
  });
}
