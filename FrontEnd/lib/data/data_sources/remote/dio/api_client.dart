import 'package:dio/dio.dart';
import 'package:rental_car/data/data_sources/remote/dio/dio_interceptor.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();

  static ApiClient get instance => _instance;
  final token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiIyOTBhOTJmMy05NGYwLTQ5NDAtOTY1Ni0wZGFmOTVjNDI0NzAiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxNzM4NTEwOSwiZXhwIjoxNzE3OTg5OTA5fQ.cNzSV7KP1J7YrAGrkeJR4uq-QwgskfX4psYFWCI3aD8";
  final baseUrl = "http://10.20.23.243:8080";

  //http://192.168.1.9:8080
  //http://10.20.23.243:8080
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://1vp996ng-4000.asse.devtunnels.ms",
      // baseUrl: "https://55slkn6k-4534.asse.devtunnels.ms",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  )..interceptors.add(DioInterceptor());

  final Dio dioMapbox = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
  final dioCalling = Dio(
    BaseOptions(
      headers: {
        'Authorization':
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiIyOTBhOTJmMy05NGYwLTQ5NDAtOTY1Ni0wZGFmOTVjNDI0NzAiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxNzM4NTEwOSwiZXhwIjoxNzE3OTg5OTA5fQ.cNzSV7KP1J7YrAGrkeJR4uq-QwgskfX4psYFWCI3aD8"
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );
}
