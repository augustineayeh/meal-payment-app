import '../../../../../core/models/success.dart';

import '../../models/school_model.dart';

abstract class SchoolRemoteDataSource {
  Future<List<SchoolModel>> fetchSchools();
  Future<SchoolModel> fetchSingleSchool(String schoolId);
  Future<Success> createSchool({required SchoolModel school});
}
