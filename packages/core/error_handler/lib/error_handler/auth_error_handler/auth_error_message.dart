import 'package:constants/strings_manager.dart';

// ...existing code...
class FirebaseAuthErrorMessage {
  // Basic
  static String get invalidEmail => StringsManager.invalidEmail;
  static String get userDisabled => StringsManager.userDisabled;
  static String get userNotFound => StringsManager.userNotFound;
  static String get wrongPassword => StringsManager.wrongPassword;
  static String get emailAlreadyInUse => StringsManager.emailAlreadyInUse;
  static String get operationNotAllowed => StringsManager.operationNotAllowed;
  static String get weakPassword => StringsManager.weakPassword;

  // Rate limiting / network
  static String get tooManyRequests => StringsManager.tooManyRequests;
  static String get networkRequestFailed => StringsManager.networkRequestFailed;

  // Credential / provider
  static String get invalidCredential => StringsManager.invalidCredential;
  static String get credentialAlreadyInUse => StringsManager.credentialAlreadyInUse;
  static String get accountExistsWithDifferentCredential =>
      StringsManager.accountExistsWithDifferentCredential;
  static String get providerAlreadyLinked => StringsManager.providerAlreadyLinked;
  static String get noSuchProvider => StringsManager.noSuchProvider;

  // Verification / action codes
  static String get invalidVerificationCode => StringsManager.invalidVerificationCode;
  static String get invalidVerificationId => StringsManager.invalidVerificationId;
  static String get expiredActionCode => StringsManager.expiredActionCode;
  static String get invalidActionCode => StringsManager.invalidActionCode;

  // Token / session
  static String get requiresRecentLogin => StringsManager.requiresRecentLogin;
  static String get invalidUserToken => StringsManager.invalidUserToken;
  static String get userTokenExpired => StringsManager.userTokenExpired;
  static String get sessionCookieExpired => StringsManager.sessionCookieExpired;
  static String get invalidSessionCookie => StringsManager.invalidSessionCookie;

  // App / server
  static String get quotaExceeded => StringsManager.firebaseQuotaExceeded;
  static String get appNotAuthorized => StringsManager.appNotAuthorized;
  static String get appDeleted => StringsManager.appDeleted;
  static String get internalError => StringsManager.internalError;
  static String get adminRestrictedOperation => StringsManager.adminRestrictedOperation;
  static String get userMismatch => StringsManager.userMismatch;

  // Custom token
  static String get invalidCustomToken => StringsManager.invalidCustomToken;
  static String get customTokenMismatch => StringsManager.customTokenMismatch;

  // Missing / configuration
  static String get missingAndroidPackageName => StringsManager.missingAndroidPackageName;
  static String get missingContinueUri => StringsManager.missingContinueUri;
  static String get missingIosBundleId => StringsManager.missingIosBundleId;
  static String get unauthorizedContinueUri => StringsManager.unauthorizedContinueUri;
  static String get authDomainConfigRequired => StringsManager.authDomainConfigRequired;

  // Popup / redirect (web/cross-platform)
  static String get popupClosedByUser => StringsManager.popupClosedByUser;
  static String get cancelledPopupRequest => StringsManager.cancelledPopupRequest;
  static String get redirectCancelledByUser => StringsManager.redirectCancelledByUser;

  // Emulator / alternative messages
  static String get invalidLoginCredentials => StringsManager.invalidLoginCredentials;
  static const String unknown = 'Server error occurred. Please try again later.';

  // New / synced messages
  static String get sessionExpired => StringsManager.sessionExpired;
  static String get missingVerificationId => StringsManager.missingVerificationId;
  static String get webContextAlreadyPresented => StringsManager.webContextAlreadyPresented;
}
