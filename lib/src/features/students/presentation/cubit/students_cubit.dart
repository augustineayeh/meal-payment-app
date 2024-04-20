import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz_input/formz_input.dart';
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
}
