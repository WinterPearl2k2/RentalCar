import 'package:dio/dio.dart';
import 'package:rental_car/data/data_sources/remote/dio/dio_interceptor.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();

  static ApiClient get instance => _instance;

  final baseUrl = "http://10.20.23.243:8080";

  //http://192.168.1.9:8080
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://172.24.128.1:4000",
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.add(DioInterceptor());
}
