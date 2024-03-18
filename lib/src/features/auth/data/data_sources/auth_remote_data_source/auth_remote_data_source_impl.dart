import 'dart:convert';

import 'package:errors/errors.dart';

import '../../../../../core/api/api_client.dart';
import '../../data.dart';

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<UserModel> login(LoginModel login) async {
    try {
      final response =
          await _apiClient.postAuth(endpoint: '/users/sign-in', model: login);

      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      return UserModel.fromJson(responseBody);
    } on ServerException catch (e) {
      throw ServerException(errorMessage: e.errorMessage);
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  //! refactor
  @override
  Future<UserModel> signup(SignupModel signup) async {
    try {
      final response =
          await _apiClient.postAuth(endpoint: '/users/sign-up', model: signup);
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      return UserModel.fromJson(responseBody);
    } on ServerException catch (e) {
      throw ServerException(errorMessage: e.errorMessage);
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
    
    } catch (e) {
      throw LogoutException(errorMessage: e.toString());
    }
  }
}
