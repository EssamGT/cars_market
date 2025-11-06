// ...existing code...
class FirebaseAuthErrorMessage {
  // Basic
  static const String invalidEmail =
      'The email address is not valid. Please check and try again.';
  static const String userDisabled =
      'This account has been disabled. Please contact support if you need help.';
  static const String userNotFound =
      'No account found with this email. Please check the email or sign up.';
  static const String wrongPassword = 'Incorrect password. Please try again.';
  static const String emailAlreadyInUse =
      'This email is already registered. Try signing in or use a different email.';
  static const String operationNotAllowed =
      'This sign-in method is not enabled. Please contact support.';
  static const String weakPassword =
      'The password is too weak. Use at least 6 characters.';

  // Rate limiting / network
  static const String tooManyRequests =
      'Too many attempts. Please wait a moment and try again.';
  static const String networkRequestFailed =
      'Network error. Check your internet connection and try again.';

  // Credential / provider
  static const String invalidCredential =
      'Invalid authentication credentials. Please try again.';
  static const String credentialAlreadyInUse =
      'This account is already linked with a different credential.';
  static const String accountExistsWithDifferentCredential =
      'An account with this email exists using a different sign-in method. Try signing in with that provider.';
  static const String providerAlreadyLinked =
      'This provider is already linked to the current user.';
  static const String noSuchProvider =
      'The requested sign-in provider is not available.';

  // Verification / action codes
  static const String invalidVerificationCode =
      'The verification code is invalid. Please check and try again.';
  static const String invalidVerificationId =
      'Invalid verification session. Please retry the verification process.';
  static const String expiredActionCode =
      'This link or code has expired. Request a new one and try again.';
  static const String invalidActionCode =
      'The action code is invalid. Please request a fresh link and try again.';

  // Token / session
  static const String requiresRecentLogin =
      'This action requires recent authentication. Please sign in again and retry.';
  static const String invalidUserToken =
      'Authentication token is invalid. Please sign in again.';
  static const String userTokenExpired =
      'Your session expired. Please sign in again.';
  static const String sessionCookieExpired =
      'Session expired. Please sign in again.';
  static const String invalidSessionCookie =
      'Session is invalid. Please sign in again.';

  // App / server
  static const String quotaExceeded =
      'Request quota exceeded. Please try again later.';
  static const String appNotAuthorized =
      'This app is not authorized to perform this operation.';
  static const String appDeleted =
      'This app no longer exists. Please contact support.';
  static const String internalError =
      'Internal error occurred. Please try again later.';
  static const String adminRestrictedOperation =
      'This operation is restricted. Contact support for help.';
  static const String userMismatch =
      'The provided credentials do not match the current user.';

  // Custom token
  static const String invalidCustomToken =
      'Custom authentication token is invalid. Please try again.';
  static const String customTokenMismatch =
      'Custom token does not correspond to the correct account.';

  // Missing / configuration
  static const String missingAndroidPackageName =
      'Required Android package name is missing in the configuration.';
  static const String missingContinueUri =
      'Missing redirect URL. Please contact support or try again.';
  static const String missingIosBundleId =
      'Required iOS bundle id is missing in the configuration.';
  static const String unauthorizedContinueUri =
      'Redirect URL is not authorized. Check your configuration.';
  static const String authDomainConfigRequired =
      'Authentication domain is not configured properly.';

  // Popup / redirect (web/cross-platform)
  static const String popupClosedByUser =
      'The popup was closed before completing sign in.';
  static const String cancelledPopupRequest =
      'The popup request was cancelled. Please try again.';
  static const String redirectCancelledByUser =
      'The redirect sign-in was cancelled. Please try again.';

  // Emulator / alternative messages
  static const String invalidLoginCredentials =
      'Invalid email or password. Please check your credentials and try again.';
  static const String unknown =
      'Server error occurred. Please try again later.';

  // New / synced messages
  static const String sessionExpired =
      'Session expired. Please sign in again.'; // kept consistent with sessionCookieExpired
  static const String missingVerificationId =
      'Missing verification session. Please retry the verification process.';
  static const String webContextAlreadyPresented =
      'Web authentication context is already presented. Please try again.';
}
