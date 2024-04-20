import '../../models/student_model.dart';

abstract class StudentRemoteDataSource {
  Future<List<StudentModel>> fetchStudents();
  Future<StudentModel> fetchSingleStudent(studentId);
}
