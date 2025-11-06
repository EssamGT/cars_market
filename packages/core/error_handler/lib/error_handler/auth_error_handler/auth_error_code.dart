// ...existing code...
class FirebaseAuthErrorCode {
  // Common Firebase Auth client error codes (Flutter / FirebaseAuthException)
  static const String invalidEmail = 'invalid-email';
  static const String userDisabled = 'user-disabled';
  static const String userNotFound = 'user-not-found';
  static const String wrongPassword = 'wrong-password';
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String operationNotAllowed = 'operation-not-allowed';
  static const String weakPassword = 'weak-password';
  static const String tooManyRequests = 'too-many-requests';
  static const String networkRequestFailed = 'network-request-failed';
  static const String invalidCredential = 'invalid-credential';
  static const String credentialAlreadyInUse = 'credential-already-in-use';
  static const String accountExistsWithDifferentCredential =
      'account-exists-with-different-credential';
  static const String providerAlreadyLinked = 'provider-already-linked';
  static const String noSuchProvider = 'no-such-provider';
  static const String invalidVerificationCode = 'invalid-verification-code';
  static const String invalidVerificationId = 'invalid-verification-id';
  static const String expiredActionCode = 'expired-action-code';
  static const String invalidActionCode = 'invalid-action-code';
  static const String requiresRecentLogin = 'requires-recent-login';
  static const String invalidUserToken = 'invalid-user-token';
  static const String userTokenExpired = 'user-token-expired';
  static const String sessionCookieExpired = 'session-cookie-expired';
  static const String invalidSessionCookie = 'invalid-session-cookie';
  static const String quotaExceeded = 'quota-exceeded';
  static const String appNotAuthorized = 'app-not-authorized';
  static const String appDeleted = 'app-deleted';
  static const String internalError = 'internal-error';
  static const String missingAndroidPackageName = 'missing-android-pkg-name';
  static const String missingContinueUri = 'missing-continue-uri';
  static const String missingIosBundleId = 'missing-ios-bundle-id';
  static const String unauthorizedContinueUri = 'unauthorized-continue-uri';
  static const String adminRestrictedOperation = 'admin-restricted-operation';
  static const String userMismatch = 'user-mismatch';
  static const String invalidCustomToken = 'invalid-custom-token';
  static const String customTokenMismatch = 'custom-token-mismatch';

  // New / previously missing constants (used in handler / mappings)
  static const String sessionExpired = 'session-expired';
  static const String missingVerificationId = 'missing-verification-id';
  static const String popupClosedByUser = 'popup-closed-by-user';
  static const String cancelledPopupRequest = 'cancelled-popup-request';
  static const String webContextAlreadyPresented = 'web-context-already-presented';

  // Legacy / emulator alternative codes
  static const String invalidLoginCredentials = 'INVALID_LOGIN_CREDENTIALS';
  static const String invalidCredentialAlternative = 'invalid-credential';
  static const String unknown = 'unknown';
}
