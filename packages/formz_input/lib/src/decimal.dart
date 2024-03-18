import 'package:formz/formz.dart';

enum DecimalValidationError { invalid }

class Decimal extends FormzInput<String, DecimalValidationError> {
  const Decimal.pure() : super.pure('');
  const Decimal.dirty([String value = '']) : super.dirty(value);

  static final regExp = RegExp(r'^(?=\D*(?:\d\D*){1,12}$)\d+(?:\.\d{1,4})?$');

  @override
  DecimalValidationError? validator(String? value) {
    if (value == null) value = '0.0';
    if (value.isNotEmpty && regExp.hasMatch(value)) return null;
    return DecimalValidationError.invalid;
  }
}
