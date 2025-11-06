/// Supabase Auth error codes (raw strings from Supabase)
class AuthErrorCodes {
  static const String anonymousProviderDisabled = 'anonymous_provider_disabled';
  static const String badCodeVerifier = 'bad_code_verifier';
  static const String badJson = 'bad_json';
  static const String badJwt = 'bad_jwt';
  static const String unknown = 'server_error';
  static const String badOauthCallback = 'bad_oauth_callback';
  static const String badOauthState = 'bad_oauth_state';
  static const String captchaFailed = 'captcha_failed';
  static const String conflict = 'conflict';
  static const String emailAddressInvalid = 'email_address_invalid';
  static const String emailAddressNotAuthorized =
      'email_address_not_authorized';
  static const String emailConflictIdentityNotDeletable =
      'email_conflict_identity_not_deletable';
  static const String emailExists = 'email_exists';
  static const String emailNotConfirmed = 'email_not_confirmed';
  static const String emailProviderDisabled = 'email_provider_disabled';
  static const String flowStateExpired = 'flow_state_expired';
  static const String flowStateNotFound = 'flow_state_not_found';
  static const String hookPayloadInvalidContentType =
      'hook_payload_invalid_content_type';
  static const String hookPayloadOverSizeLimit = 'hook_payload_over_size_limit';
  static const String hookTimeout = 'hook_timeout';
  static const String hookTimeoutAfterRetry = 'hook_timeout_after_retry';
  static const String identityAlreadyExists = 'identity_already_exists';
  static const String identityNotFound = 'identity_not_found';
  static const String insufficientAal = 'insufficient_aal';
  static const String invalidCredentials = 'invalid_credentials';
  static const String inviteNotFound = 'invite_not_found';
  static const String manualLinkingDisabled = 'manual_linking_disabled';
  static const String mfaChallengeExpired = 'mfa_challenge_expired';
  static const String mfaFactorNameConflict = 'mfa_factor_name_conflict';
  static const String mfaFactorNotFound = 'mfa_factor_not_found';
  static const String mfaIpAddressMismatch = 'mfa_ip_address_mismatch';
  static const String mfaPhoneEnrollNotEnabled = 'mfa_phone_enroll_not_enabled';
  static const String mfaPhoneVerifyNotEnabled = 'mfa_phone_verify_not_enabled';
  static const String mfaTotpEnrollNotEnabled = 'mfa_totp_enroll_not_enabled';
  static const String mfaTotpVerifyNotEnabled = 'mfa_totp_verify_not_enabled';
  static const String mfaVerificationFailed = 'mfa_verification_failed';
  static const String mfaVerificationRejected = 'mfa_verification_rejected';
  static const String mfaVerifiedFactorExists = 'mfa_verified_factor_exists';
  static const String mfaWebAuthnEnrollNotEnabled =
      'mfa_web_authn_enroll_not_enabled';
  static const String mfaWebAuthnVerifyNotEnabled =
      'mfa_web_authn_verify_not_enabled';
  static const String noAuthorization = 'no_authorization';
  static const String notAdmin = 'not_admin';
  static const String oauthProviderNotSupported =
      'oauth_provider_not_supported';
  static const String otpDisabled = 'otp_disabled';
  static const String otpExpired = 'otp_expired';
  static const String overEmailSendRateLimit = 'over_email_send_rate_limit';
  static const String overRequestRateLimit = 'over_request_rate_limit';
  static const String overSmsSendRateLimit = 'over_sms_send_rate_limit';
  static const String phoneExists = 'phone_exists';
  static const String phoneNotConfirmed = 'phone_not_confirmed';
  static const String phoneProviderDisabled = 'phone_provider_disabled';
  static const String providerDisabled = 'provider_disabled';
  static const String providerEmailNeedsVerification =
      'provider_email_needs_verification';
  static const String reauthenticationNeeded = 'reauthentication_needed';
  static const String reauthenticationNotValid = 'reauthentication_not_valid';
  static const String refreshTokenAlreadyUsed = 'refresh_token_already_used';
  static const String refreshTokenNotFound = 'refresh_token_not_found';
  static const String requestTimeout = 'request_timeout';
  static const String samePassword = 'same_password';
  static const String samlAssertionNoEmail = 'saml_assertion_no_email';
  static const String samlAssertionNoUserId = 'saml_assertion_no_user_id';
  static const String samlEntityIdMismatch = 'saml_entity_id_mismatch';
  static const String samlIdpAlreadyExists = 'saml_idp_already_exists';
  static const String samlIdpNotFound = 'saml_idp_not_found';
  static const String samlMetadataFetchFailed = 'saml_metadata_fetch_failed';
  static const String samlProviderDisabled = 'saml_provider_disabled';
  static const String samlRelayStateExpired = 'saml_relay_state_expired';
  static const String samlRelayStateNotFound = 'saml_relay_state_not_found';
  static const String sessionExpired = 'session_expired';
  static const String sessionNotFound = 'session_not_found';
  static const String signupDisabled = 'signup_disabled';
  static const String singleIdentityNotDeletable =
      'single_identity_not_deletable';
  static const String smsSendFailed = 'sms_send_failed';
  static const String ssoDomainAlreadyExists = 'sso_domain_already_exists';
  static const String ssoProviderNotFound = 'sso_provider_not_found';
  static const String tooManyEnrolledMfaFactors =
      'too_many_enrolled_mfa_factors';
  static const String unexpectedAudience = 'unexpected_audience';
  static const String unexpectedFailure = 'unexpected_failure';
  static const String userAlreadyExists = 'user_already_exists';
  static const String userBanned = 'user_banned';
  static const String userNotFound =
      'user_not_found'; // note: duplicate with userNotFound above
  static const String userSsoManaged = 'user_sso_managed';
  static const String validationFailed = 'validation_failed';
  static const String weakPassword =
      'weak_password';

  static get userDisabled => null; // duplicate with weakPassword above
}
