import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:formz_input/formz_input.dart';
import '../../data/models/student_model.dart';

import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';

part 'students_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit({
    required StudentRepository studentRepository,
  })  : _studentRepository = studentRepository,
        super(
          const StudentState(),
        );

  final StudentRepository _studentRepository;

  void fetchStudentsList() async {
    emit(
      state.copyWith(
        status: StudentStatus.loading,
      ),
    );

    final failureOrStudentsList = await _studentRepository.fetchStudents();

    failureOrStudentsList.fold(
      (failure) {
        emit(
          state.copyWith(
            status: StudentStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (studentsList) {
        emit(
          state.copyWith(
            status: StudentStatus.success,
            students: studentsList,
          ),
        );
      },
    );
  }

  void fetchSingleStudent(String studentId) async {
    emit(
      state.copyWith(
        status: StudentStatus.loading,
      ),
    );

    final failureOrStudent =
        await _studentRepository.fetchSingleStudent(studentId);

    failureOrStudent.fold(
      (failure) {
        emit(
          state.copyWith(
            status: StudentStatus.failure,
            errorMessage: failure.errorMessage,
          ),
        );
      },
      (student) {
        emit(
          state.copyWith(
            status: StudentStatus.success,
            student: student,
          ),
        );
      },
    );
  }

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
            // state.fingerPrint,
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
            // state.fingerPrint,
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
            // state.fingerPrint,
          ],
        ),
        formStatus: FormzSubmissionStatus.initial,
      ),
    );
  }

  void createStudent() async {
    final student = StudentModel(
      firstName: state.firstName.value,
      lastName: state.lastName.value,
      middleName: state.middleName.value,
      fingerPrint: '25635hdfndtm',
      schoolId: '93a940f2-12ce-4f94-92ed-4dab31c82e09',
      schoolName: '',
    );

    final failureOrSuccess =
        await _studentRepository.createStudent(student: student);
    failureOrSuccess.fold(
      (failure) {
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
}
