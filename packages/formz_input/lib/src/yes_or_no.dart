import 'package:formz/formz.dart';

enum YesOrNoValidationError { invalid }

class YesOrNo extends FormzInput<String, YesOrNoValidationError> {
  const YesOrNo.pure() : super.pure('');
  const YesOrNo.dirty([String value = '']) : super.dirty(value);

  // static final regExp = RegExp(r'/^\s*(?:\d\s*){n}$/');

  @override
  YesOrNoValidationError? validator(String? value) {
    if (value == null) value = '';
    if (value.isNotEmpty && value == 'Yes' || value == 'No') return null;
    return YesOrNoValidationError.invalid;
  }
}
