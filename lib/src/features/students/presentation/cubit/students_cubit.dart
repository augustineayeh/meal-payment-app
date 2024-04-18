import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  StudentsCubit() : super(StudentsInitial());
}
