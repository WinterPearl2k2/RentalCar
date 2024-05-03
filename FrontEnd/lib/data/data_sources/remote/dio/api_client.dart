import 'package:dio/dio.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();

  static ApiClient get instance => _instance;

  final baseUrl = "";

  final Dio dio = Dio(
    BaseOptions (
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    )
  );
}