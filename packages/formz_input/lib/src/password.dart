import 'package:formz/formz.dart';

enum PasswordValidationError {
  invalid,
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.dirty = '']) : super.dirty();

  // static final _passwordRegex =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');

  PasswordValidationError? validator(String? value) {
    if (value == null) value = '';
    if (value.length >= 3) return null;
    return PasswordValidationError.invalid;
    // return _passwordRegex.hasMatch(value ?? '')
    //     ? null
    //     : PasswordValidationError.invalid;
  }
}
