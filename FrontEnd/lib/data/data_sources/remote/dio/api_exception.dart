import 'package:dio/dio.dart';

class APIException extends DioException {
  APIException({
    RequestOptions? requestOptions,
    required String message,
  }) : super(
          requestOptions: requestOptions ?? RequestOptions(),
          message: message,
        );
}

class InternalServerErrorException extends APIException {
  static const String _kErrorMessage =
      'The server encountered an unexpected condition that prevented it from fulfilling the request.';

  InternalServerErrorException({
    super.requestOptions,
    String? message,
  }) : super(
          message: message ?? _kErrorMessage,
        );
}

class RequestTimeoutException extends APIException {
  static const String _kErrorMessage =
      'The connection has timed out, please try again.';

  RequestTimeoutException({
    super.requestOptions,
    String? message,
  }) : super(
          message: message ?? _kErrorMessage,
        );
}

class NoInternetConnectionAPIErrorException extends APIException {
  static const String _kErrorMessage =
      'The Internet connection appears to be offline.';

  NoInternetConnectionAPIErrorException({
    super.requestOptions,
    String? message,
  }) : super(
          message: message ?? _kErrorMessage,
        );
}

class BadRequestException extends APIException {
  static const String _kErrorMessage = 'Invalid request';

  BadRequestException({
    super.requestOptions,
    String? message,
  }) : super(
          message: message ?? _kErrorMessage,
        );
}

class UnauthorizedException extends APIException {
  static const String _kErrorMessage = 'Access denied';

  UnauthorizedException({
    super.requestOptions,
    String? message,
  }) : super(
          message: message ?? _kErrorMessage,
        );
}

class ForbiddenException extends APIException {
  static const String _kErrorMessage = 'Forbidden';

  ForbiddenException({
    super.requestOptions,
    String? message,
  }) : super(
          message: message ?? _kErrorMessage,
        );
}

class NotFoundException extends APIException {
  static const String _kErrorMessage =
      'The requested information could not be found';

  NotFoundException({
    required super.requestOptions,
    String? message,
  }) : super(
          message: message ?? _kErrorMessage,
        );
}

class UnknownApiException extends APIException {
  static const String _kErrorMessage =
      'Unknown error occurred, please try again later.';

  UnknownApiException({
    required super.requestOptions,
    String? message,
  }) : super(
    message: message ?? _kErrorMessage,
  );
}
