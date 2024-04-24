import 'package:formz/formz.dart';

enum ListFieldError { empty }

class ListField extends FormzInput<List<String>, ListFieldError> {
  const ListField.pure() : super.pure(const []);
  const ListField.dirty(List<String> value) : super.dirty(value);

  @override
  ListFieldError? validator(List<String> value) {
    if (value.isEmpty) {
      return ListFieldError.empty;
    }
    return null;
  }
}
