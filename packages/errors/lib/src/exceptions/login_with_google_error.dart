import 'package:errors/errors.dart';

class LoginWithGoogleError extends AppException {
  LoginWithGoogleError({
    this.errorMessage = 'Unknown Error',
    this.code = 'Unknown Code',
  }) : super(errorMessage: errorMessage);
  final String errorMessage;
  final String code;

  factory LoginWithGoogleError.fromCode(String code) {
    return switch (code) {
      'account-exists-with-different-credential' => LoginWithGoogleError(
          errorMessage: 'Account exists with different credentials.',
        ),
      'invalid-credential' => LoginWithGoogleError(
          errorMessage: 'The credential received is malformed or has expired.',
        ),
      'ERROR_OPERATION_NOT_ALLOWED' => LoginWithGoogleError(
          errorMessage:
              'Operation is not allowed. Please contact customer support',
        ),
      'ERROR_USER_DISABLE' => LoginWithGoogleError(
          errorMessage:
              'This user has been disabled. Please contact customer support ' +
                  'for help',
        ),
      'ERROR_USER_NOT_FOUND' => LoginWithGoogleError(
          errorMessage: 'Email is not found, please create an account.',
        ),
      'wrong-password' => LoginWithGoogleError(
          errorMessage: 'Incorrect password, please try again',
        ),
      'invalid-verification-code' => LoginWithGoogleError(
          errorMessage: 'The credential verification code received is invalid.',
        ),
      'invalid-verification-id' => LoginWithGoogleError(
          errorMessage: 'The credential verification ID received is invalid.',
        ),
      _ => LoginWithGoogleError(),
    };
  }
}
