import 'dart:convert';

import 'package:errors/errors.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/models/success.dart';
import '../models/menu_model.dart';
import 'menu_remote_data_source.dart';

class MenuRemoteDataSourceImpl extends MenuRemoteDataSource {
  MenuRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;
  @override
  Future<List<MenuModel>> fetchMenus() async {
    try {
      final response = await _apiClient.get(endpoint: ApiConstants.menus);
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      final menus = responseBody['results'] as List<dynamic>;

      return menus.map((e) => MenuModel.fromJson(e)).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<MenuModel> fetchSingleMenu(String menuId) async {
    try {
      final response = await _apiClient.get(
        endpoint: '${ApiConstants.menus}$menuId',
      );

      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      return MenuModel.fromJson(responseBody);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  @override
  Future<Success> createMenu({required MenuModel menu}) async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiConstants.menus,
        model: menu,
      );

      return Success.instance;
    } on ServerException catch (e) {
      throw ServerException(errorMessage: e.toString());
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}
