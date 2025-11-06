class AuthErrorMessages {
  static const String unknown = 'server_error';

  static const String anonymousProviderDisabled =
      'Anonymous sign-ins are disabled.';
  static const String badCodeVerifier =
      'PKCE code verifier mismatch. Please retry the login process.';
  static const String badJson = 'Invalid JSON in the request body.';
  static const String badJwt = 'Invalid token in authorization header.';
  static const String badOauthCallback =
      'OAuth callback missing attributes. Please retry.';
  static const String badOauthState = 'Invalid OAuth state.';
  static const String captchaFailed =
      'CAPTCHA verification failed. Please try again.';
  static const String conflict =
      'A conflict occurred (e.g. session refresh issue).';
  static const String emailAddressInvalid =
      'Invalid email. Example/test domains not supported.';
  static const String emailAddressNotAuthorized =
      'Email not authorized for sending. Setup custom SMTP.';
  static const String emailConflictIdentityNotDeletable =
      'Cannot unlink identity – leads to conflict with existing account.';
  static const String emailExists = 'This email address is already registered.';
  static const String emailNotConfirmed =
      'Email not confirmed. Please verify your email.';
  static const String emailProviderDisabled = 'Email signup is disabled.';
  static const String flowStateExpired =
      'Authentication flow expired. Please sign in again.';
  static const String flowStateNotFound =
      'Authentication flow not found. Please restart login.';
  static const String hookPayloadInvalidContentType =
      'Invalid content type in hook payload.';
  static const String hookPayloadOverSizeLimit =
      'Hook payload size exceeds limit.';
  static const String hookTimeout = 'Auth hook timed out.';
  static const String hookTimeoutAfterRetry =
      'Auth hook timed out after retry.';
  static const String identityAlreadyExists =
      'This identity is already linked to a user.';
  static const String identityNotFound = 'Identity not found or removed.';
  static const String insufficientAal =
      'Higher authentication level required (MFA).';
  static const String invalidCredentials =
      'Wrong email or password.';
  static const String inviteNotFound = 'Invite expired or already used.';
  static const String manualLinkingDisabled =
      'Manual linking of accounts is disabled.';
  static const String mfaChallengeExpired =
      'MFA challenge expired – request a new challenge.';
  static const String mfaFactorNameConflict =
      'Two MFA factors cannot have the same name.';
  static const String mfaFactorNotFound = 'MFA factor not found.';
  static const String mfaIpAddressMismatch =
      'MFA enrollment must begin and end from same IP.';
  static const String mfaPhoneEnrollNotEnabled =
      'MFA phone enrollment is disabled.';
  static const String mfaPhoneVerifyNotEnabled =
      'MFA phone verification is disabled.';
  static const String mfaTotpEnrollNotEnabled =
      'MFA TOTP enrollment is disabled.';
  static const String mfaTotpVerifyNotEnabled =
      'MFA TOTP verification is disabled.';
  static const String mfaVerificationFailed =
      'MFA verification failed (wrong code).';
  static const String mfaVerificationRejected =
      'MFA verification rejected by server.';
  static const String mfaVerifiedFactorExists =
      'User already has a verified phone factor.';
  static const String mfaWebAuthnEnrollNotEnabled =
      'WebAuthn MFA enrollment disabled.';
  static const String mfaWebAuthnVerifyNotEnabled =
      'WebAuthn MFA verification disabled.';
  static const String noAuthorization = 'Authorization header is missing.';
  static const String notAdmin = 'You are not authorized (admin only).';
  static const String oauthProviderNotSupported =
      'This OAuth provider is not supported.';
  static const String otpDisabled = 'OTP login is disabled.';
  static const String otpExpired = 'OTP expired. Please try again.';
  static const String overEmailSendRateLimit =
      'Too many emails sent. Please wait and retry.';
  static const String overRequestRateLimit =
      'Too many requests. Please wait and retry.';
  static const String overSmsSendRateLimit =
      'Too many SMS sent. Please wait and retry.';
  static const String phoneExists = 'This phone number is already registered.';
  static const String phoneNotConfirmed = 'Phone number is not confirmed.';
  static const String phoneProviderDisabled =
      'Phone/password signup is disabled.';
  static const String providerDisabled = 'This provider is disabled.';
  static const String providerEmailNeedsVerification =
      'Provider email must be verified.';
  static const String reauthenticationNeeded =
      'Reauthentication required to perform this action.';
  static const String reauthenticationNotValid =
      'Reauthentication failed (invalid code).';
  static const String refreshTokenAlreadyUsed =
      'Refresh token was already used. Please login again.';
  static const String refreshTokenNotFound = 'Refresh token not found.';
  static const String requestTimeout = 'Request timed out. Please retry.';
  static const String samePassword =
      'New password must differ from the current one.';
  static const String samlAssertionNoEmail =
      'SAML assertion missing email attribute.';
  static const String samlAssertionNoUserId =
      'SAML assertion missing user ID (NameID).';
  static const String samlEntityIdMismatch =
      'SAML entity ID mismatch. Cannot update metadata.';
  static const String samlIdpAlreadyExists =
      'SAML identity provider already exists.';
  static const String samlIdpNotFound = 'SAML identity provider not found.';
  static const String samlMetadataFetchFailed =
      'Failed to fetch metadata for SAML provider.';
  static const String samlProviderDisabled = 'SAML provider disabled.';
  static const String samlRelayStateExpired =
      'SAML relay state expired. Please retry login.';
  static const String samlRelayStateNotFound = 'SAML relay state not found.';
  static const String sessionExpired = 'Session expired. Please login again.';
  static const String sessionNotFound = 'Session not found or ended.';
  static const String signupDisabled = 'Signups are disabled.';
  static const String singleIdentityNotDeletable =
      'Cannot delete the only identity of a user.';
  static const String smsSendFailed =
      'Failed sending SMS. Check SMS provider settings.';
  static const String ssoDomainAlreadyExists =
      'SSO domain already exists for this provider.';
  static const String ssoProviderNotFound = 'SSO provider not found.';
  static const String tooManyEnrolledMfaFactors =
      'Too many MFA factors already enrolled.';
  static const String unexpectedAudience =
      'JWT audience does not match expected value.';
  static const String unexpectedFailure = 'Unexpected authentication failure.';
  static const String userAlreadyExists =
      'User already exists with this email or phone.';
  static const String userBanned = 'User account is banned.';
  static const String userNotFound = 'User not found.';
  static const String userSsoManaged =
      'SSO-managed user fields cannot be updated.';
  static const String validationFailed =
      'Validation failed – input format invalid.';
  static const String weakPassword = 'Password is too weak.';
}
