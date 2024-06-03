import 'package:rental_car/data/data_sources/remote/dio/api_client.dart';

abstract class Api {
  Future<T> get<T>({
    required String url,
    required T Function(dynamic) mapper,
  });

  Future<T> getMapbox<T>({
    required String url,
    required T Function(dynamic) mapper,
  });

  Future<T> getKeyCall<T>({
    required String url,
    required T Function(dynamic) mapper,
  });

  Future<T> delete<T>({
    required String url,
    required T Function(dynamic) mapper,
  });

  Future<T> post<T>({
    required String url,
    Object? data,
    required T Function(dynamic) mapper,
  });

  Future<T> put<T>({
    required String url,
    Object? data,
    required T Function(dynamic) mapper,
  });
}

class NetworkApi extends Api {
  @override
  Future<T> delete<T>({
    required String url,
    required T Function(dynamic response) mapper,
  }) {
    return ApiClient.instance.dio.delete(url).then(
          (value) => mapper.call(value),
        );
  }

  @override
  Future<T> get<T>({
    required String url,
    required T Function(dynamic response) mapper,
  }) {
    return ApiClient.instance.dio.get(url).then(
          (value) => mapper.call(value),
        );
  }

  @override
  Future<T> post<T>({
    required String url,
    Object? data,
    required T Function(dynamic response) mapper,
  }) {
    return ApiClient.instance.dio
        .post(
          url,
          data: data,
        )
        .then(
          (value) => mapper.call(value),
        );
  }

  @override
  Future<T> put<T>({
    required String url,
    Object? data,
    required T Function(dynamic response) mapper,
  }) {
    return ApiClient.instance.dio
        .put(
          url,
          data: data,
        )
        .then(
          (value) => mapper.call(value),
        );
  }

  @override
  Future<T> getKeyCall<T>({
    required String url,
    required T Function(dynamic response) mapper,
  }) {
    return ApiClient.instance.dioCalling.post(url).then(
          (value) => mapper.call(value),
    );
  }

  @override
  Future<T> getMapbox<T>({
    required String url,
    required T Function(dynamic response) mapper,
  }) {
    return ApiClient.instance.dioMapbox.get(url).then(
          (value) => mapper.call(value),
    );
  }
}
