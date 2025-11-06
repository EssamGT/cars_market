import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_code.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_message.dart';
import 'package:error_handler/error_handler/auth_error_handler/firebase_auth_error_type.dart';

extension FirebaseAuthErrorTypeExtension on FirebaseAuthErrorType {
  Failure getFailure() {
    switch (this) {
      case FirebaseAuthErrorType.invalidEmail:
        return Failure(
          code: FirebaseAuthErrorCode.invalidEmail,
          message: FirebaseAuthErrorMessage.invalidEmail,
        );

      case FirebaseAuthErrorType.userDisabled:
        return Failure(
          code: FirebaseAuthErrorCode.userDisabled,
          message: FirebaseAuthErrorMessage.userDisabled,
        );

      case FirebaseAuthErrorType.userNotFound:
        return Failure(
          code: FirebaseAuthErrorCode.userNotFound,
          message: FirebaseAuthErrorMessage.userNotFound,
        );

      case FirebaseAuthErrorType.wrongPassword:
        return Failure(
          code: FirebaseAuthErrorCode.wrongPassword,
          message: FirebaseAuthErrorMessage.wrongPassword,
        );

      case FirebaseAuthErrorType.emailAlreadyInUse:
        return Failure(
          code: FirebaseAuthErrorCode.emailAlreadyInUse,
          message: FirebaseAuthErrorMessage.emailAlreadyInUse,
        );

      case FirebaseAuthErrorType.weakPassword:
        return Failure(
          code: FirebaseAuthErrorCode.weakPassword,
          message: FirebaseAuthErrorMessage.weakPassword,
        );

      case FirebaseAuthErrorType.operationNotAllowed:
        return Failure(
          code: FirebaseAuthErrorCode.operationNotAllowed,
          message: FirebaseAuthErrorMessage.operationNotAllowed,
        );

      case FirebaseAuthErrorType.tooManyRequests:
        return Failure(
          code: FirebaseAuthErrorCode.tooManyRequests,
          message: FirebaseAuthErrorMessage.tooManyRequests,
        );

      case FirebaseAuthErrorType.requiresRecentLogin:
        return Failure(
          code: FirebaseAuthErrorCode.requiresRecentLogin,
          message: FirebaseAuthErrorMessage.requiresRecentLogin,
        );

      case FirebaseAuthErrorType.credentialAlreadyInUse:
        return Failure(
          code: FirebaseAuthErrorCode.credentialAlreadyInUse,
          message: FirebaseAuthErrorMessage.credentialAlreadyInUse,
        );

      case FirebaseAuthErrorType.accountExistsWithDifferentCredential:
        return Failure(
          code: FirebaseAuthErrorCode.accountExistsWithDifferentCredential,
          message:
              FirebaseAuthErrorMessage.accountExistsWithDifferentCredential,
        );

      case FirebaseAuthErrorType.invalidCredential:
        return Failure(
          code: FirebaseAuthErrorCode.invalidCredential,
          message: FirebaseAuthErrorMessage.invalidCredential,
        );

      case FirebaseAuthErrorType.networkRequestFailed:
        return Failure(
          code: FirebaseAuthErrorCode.networkRequestFailed,
          message: FirebaseAuthErrorMessage.networkRequestFailed,
        );

      case FirebaseAuthErrorType.sessionCookieExpired:
        return Failure(
          code: FirebaseAuthErrorCode.sessionCookieExpired,
          message: FirebaseAuthErrorMessage.sessionCookieExpired,
        );

      case FirebaseAuthErrorType.sessionExpired:
        return Failure(
          code: FirebaseAuthErrorCode.sessionExpired,
          message: FirebaseAuthErrorMessage.sessionExpired,
        );

      case FirebaseAuthErrorType.missingVerificationId:
        return Failure(
          code: FirebaseAuthErrorCode.missingVerificationId,
          message: FirebaseAuthErrorMessage.missingVerificationId,
        );

      case FirebaseAuthErrorType.popupClosedByUser:
        return Failure(
          code: FirebaseAuthErrorCode.popupClosedByUser,
          message: FirebaseAuthErrorMessage.popupClosedByUser,
        );

      case FirebaseAuthErrorType.cancelledPopupRequest:
        return Failure(
          code: FirebaseAuthErrorCode.cancelledPopupRequest,
          message: FirebaseAuthErrorMessage.cancelledPopupRequest,
        );

      case FirebaseAuthErrorType.webContextAlreadyPresented:
        return Failure(
          code: FirebaseAuthErrorCode.webContextAlreadyPresented,
          message: FirebaseAuthErrorMessage.webContextAlreadyPresented,
        );

      default:
        return Failure(
          code: FirebaseAuthErrorCode.unknown,
          message: FirebaseAuthErrorMessage.unknown,
        );
    }
  }
}
