import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/models/success.dart';
import '../../data/models/student_model.dart';
import '../entities/student.dart';

abstract class StudentRepository {
  Future<Either<Failure, List<Student>>> fetchStudents();
  Future<Either<Failure, Student>> fetchSingleStudent(String studentId);
    Future<Either<Failure, Success>> createStudent(
      {required StudentModel student});
}
