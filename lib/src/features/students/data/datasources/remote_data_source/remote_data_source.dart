import '../../../../schools/data/models/school_model.dart';
import '../../models/student_model.dart';

abstract class StudentRemoteDataSource {
  Future<List<StudentModel>> fetchStudents();
  Future<StudentModel> fetchSingleStudent(studentId);
}
