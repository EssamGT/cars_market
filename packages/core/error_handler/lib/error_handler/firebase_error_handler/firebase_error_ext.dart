import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_code.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_message.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_type.dart';

extension FirebaseErrorTypeExtension on FirebaseErrorType {
  Failure getFailure() {
    switch (this) {
      case FirebaseErrorType.cancelled:
        return Failure(
          code: FirebaseErrorCode.cancelled,
          message: FirebaseErrorMessage.cancelled,
        );

      case FirebaseErrorType.invalidArgument:
        return Failure(
          code: FirebaseErrorCode.invalidArgument,
          message: FirebaseErrorMessage.invalidArgument,
        );

      case FirebaseErrorType.deadlineExceeded:
        return Failure(
          code: FirebaseErrorCode.deadlineExceeded,
          message: FirebaseErrorMessage.deadlineExceeded,
        );

      case FirebaseErrorType.notFound:
        return Failure(
          code: FirebaseErrorCode.notFound,
          message: FirebaseErrorMessage.notFound,
        );

      case FirebaseErrorType.alreadyExists:
        return Failure(
          code: FirebaseErrorCode.alreadyExists,
          message: FirebaseErrorMessage.alreadyExists,
        );

      case FirebaseErrorType.permissionDenied:
        return Failure(
          code: FirebaseErrorCode.permissionDenied,
          message: FirebaseErrorMessage.permissionDenied,
        );

      case FirebaseErrorType.resourceExhausted:
        return Failure(
          code: FirebaseErrorCode.resourceExhausted,
          message: FirebaseErrorMessage.resourceExhausted,
        );

      case FirebaseErrorType.failedPrecondition:
        return Failure(
          code: FirebaseErrorCode.failedPrecondition,
          message: FirebaseErrorMessage.failedPrecondition,
        );

      case FirebaseErrorType.aborted:
        return Failure(
          code: FirebaseErrorCode.aborted,
          message: FirebaseErrorMessage.aborted,
        );

      case FirebaseErrorType.outOfRange:
        return Failure(
          code: FirebaseErrorCode.outOfRange,
          message: FirebaseErrorMessage.outOfRange,
        );

      case FirebaseErrorType.unimplemented:
        return Failure(
          code: FirebaseErrorCode.unimplemented,
          message: FirebaseErrorMessage.unimplemented,
        );

      case FirebaseErrorType.internal:
        return Failure(
          code: FirebaseErrorCode.internal,
          message: FirebaseErrorMessage.internal,
        );

      case FirebaseErrorType.unavailable:
        return Failure(
          code: FirebaseErrorCode.unavailable,
          message: FirebaseErrorMessage.unavailable,
        );

      case FirebaseErrorType.dataLoss:
        return Failure(
          code: FirebaseErrorCode.dataLoss,
          message: FirebaseErrorMessage.dataLoss,
        );

      case FirebaseErrorType.unauthenticated:
        return Failure(
          code: FirebaseErrorCode.unauthenticated,
          message: FirebaseErrorMessage.unauthenticated,
        );

      case FirebaseErrorType.objectNotFound:
        return Failure(
          code: FirebaseErrorCode.objectNotFound,
          message: FirebaseErrorMessage.objectNotFound,
        );

      case FirebaseErrorType.bucketNotFound:
        return Failure(
          code: FirebaseErrorCode.bucketNotFound,
          message: FirebaseErrorMessage.bucketNotFound,
        );

      case FirebaseErrorType.projectNotFound:
        return Failure(
          code: FirebaseErrorCode.projectNotFound,
          message: FirebaseErrorMessage.projectNotFound,
        );

      case FirebaseErrorType.quotaExceeded:
        return Failure(
          code: FirebaseErrorCode.quotaExceeded,
          message: FirebaseErrorMessage.quotaExceeded,
        );

      case FirebaseErrorType.unauthorized:
        return Failure(
          code: FirebaseErrorCode.unauthorized,
          message: FirebaseErrorMessage.unauthorized,
        );

      case FirebaseErrorType.retryLimitExceeded:
        return Failure(
          code: FirebaseErrorCode.retryLimitExceeded,
          message: FirebaseErrorMessage.retryLimitExceeded,
        );

      case FirebaseErrorType.invalidChecksum:
        return Failure(
          code: FirebaseErrorCode.invalidChecksum,
          message: FirebaseErrorMessage.invalidChecksum,
        );

      case FirebaseErrorType.canceled:
        return Failure(
          code: FirebaseErrorCode.canceled,
          message: FirebaseErrorMessage.canceled,
        );

      case FirebaseErrorType.downloadSizeExceeded:
        return Failure(
          code: FirebaseErrorCode.downloadSizeExceeded,
          message: FirebaseErrorMessage.downloadSizeExceeded,
        );

      default:
        return Failure(
          code: FirebaseErrorCode.unknown,
          message: FirebaseErrorMessage.unknown,
        );
    }
  }
}
