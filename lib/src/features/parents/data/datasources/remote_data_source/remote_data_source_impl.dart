import 'dart:convert';

import 'package:errors/errors.dart';
import '../../../../../core/models/success.dart';

import '../../../../../core/api/api_client.dart';
import '../../../../../core/api/api_constants.dart';
import '../../models/parent_model.dart';
import 'remote_data_source.dart';

class ParentRemoteDataSourceImpl extends ParentRemoteDataSource {
  ParentRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;
  @override
  Future<List<ParentModel>> fetchParents() async {
    try {
      final response = await _apiClient.get(endpoint: ApiConstants.parents);
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      final parents = responseBody['results'] as List<dynamic>;

      return parents.map((e) => ParentModel.fromJson(e)).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<Success> createParent({required ParentModel parent}) async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiConstants.parents,
        model: parent,
      );

      return Success.instance;
    } on ServerException catch (e) {
      throw ServerException(errorMessage: e.toString());
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  @override
  Future<ParentModel> fetchSingleParent(String parentId) async {
    try {
      final response = await _apiClient.get(
        endpoint: '${ApiConstants.parents}$parentId',
      );

      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      return ParentModel.fromJson(responseBody);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}
