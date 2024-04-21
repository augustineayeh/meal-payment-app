import 'dart:convert';

import 'package:errors/errors.dart';
import '../../../../../core/models/success.dart';
import '../../models/order_model.dart';

import '../../../../../core/api/api_client.dart';
import '../../../../../core/api/api_constants.dart';
import 'remote_data_source.dart';

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  OrderRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;
  @override
  Future<List<OrderModel>> fetchOrders() async {
    try {
      final response = await _apiClient.get(endpoint: ApiConstants.orders);
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      final orders = responseBody['results'] as List<dynamic>;

      return orders.map((e) => OrderModel.fromJson(e)).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<Success> createOrder({required OrderModel order}) async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiConstants.orders,
        model: order,
      );

      return Success.instance;
    } on ServerException catch (e) {
      throw ServerException(errorMessage: e.toString());
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  @override
  Future<OrderModel> fetchSingleOrder(String orderId) async {
    try {
      final response = await _apiClient.get(
        endpoint: '${ApiConstants.orders}$orderId',
      );

      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      return OrderModel.fromJson(responseBody);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}
