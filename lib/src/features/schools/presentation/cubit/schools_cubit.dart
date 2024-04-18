import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz_input/formz_input.dart';

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
