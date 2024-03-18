
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import 'package:meal_payment_app/src/features/auth/domain/domain.dart';
import 'package:meal_payment_app/src/features/auth/domain/repository/repository.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void onEmailInput(String emailString) {
    final email = Email.dirty(emailString);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [
            email,
            state.password,
          ],
        ),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onPasswordInput(String passwordString) {
    final password = Password.dirty(passwordString);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate(
          [
            state.email,
            password,
          ],
        ),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> onLoginPressed() async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final eitherFailureOrUser = await _authenticationRepository.login(
      Login(
        email: state.email.value,
        password: state.password.value,
      ),
    );
    eitherFailureOrUser.fold((failure) {
      emit(
        state.copyWith(
          errorMessage: failure.errorMessage,
          status: FormzSubmissionStatus.failure,
        ),
      );
    }, (user) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
        ),
      );
    });
  }

}
