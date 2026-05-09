import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_ext.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_type.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_code.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseErrorHandler implements Exception {
  static Failure handleFirestoreError(FirebaseException error) {
    switch (error.code) {
      case FirebaseErrorCode.cancelled:
        return FirebaseErrorType.cancelled.getFailure();
      case FirebaseErrorCode.invalidArgument:
        return FirebaseErrorType.invalidArgument.getFailure();
      case FirebaseErrorCode.deadlineExceeded:
        return FirebaseErrorType.deadlineExceeded.getFailure();
      case FirebaseErrorCode.notFound:
        return FirebaseErrorType.notFound.getFailure();
      case FirebaseErrorCode.alreadyExists:
        return FirebaseErrorType.alreadyExists.getFailure();
      case FirebaseErrorCode.permissionDenied:
        return FirebaseErrorType.permissionDenied.getFailure();
      case FirebaseErrorCode.resourceExhausted:
        return FirebaseErrorType.resourceExhausted.getFailure();
      case FirebaseErrorCode.failedPrecondition:
        return FirebaseErrorType.failedPrecondition.getFailure();
      case FirebaseErrorCode.aborted:
        return FirebaseErrorType.aborted.getFailure();
      case FirebaseErrorCode.outOfRange:
        return FirebaseErrorType.outOfRange.getFailure();
      case FirebaseErrorCode.unimplemented:
        return FirebaseErrorType.unimplemented.getFailure();
      case FirebaseErrorCode.internal:
        return FirebaseErrorType.internal.getFailure();
      case FirebaseErrorCode.unavailable:
        return FirebaseErrorType.unavailable.getFailure();
      case FirebaseErrorCode.dataLoss:
        return FirebaseErrorType.dataLoss.getFailure();
      case FirebaseErrorCode.unauthenticated:
        return FirebaseErrorType.unauthenticated.getFailure();
      case FirebaseErrorCode.objectNotFound:
        return FirebaseErrorType.objectNotFound.getFailure();
      case FirebaseErrorCode.bucketNotFound:
        return FirebaseErrorType.bucketNotFound.getFailure();
      case FirebaseErrorCode.projectNotFound:
        return FirebaseErrorType.projectNotFound.getFailure();
      case FirebaseErrorCode.quotaExceeded:
        return FirebaseErrorType.quotaExceeded.getFailure();

      case FirebaseErrorCode.unauthorized:
        return FirebaseErrorType.unauthorized.getFailure();
      case FirebaseErrorCode.retryLimitExceeded:
        return FirebaseErrorType.retryLimitExceeded.getFailure();
      case FirebaseErrorCode.invalidChecksum:
        return FirebaseErrorType.invalidChecksum.getFailure();
      case FirebaseErrorCode.canceled:
      case FirebaseErrorCode.downloadSizeExceeded:
        return FirebaseErrorType.downloadSizeExceeded.getFailure();

      default:
        return FirebaseErrorType.unknown.getFailure();
    }
  }
}
