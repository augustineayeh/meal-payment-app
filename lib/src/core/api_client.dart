import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:errors/errors.dart';
import 'package:http/http.dart';
import 'package:secure_storage_repository/storage_repository.dart';




class ApiClient {
  ApiClient({
    required Client client,
    required SecureStorageRepository secureStorageRepository,
  })  : _client = client,
        _secureStorageRepository = secureStorageRepository;
  final Client _client;
  final SecureStorageRepository _secureStorageRepository;

  final baseUrl = '';

  Future<Map<String, String>> _getHeaders() async {
    return {
      'Content-Type': 'application/json',
    };
  }

  Future<Map<String, String>> _getHeadersWithToken() async {
    final token = await _secureStorageRepository.read(
      key: 'token',
    );
    print('TOKEN=====> $token');
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> get({
    required String endpoint,
    String path = '',
  }) async {
    return _sendRequest(() async {
      final Map<String, String> headers = await _getHeadersWithToken();
      final uri = Uri.parse('$baseUrl$endpoint$path');
      print('$baseUrl$endpoint');
      final response = await _client.get(uri, headers: headers);
      return response;
    });
  }

  Future<Response> post({
    required String endpoint,
    required dynamic model,
  }) async {
    return _sendRequest(() async {
      final headers = await _getHeadersWithToken();
      final uri = Uri.parse('$baseUrl$endpoint');
      print('$baseUrl$endpoint');
      
      
      
      
      final response = await _client
          .post(
            uri,
            headers: headers,
            body: json.encode(
              model.toJson(),
            ),
          )
          .timeout(const Duration(seconds: 45));
      return response;
    });
  }

  Future<Response> patch({
    required String endpoint,
    String path = '',
    required dynamic model,
  }) async {
    return _sendRequest(() async {
      final Map<String, String> headers = await _getHeadersWithToken();
      final uri = Uri.parse('$baseUrl$endpoint$path');
      print('$baseUrl$endpoint');
      final response = await _client.patch(
        uri,
        headers: headers,
        body: json.encode(
          await model.toJson(),
        ),
      );
      return response;
    });
  }

  Future<Response> postAuth({
    required String endpoint,
    required dynamic model,
  }) async {
    return _sendRequest(() async {
      final headers = await _getHeaders();
      final uri = Uri.parse('$baseUrl$endpoint');
      
      
      final toJson = await model.toJson();
      

      final response = await _client
          .post(
            uri,
            headers: headers,
            body: json.encode(
              model.toJson(),
            ),
          )
          .timeout(const Duration(seconds: 45));
      final token = response.headers['authorization'];
      _secureStorageRepository.write(key: 'token', value: token);
      return response;
    });
  }

  Future<Response> update({
    String? endpoint,
    dynamic model,
    String? id,
  }) async {
    return _sendRequest(() async {
      final Map<String, dynamic> headers = await _getHeadersWithToken();
      final uri = Uri.parse('$baseUrl$endpoint$id');
      print('$baseUrl$endpoint\n');
      
      
      
      final response = await _client
          .put(
            uri,
            headers: headers as Map<String, String>?,
            body: json.encode(model.toJson()),
          )
          .timeout(const Duration(seconds: 45));
      return response;
    });
  }

  Future<Response> delete({
    required String endpoint,
    dynamic id,
  }) async {
    return _sendRequest(() async {
      final Map<String, dynamic> headers = await _getHeadersWithToken();
      final uri = Uri.parse('$baseUrl$endpoint$id');
      print('$baseUrl$endpoint\n');
      final response = await _client
          .delete(
            uri,
            headers: headers as Map<String, String>?,
          )
          .timeout(const Duration(seconds: 45));
      return response;
    });
  }

  Future<Response> _sendRequest(
    Future<Response> Function() callServer,
  ) async {
    try {
      final response = await callServer();
      if (response.statusCode != 200 && response.statusCode != 201) {
        if (response.body.contains('Invalid token')) {
          _secureStorageRepository.deleteAll();
        }
        throw ServerException(
          errorMessage: response.body,
        );
      }

      return response;
    } on TimeoutException {
      throw ServerException(errorMessage: 'Timeout making request to server');
    } on SocketException {
      throw const ServerException(errorMessage: 'No internet');
    } on ServerException catch (e) {
      print(e);
      throw ServerException(errorMessage: e.errorMessage);
    } catch (e) {
      throw const ServerException(errorMessage: 'Unknown Error');
    }
  }
}
