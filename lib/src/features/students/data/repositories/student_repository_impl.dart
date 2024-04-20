import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';

import '../datasources/remote_data_source/remote_data_source.dart';

class StudentRepositoryImpl extends StudentRepository {
  StudentRepositoryImpl({required StudentRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final StudentRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<Student>>> fetchStudents() async {
    try {
      final remoteData = await _remoteDataSource.fetchStudents();

      return right(remoteData);
    } on ServerException catch (e) {
      return left(
        ServerFailure(errorMessage: e.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, Student>> fetchSingleStudent(String studentId) async {
    try {
      final remoteData = await _remoteDataSource.fetchSingleStudent(studentId);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
