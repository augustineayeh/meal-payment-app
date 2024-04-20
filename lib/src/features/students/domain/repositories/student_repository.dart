import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../entities/student.dart';

abstract class StudentRepository {
  Future<Either<Failure, List<Student>>> fetchStudents();
  Future<Either<Failure, Student>> fetchSingleStudent(String studentId);
}
