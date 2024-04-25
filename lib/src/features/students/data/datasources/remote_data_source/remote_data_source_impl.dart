// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:errors/errors.dart';
import 'package:meal_payment_app/src/core/api/api_client.dart';
import 'package:meal_payment_app/src/core/api/api_constants.dart';
import 'package:meal_payment_app/src/core/models/success.dart';
import 'package:meal_payment_app/src/features/students/data/datasources/remote_data_source/remote_data_source.dart';
import 'package:meal_payment_app/src/features/students/data/models/student_model.dart';

class StudentRemoteDataSourceImpl extends StudentRemoteDataSource {
  final ApiClient _apiClient;
  StudentRemoteDataSourceImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<List<StudentModel>> fetchStudents() async {
    try {
      final response = await _apiClient.get(endpoint: ApiConstants.students);

      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      final students = responseBody['results'] as List<dynamic>;

      return students.map((e) => StudentModel.fromJson(e)).toList();
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  @override
  Future<StudentModel> fetchSingleStudent(studentId) async {
    try {
      final response = await _apiClient.get(endpoint: ApiConstants.students);
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;

      return StudentModel.fromJson(responseBody);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }

  @override
  Future<Success> createStudent({required StudentModel student}) async {
    try {
      final response = await _apiClient.post(
        endpoint: ApiConstants.students,
        model: student,
      );

      return Success.instance;
    } on ServerException catch (e) {
      throw ServerException(errorMessage: e.toString());
    } catch (e) {
      throw ServerException(errorMessage: e.toString());
    }
  }
}
