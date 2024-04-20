import 'dart:convert';

import 'package:errors/errors.dart';
import 'package:meal_payment_app/src/core/api/api_client.dart';
import 'package:meal_payment_app/src/core/api/api_constants.dart';
import 'package:meal_payment_app/src/features/vendors/data/datasources/remote_data_source/remote_data_source.dart';
import 'package:meal_payment_app/src/features/vendors/data/models/vendor_model.dart';

class VendorRemoteDataSourceImpl extends VendorRemoteDataSource {
  VendorRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;
  @override
  Future<List<VendorModel>> fetchVendors() async {
    try {
      final response = await _apiClient.get(endpoint: ApiConstants.vendors);
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      final vendors = responseBody['results'] as List<dynamic>;

      return vendors.map((e) => VendorModel.fromJson(e)).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<VendorModel> fetchSingleVendor(String vendorId) async {
    try {
      final response = await _apiClient.get(
        endpoint: '${ApiConstants.vendors}$vendorId',
      );

      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      return VendorModel.fromJson(responseBody);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}