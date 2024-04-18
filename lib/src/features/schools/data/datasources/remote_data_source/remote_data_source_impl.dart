import 'dart:convert';

import 'package:errors/errors.dart';
import '../../../../../core/api/api_client.dart';
import '../../../../../core/api/api_constants.dart';
import 'remote_data_source.dart';
import '../../models/school_model.dart';

class SchoolRemoteDataSourceImpl extends SchoolRemoteDataSource {
  SchoolRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;
  @override
  Future<List<SchoolModel>> fetchSchools() async {
    try {
      final response = await _apiClient.get(endpoint: ApiConstants.schools);
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      final schools = responseBody['results'] as List<dynamic>;

      return schools.map((e) => SchoolModel.fromJson(e)).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<SchoolModel> fetchSingleSchool(String schoolId) async {
    try {
      final response = await _apiClient.get(
        endpoint: '${ApiConstants.schools}$schoolId',
      );

      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      return SchoolModel.fromJson(responseBody);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}
