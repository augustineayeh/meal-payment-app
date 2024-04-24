import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';

import '../../data/models/parent_model.dart';
import '../../domain/entities/parent.dart';
import '../../domain/repositories/parent_repository.dart';

part 'parents_state.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit({
    required ParentRepository parentRepository,
  })  : _parentRepository = parentRepository,
        super(
          const ParentState(),
        );

  final ParentRepository _parentRepository;

  void onFirstNameChanged(String firstNameInput) {
    final firstName = Field.dirty(firstNameInput);
    emit(
      state.copyWith(
        firstName: firstName,
        isValid: Formz.validate(
          [
            firstName,
            state.lastName,
            state.middleName,
            // state.wards,
            state.location,

            // state.phoneNumber,
            // state.email,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onLastNameChanged(String lastNameInput) {
    final lastName = Field.dirty(lastNameInput);
    emit(
      state.copyWith(
        lastName: lastName,
        isValid: Formz.validate(
          [
            state.firstName,
            lastName,
            state.middleName,
            // state.wards,
            state.location,

            // state.phoneNumber,
            // state.email,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onMiddleNameChanged(String middleNameInput) {
    final middleName = Field.dirty(middleNameInput);
    emit(
      state.copyWith(
        middleName: middleName,
        isValid: Formz.validate(
          [
            state.firstName,
            state.lastName,
            middleName,
            // state.wards,
            state.location,

            // state.phoneNumber,
            // state.email,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onLocationChanged(String locationInput) {
    final location = Field.dirty(locationInput);
    emit(
      state.copyWith(
        location: location,
        isValid: Formz.validate(
          [
            state.firstName,
            state.lastName,
            state.middleName,
            // state.wards,
            location,

            // state.phoneNumber,
            // state.email,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  // void onWardsChanged(String WardsInput) {
  //   final wards = Field.dirty(WardsInput);
  //   emit(
  //     state.copyWith(
  //       wards: wards,
  //       isValid: Formz.validate(
  //         [
  //           state.firstName,
  //           state.lastName,
  //           state.middleName,
  //           // state.wards,
  //           state.location,

  //           // state.phoneNumber,
  //           // state.email,
  //         ],
  //       ),
  //       formStatus: FormzSubmissionStatus.initial,
  //     ),
  //   );
  // }

  void createParent() async {
    emit(
      state.copyWith(
        status: ParentStatus.loading,
      ),
    );

    final parent = ParentModel(
      firstName: state.firstName.value,
      lastName: state.lastName.value,
      middleName: state.middleName.value,
      fullName:
          state.firstName.value + state.middleName.value + state.lastName.value,
      location: state.location.value,
      wards: const ['136cc3ec-92cf-4281-829a-c3880cf8db85'],
    );

    final failureOrSuccess =
        await _parentRepository.createParent(parent: parent);
    failureOrSuccess.fold(
      (failure) {
        // print('ERROR ${failure.errorMessage}');
        emit(
          state.copyWith(
            formStatus: FormzSubmissionStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (success) => emit(
        state.copyWith(
          formStatus: FormzSubmissionStatus.success,
        ),
      ),
    );
  }

  void fetchParentsList() async {
    emit(
      state.copyWith(
        status: ParentStatus.loading,
      ),
    );

    final failureOrParentsList = await _parentRepository.fetchParents();

    failureOrParentsList.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ParentStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (parentsList) {
        emit(
          state.copyWith(
            status: ParentStatus.success,
            parents: parentsList,
          ),
        );
      },
    );
  }

  void fetchSingleParent(String parentId) async {
    emit(
      state.copyWith(
        status: ParentStatus.loading,
      ),
    );

    final failureOrParent = await _parentRepository.fetchSingleParent(parentId);

    failureOrParent.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ParentStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (parent) {
        emit(
          state.copyWith(
            status: ParentStatus.success,
            parent: parent,
          ),
        );
      },
    );
  }
}
