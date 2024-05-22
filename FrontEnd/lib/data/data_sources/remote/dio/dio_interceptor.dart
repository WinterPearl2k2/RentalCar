import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rental_car/application/services/auth_service.dart';
import 'package:rental_car/application/services/preference_service.dart';
import 'package:rental_car/data/data_sources/remote/api/end_point.dart';
import 'package:rental_car/data/data_sources/remote/dio/api_exception.dart';
import 'package:rental_car/main.dart';

import '../../../../application/utils/log_utils.dart';
import 'api_client.dart';

class DioInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = PreferenceService.getToken();
    if (token.accessToken.isNotEmpty ||
        (options.path != EndPoint.restUrlLogin ||
            options.path != EndPoint.restUrlRefreshToken ||
            options.path != EndPoint.restUrlRegister)) {
      options.headers.addAll({
        "Authorization": "Bearer ${token.accessToken}",
      });
    }
    LogUtils.i('${options.headers['Authorization']}');
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = err.requestOptions;
    final msgError = err.response?.data['message'].toString() ?? err.message;
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return handler.reject(
        RequestTimeoutException(
          requestOptions: requestOptions,
          message: msgError,
        ),
      );
    }
    if (err.type == DioExceptionType.cancel ||
        err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.unknown) {
      return handler.reject(
        NoInternetConnectionAPIErrorException(
          requestOptions: requestOptions,
          message: msgError,
        ),
      );
    }
    switch (err.response?.statusCode) {
      case HttpStatus.badRequest:
        return handler.reject(
          BadRequestException(
            requestOptions: requestOptions,
            message: msgError,
          ),
        );
      case HttpStatus.unauthorized:
        if (PreferenceService.getToken().accessToken.isEmpty) {
          return handler.reject(
            UnauthorizedException(
              requestOptions: requestOptions,
              message: msgError,
            ),
          );
        }
        try {
          await injection.getIt<IAuthService>().refreshToken();
          await _retry(requestOptions).then(
            (response) => handler.resolve(response),
          );
        } catch (_) {
          return handler.reject(
            UnauthorizedException(
              requestOptions: requestOptions,
              message: msgError,
            ),
          );
        }
      case HttpStatus.forbidden:
        return handler.reject(
          ForbiddenException(
            requestOptions: requestOptions,
            message: msgError,
          ),
        );
      case HttpStatus.notFound:
        return handler.reject(
          NotFoundException(
            requestOptions: requestOptions,
            message: msgError,
          ),
        );
      case HttpStatus.internalServerError:
        return handler.reject(
          InternalServerErrorException(
            requestOptions: requestOptions,
            message: msgError,
          ),
        );
      default:
        return handler.reject(
          UnknownApiException(
            requestOptions: requestOptions,
            message: msgError,
          ),
        );
    }
  }

  Future<Response> _retry(
    RequestOptions requestOptions,
  ) async {
    ApiClient.instance.dio.options.headers["Authorization"] =
        "Bearer ${PreferenceService.getToken().accessToken}";
    return await ApiClient.instance.dio.request(
      requestOptions.path,
      data: requestOptions.data,
      cancelToken: requestOptions.cancelToken,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
    );
  }
}
