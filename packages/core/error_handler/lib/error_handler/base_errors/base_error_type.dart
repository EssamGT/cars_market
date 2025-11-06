
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/base_errors/base_error_code.dart';
import 'package:error_handler/error_handler/base_errors/base_error_massage.dart';

/// Enum for base-level errors (network / HTTP / generic)
enum BaseErrorType {
	noInternet,
	timeout,
	cancelled,
	badRequest,
	unauthorized,
	forbidden,
	notFound,
	serviceUnavailable,
	networkRequestFailed,
	unknown,
}

extension BaseErrorTypeExtension on BaseErrorType {
	Failure getFailure() {
		switch (this) {
			case BaseErrorType.noInternet:
				return Failure(code: BaseErrorCode.noInternet, message: BaseErrorMessage.noInternet);
			case BaseErrorType.timeout:
				return Failure(code: BaseErrorCode.timeout, message: BaseErrorMessage.timeout);
			case BaseErrorType.cancelled:
				return Failure(code: BaseErrorCode.cancelled, message: BaseErrorMessage.cancelled);
			case BaseErrorType.badRequest:
				return Failure(code: BaseErrorCode.badRequest, message: BaseErrorMessage.badRequest);
			case BaseErrorType.unauthorized:
				return Failure(code: BaseErrorCode.unauthorized, message: BaseErrorMessage.unauthorized);
			case BaseErrorType.forbidden:
				return Failure(code: BaseErrorCode.forbidden, message: BaseErrorMessage.forbidden);
			case BaseErrorType.notFound:
				return Failure(code: BaseErrorCode.notFound, message: BaseErrorMessage.notFound);
			case BaseErrorType.serviceUnavailable:
				return Failure(code: BaseErrorCode.serviceUnavailable, message: BaseErrorMessage.serviceUnavailable);
			case BaseErrorType.networkRequestFailed:
				return Failure(code: BaseErrorCode.networkRequestFailed, message: BaseErrorMessage.networkRequestFailed);
			default:
				return Failure(code: BaseErrorCode.unknown, message: BaseErrorMessage.unknown);
		}
	}
}

