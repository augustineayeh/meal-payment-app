import 'package:errors/errors.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/models/success.dart';
import '../../data/models/school_model.dart';

import '../entities/school.dart';

abstract class SchoolRepository {
  Future<Either<Failure, List<School>>> fetchSchools();
  Future<Either<Failure, School>> fetchSingleSchool(String schoolId);
   Future<Either<Failure, Success>> createSchool(
      {required SchoolModel school});
}
