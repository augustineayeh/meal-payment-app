
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import 'package:meal_payment_app/src/features/auth/domain/domain.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const SignupState());

  final AuthenticationRepository _authenticationRepository;

  void onFirstNameInput(String firstNameString) {
    final firstName = Field.dirty(firstNameString);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate([
          firstName,
          state.lastName,
          state.email,
          state.password,
          state.confirmPassword,
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onLastNameInput(String lastNameString) {
    final lastName = Field.dirty(lastNameString);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate([
          state.firstName,
          state.email,
          state.password,
          state.confirmPassword,
        ]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onEmailInput(String emailString) {
    final email = Email.dirty(emailString);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [
            email,
            state.firstName,
            state.lastName,
            state.password,
            state.confirmPassword,
          ],
        ),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onPhoneNumberInput(String phoneNumberString) {
    final phoneNumber = PhoneNumber.dirty(phoneNumberString);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        isValid: Formz.validate(
          [
            phoneNumber,
            state.firstName,
            state.lastName,
            state.email,
            state.password,
            state.confirmPassword,
          ],
        ),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onPasswordInput(String passwordString) {
    final password = Password.dirty(passwordString);
    final confirmPassword = ConfirmPassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmPassword: confirmPassword,
        isValid: Formz.validate(
          [
            password,
            confirmPassword,
            state.firstName,
            state.lastName,
            state.email,
          ],
        ),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onConfirmPasswordInput(String confirmPasswordString) {
    final confirmPassword = ConfirmPassword.dirty(
      password: state.password.value,
      value: confirmPasswordString,
    );
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
        isValid: Formz.validate(
          [
            confirmPassword,
            state.firstName,
            state.lastName,
            state.email,
            state.password,
          ],
        ),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> onSignupPressed() async {
    if (!state.isValid) return;
    emit(
      state.copyWith(status: FormzSubmissionStatus.inProgress),
    );
    final eitherFailureOrUser = await _authenticationRepository.signup(
      Signup(
        email: state.email.value,
        password: state.confirmPassword.value,
        firstName: state.firstName.value,
        lastName: state.lastName.value,
      ),
    );
    eitherFailureOrUser.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: failure.errorMessage,
        ),
      ),
      (user) => emit(
        state.copyWith(status: FormzSubmissionStatus.success),
      ),
    );
  }

 
}
