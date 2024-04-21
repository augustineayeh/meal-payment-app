import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import '../../data/models/school_model.dart';

import '../../domain/entities/school.dart';
import '../../domain/repositories/school_repository.dart';

part 'schools_state.dart';

class SchoolCubit extends Cubit<SchoolState> {
  SchoolCubit({
    required SchoolRepository schoolRepository,
  })  : _schoolRepository = schoolRepository,
        super(
          const SchoolState(),
        );

  final SchoolRepository _schoolRepository;

  void onNameChanged(String nameInput) {
    final name = Field.dirty(nameInput);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate(
          [
            name,
            state.location,
            state.phoneNumber,
            state.email,
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
            state.name,
            location,
            state.phoneNumber,
            state.email,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onPhoneNumberChanged(String phoneNumberInput) {
    final phoneNumber = Field.dirty(phoneNumberInput);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        isValid: Formz.validate(
          [
            state.name,
            state.location,
            phoneNumber,
            state.email,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void onEmailChanged(String emailInput) {
    final email = Email.dirty(emailInput);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate(
          [
            state.name,
            state.location,
            state.phoneNumber,
            email,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void createSchool() async {
    final school = SchoolModel(
      name: state.name.value,
      location: state.location.value,
      phoneNumber: state.phoneNumber.value,
      email: state.email.value,
      // image: state.image.value,
    );
    // print(school.toJson());

    final failureOrSuccess =
        await _schoolRepository.createSchool(school: school);
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

  void fetchSchoolsList() async {
    emit(
      state.copyWith(
        status: SchoolStatus.loading,
      ),
    );

    final failureOrSchoolsList = await _schoolRepository.fetchSchools();

    failureOrSchoolsList.fold(
      (failure) {
        emit(
          state.copyWith(
            status: SchoolStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (schoolsList) {
        emit(
          state.copyWith(
            status: SchoolStatus.success,
            schools: schoolsList,
          ),
        );
      },
    );
  }

  void fetchSingleSchool(String schoolId) async {
    emit(
      state.copyWith(
        status: SchoolStatus.loading,
      ),
    );

    final failureOrSchool = await _schoolRepository.fetchSingleSchool(schoolId);

    failureOrSchool.fold(
      (failure) {
        emit(
          state.copyWith(
            status: SchoolStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (school) {
        emit(
          state.copyWith(
            status: SchoolStatus.success,
            school: school,
          ),
        );
      },
    );
  }
}
