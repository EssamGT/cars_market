import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/fire_base_auth_ext.dart';
import 'package:error_handler/error_handler/auth_error_handler/firebase_auth_error_type.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_code.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthErrorHandler implements Exception {
  static Failure handleFirebaseAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case FirebaseAuthErrorCode.invalidEmail:
        return FirebaseAuthErrorType.invalidEmail.getFailure();
      case FirebaseAuthErrorCode.userDisabled:
        return FirebaseAuthErrorType.userDisabled.getFailure();
      case FirebaseAuthErrorCode.userNotFound:
        return FirebaseAuthErrorType.userNotFound.getFailure();
      case FirebaseAuthErrorCode.wrongPassword:
        return FirebaseAuthErrorType.wrongPassword.getFailure();
      case FirebaseAuthErrorCode.emailAlreadyInUse:
        return FirebaseAuthErrorType.emailAlreadyInUse.getFailure();
      case FirebaseAuthErrorCode.operationNotAllowed:
        return FirebaseAuthErrorType.operationNotAllowed.getFailure();
      case FirebaseAuthErrorCode.weakPassword:
        return FirebaseAuthErrorType.weakPassword.getFailure();
      case FirebaseAuthErrorCode.tooManyRequests:
        return FirebaseAuthErrorType.tooManyRequests.getFailure();
      case FirebaseAuthErrorCode.requiresRecentLogin:
        return FirebaseAuthErrorType.requiresRecentLogin.getFailure();

      // Additional common Firebase Auth error codes
      case FirebaseAuthErrorCode.accountExistsWithDifferentCredential:
        return FirebaseAuthErrorType.accountExistsWithDifferentCredential
            .getFailure();
      case FirebaseAuthErrorCode.credentialAlreadyInUse:
        return FirebaseAuthErrorType.credentialAlreadyInUse.getFailure();
      case FirebaseAuthErrorCode.invalidCredential:
        return FirebaseAuthErrorType.invalidCredential.getFailure();
      case FirebaseAuthErrorCode.invalidVerificationCode:
        return FirebaseAuthErrorType.invalidVerificationCode.getFailure();
      case FirebaseAuthErrorCode.invalidVerificationId:
        return FirebaseAuthErrorType.invalidVerificationId.getFailure();
      case FirebaseAuthErrorCode.sessionExpired:
        return FirebaseAuthErrorType.sessionExpired.getFailure();
      case FirebaseAuthErrorCode.missingVerificationId:
        return FirebaseAuthErrorType.missingVerificationId.getFailure();

      // Web / OAuth related
      case FirebaseAuthErrorCode.popupClosedByUser:
        return FirebaseAuthErrorType.popupClosedByUser.getFailure();
      case FirebaseAuthErrorCode.cancelledPopupRequest:
        return FirebaseAuthErrorType.cancelledPopupRequest.getFailure();
      case FirebaseAuthErrorCode.webContextAlreadyPresented:
        return FirebaseAuthErrorType.webContextAlreadyPresented.getFailure();
      case FirebaseAuthErrorCode.providerAlreadyLinked:
        return FirebaseAuthErrorType.providerAlreadyLinked.getFailure();
      case FirebaseAuthErrorCode.noSuchProvider:
        return FirebaseAuthErrorType.noSuchProvider.getFailure();

      // Action code errors
      case FirebaseAuthErrorCode.invalidActionCode:
        return FirebaseAuthErrorType.invalidActionCode.getFailure();
      case FirebaseAuthErrorCode.expiredActionCode:
        return FirebaseAuthErrorType.expiredActionCode.getFailure();

      default:
        return FirebaseAuthErrorType.unknown.getFailure();
    }
  }
}
