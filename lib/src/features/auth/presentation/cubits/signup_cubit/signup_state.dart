part of 'signup_cubit.dart';

class SignupState extends Equatable {
  const SignupState({
    this.firstName = const Field.pure(),
    this.lastName = const Field.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final Field firstName;
  final Field lastName;
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  SignupState copyWith({
    Field? firstName,
    Field? lastName,
    Email? email,
    PhoneNumber? phoneNumber,
    Password? password,
    ConfirmPassword? confirmPassword,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
        status,
        isValid,
        errorMessage,
      ];
}
