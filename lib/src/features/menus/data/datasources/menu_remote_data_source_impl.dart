import 'dart:convert';

import 'package:errors/errors.dart';
import 'package:meal_payment_app/src/core/api/api_client.dart';
import 'package:meal_payment_app/src/core/api/api_constants.dart';
import 'package:meal_payment_app/src/features/menus/data/datasources/menu_remote_data_source.dart';
import 'package:meal_payment_app/src/features/menus/data/models/menu_model.dart';

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
}
