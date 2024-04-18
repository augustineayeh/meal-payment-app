import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/school.dart';
import '../../domain/repositories/school_repository.dart';
import '../datasources/remote_data_source/remote_data_source.dart';

class SchoolRepositoryImpl extends SchoolRepository {
  SchoolRepositoryImpl({required SchoolRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final SchoolRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<School>>> fetchSchools() async {
    try {
      final remoteData = await _remoteDataSource.fetchSchools();

      return right(remoteData);
    } on ServerException catch (e) {
      return left(
        ServerFailure(errorMessage: e.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, School>> fetchSingleSchool(String schoolId) async {
    try {
      final remoteData = await _remoteDataSource.fetchSingleSchool(schoolId);
      return right(remoteData);
    } on ServerException catch (e) {
      return left(ServerFailure(errorMessage: e.errorMessage));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
