import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/school.dart';

abstract class SchoolRepository {
  Future<Either<Failure, List<School>>> fetchSchools();
  Future<Either<Failure, School>> fetchSingleSchool(String schoolId);
}
