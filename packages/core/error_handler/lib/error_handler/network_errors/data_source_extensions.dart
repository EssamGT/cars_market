import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/network_errors/data_source.dart';
import 'package:error_handler/error_handler/network_errors/response_code.dart';
import 'package:error_handler/error_handler/network_errors/response_messages.dart';

extension DartaSourceExtensions on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
          code: ResponseCode.success,
          message: ResponseMessages.success,
        );
      case DataSource.noContent:
        return Failure(
          code: ResponseCode.noContent,
          message: ResponseMessages.noContent,
        );
      case DataSource.badRequest:
        return Failure(
          code: ResponseCode.badRequest,
          message: ResponseMessages.badRequest,
        );
      case DataSource.unauthorized:
        return Failure(
          code: ResponseCode.unauthorized,
          message: ResponseMessages.unauthorized,
        );
      case DataSource.forbidden:
        return Failure(
          code: ResponseCode.forbidden,
          message: ResponseMessages.forbidden,
        );
      case DataSource.internalServerError:
        return Failure(
          code: ResponseCode.internalServerError,
          message: ResponseMessages.internalServerError,
        );
      case DataSource.connectTimeOut:
        return Failure(
          code: ResponseCode.connectTimeout,
          message: ResponseMessages.connectTimeOut,
        );
      case DataSource.cancelled:
        return Failure(
          code: ResponseCode.cancelled,
          message: ResponseMessages.cancelled,
        );
      case DataSource.recivedTimeout:
        return Failure(
          code: ResponseCode.receivedTimeout,
          message: ResponseMessages.receivedTimeout,
        );
      case DataSource.sendTimeout:
        return Failure(
          code: ResponseCode.sendTimeout,
          message: ResponseMessages.sendTimeout,
        );
      case DataSource.cacheError:
        return Failure(
          code: ResponseCode.cacheError,
          message: ResponseMessages.cacheError,
        );
      case DataSource.noInternetConnection:
        return Failure(
          code: ResponseCode.noInternetConnection,
          message: ResponseMessages.noInternetConnection,
        );
      case DataSource.defaultError:
        return Failure(
          code: ResponseCode.defaultError,
          message: ResponseMessages.defaultError,
        );
    }
  }
}
