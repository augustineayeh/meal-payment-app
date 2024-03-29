// ignore_for_file: overridden_fields

import 'package:errors/src/errors.dart';

/// {@template cache_failure}
/// Failure which occurs when [CacheException] is thrown
/// {@endtemplate}
class CacheFailure extends Failure {
  /// {@macro cache_failure}
  const CacheFailure({
    required this.errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );
  @override
  final String errorMessage;

  @override
  List<Object> get props => [
        errorMessage,
      ];
}
