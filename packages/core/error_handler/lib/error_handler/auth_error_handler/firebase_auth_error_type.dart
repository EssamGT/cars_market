/// Enum that mirrors the FirebaseAuthErrorCode constant names.
/// Use these values to map provider error codes to app-specific failures/messages.
enum FirebaseAuthErrorType {
  // Follow the same sequence as `FirebaseAuthErrorCode` so mappings stay predictable.
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  emailAlreadyInUse,
  operationNotAllowed,
  weakPassword,
  tooManyRequests,
  networkRequestFailed,
  invalidCredential,
  credentialAlreadyInUse,
  accountExistsWithDifferentCredential,
  providerAlreadyLinked,
  noSuchProvider,
  invalidVerificationCode,
  invalidVerificationId,
  expiredActionCode,
  invalidActionCode,
  requiresRecentLogin,
  invalidUserToken,
  userTokenExpired,
  sessionCookieExpired,
  invalidSessionCookie,
  quotaExceeded,
  appNotAuthorized,
  appDeleted,
  internalError,
  missingAndroidPackageName,
  missingContinueUri,
  missingIosBundleId,
  unauthorizedContinueUri,
  adminRestrictedOperation,
  userMismatch,
  invalidCustomToken,
  customTokenMismatch,

  // New / previously missing constants (kept in the same relative order)
  sessionExpired,
  missingVerificationId,
  popupClosedByUser,
  cancelledPopupRequest,
  webContextAlreadyPresented,

  // Legacy / emulator alternative codes
  invalidLoginCredentials,
  invalidCredentialAlternative,

  // Extras used in messages/handler but not strictly part of the code constants
  authDomainConfigRequired,
  redirectCancelledByUser,

  // Fallback
  unknown,
}
