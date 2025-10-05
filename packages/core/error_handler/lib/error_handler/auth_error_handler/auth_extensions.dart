import 'package:data/models/failure.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_codes.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_error_massages.dart';
import 'package:error_handler/error_handler/auth_error_handler/auth_type.dart';

extension AuthErrorExtensions on AuthErrorType {
  Failure getFailure() {
    switch (this) {
      case AuthErrorType.anonymousProviderDisabled:
        return Failure(
          code: AuthErrorCodes.anonymousProviderDisabled,
          message: AuthErrorMessages.anonymousProviderDisabled,
        );
      case AuthErrorType.badCodeVerifier:
        return Failure(
          code: AuthErrorCodes.badCodeVerifier,
          message: AuthErrorMessages.badCodeVerifier,
        );
      case AuthErrorType.badJson:
        return Failure(
          code: AuthErrorCodes.badJson,
          message: AuthErrorMessages.badJson,
        );
      case AuthErrorType.badJwt:
        return Failure(
          code: AuthErrorCodes.badJwt,
          message: AuthErrorMessages.badJwt,
        );
      case AuthErrorType.badOauthCallback:
        return Failure(
          code: AuthErrorCodes.badOauthCallback,
          message: AuthErrorMessages.badOauthCallback,
        );
      case AuthErrorType.badOauthState:
        return Failure(
          code: AuthErrorCodes.badOauthState,
          message: AuthErrorMessages.badOauthState,
        );
      case AuthErrorType.captchaFailed:
        return Failure(
          code: AuthErrorCodes.captchaFailed,
          message: AuthErrorMessages.captchaFailed,
        );
      case AuthErrorType.conflict:
        return Failure(
          code: AuthErrorCodes.conflict,
          message: AuthErrorMessages.conflict,
        );
      case AuthErrorType.emailAddressInvalid:
        return Failure(
          code: AuthErrorCodes.emailAddressInvalid,
          message: AuthErrorMessages.emailAddressInvalid,
        );
      case AuthErrorType.emailAddressNotAuthorized:
        return Failure(
          code: AuthErrorCodes.emailAddressNotAuthorized,
          message: AuthErrorMessages.emailAddressNotAuthorized,
        );
      case AuthErrorType.emailConflictIdentityNotDeletable:
        return Failure(
          code: AuthErrorCodes.emailConflictIdentityNotDeletable,
          message: AuthErrorMessages.emailConflictIdentityNotDeletable,
        );
      case AuthErrorType.emailExists:
        return Failure(
          code: AuthErrorCodes.emailExists,
          message: AuthErrorMessages.emailExists,
        );
      case AuthErrorType.emailNotConfirmed:
        return Failure(
          code: AuthErrorCodes.emailNotConfirmed,
          message: AuthErrorMessages.emailNotConfirmed,
        );
      case AuthErrorType.emailProviderDisabled:
        return Failure(
          code: AuthErrorCodes.emailProviderDisabled,
          message: AuthErrorMessages.emailProviderDisabled,
        );
      case AuthErrorType.flowStateExpired:
        return Failure(
          code: AuthErrorCodes.flowStateExpired,
          message: AuthErrorMessages.flowStateExpired,
        );
      case AuthErrorType.flowStateNotFound:
        return Failure(
          code: AuthErrorCodes.flowStateNotFound,
          message: AuthErrorMessages.flowStateNotFound,
        );
      case AuthErrorType.hookPayloadInvalidContentType:
        return Failure(
          code: AuthErrorCodes.hookPayloadInvalidContentType,
          message: AuthErrorMessages.hookPayloadInvalidContentType,
        );
      case AuthErrorType.hookPayloadOverSizeLimit:
        return Failure(
          code: AuthErrorCodes.hookPayloadOverSizeLimit,
          message: AuthErrorMessages.hookPayloadOverSizeLimit,
        );
      case AuthErrorType.hookTimeout:
        return Failure(
          code: AuthErrorCodes.hookTimeout,
          message: AuthErrorMessages.hookTimeout,
        );
      case AuthErrorType.hookTimeoutAfterRetry:
        return Failure(
          code: AuthErrorCodes.hookTimeoutAfterRetry,
          message: AuthErrorMessages.hookTimeoutAfterRetry,
        );
      case AuthErrorType.identityAlreadyExists:
        return Failure(
          code: AuthErrorCodes.identityAlreadyExists,
          message: AuthErrorMessages.identityAlreadyExists,
        );
      case AuthErrorType.identityNotFound:
        return Failure(
          code: AuthErrorCodes.identityNotFound,
          message: AuthErrorMessages.identityNotFound,
        );
      case AuthErrorType.insufficientAal:
        return Failure(
          code: AuthErrorCodes.insufficientAal,
          message: AuthErrorMessages.insufficientAal,
        );
      case AuthErrorType.invalidCredentials:
        return Failure(
          code: AuthErrorCodes.invalidCredentials,
          message: AuthErrorMessages.invalidCredentials,
        );
      case AuthErrorType.inviteNotFound:
        return Failure(
          code: AuthErrorCodes.inviteNotFound,
          message: AuthErrorMessages.inviteNotFound,
        );
      case AuthErrorType.manualLinkingDisabled:
        return Failure(
          code: AuthErrorCodes.manualLinkingDisabled,
          message: AuthErrorMessages.manualLinkingDisabled,
        );
      case AuthErrorType.mfaChallengeExpired:
        return Failure(
          code: AuthErrorCodes.mfaChallengeExpired,
          message: AuthErrorMessages.mfaChallengeExpired,
        );
      case AuthErrorType.mfaFactorNameConflict:
        return Failure(
          code: AuthErrorCodes.mfaFactorNameConflict,
          message: AuthErrorMessages.mfaFactorNameConflict,
        );
      case AuthErrorType.mfaFactorNotFound:
        return Failure(
          code: AuthErrorCodes.mfaFactorNotFound,
          message: AuthErrorMessages.mfaFactorNotFound,
        );
      case AuthErrorType.mfaIpAddressMismatch:
        return Failure(
          code: AuthErrorCodes.mfaIpAddressMismatch,
          message: AuthErrorMessages.mfaIpAddressMismatch,
        );
      case AuthErrorType.mfaPhoneEnrollNotEnabled:
        return Failure(
          code: AuthErrorCodes.mfaPhoneEnrollNotEnabled,
          message: AuthErrorMessages.mfaPhoneEnrollNotEnabled,
        );
      case AuthErrorType.mfaPhoneVerifyNotEnabled:
        return Failure(
          code: AuthErrorCodes.mfaPhoneVerifyNotEnabled,
          message: AuthErrorMessages.mfaPhoneVerifyNotEnabled,
        );
      case AuthErrorType.mfaTotpEnrollNotEnabled:
        return Failure(
          code: AuthErrorCodes.mfaTotpEnrollNotEnabled,
          message: AuthErrorMessages.mfaTotpEnrollNotEnabled,
        );
      case AuthErrorType.mfaTotpVerifyNotEnabled:
        return Failure(
          code: AuthErrorCodes.mfaTotpVerifyNotEnabled,
          message: AuthErrorMessages.mfaTotpVerifyNotEnabled,
        );
      case AuthErrorType.mfaVerificationFailed:
        return Failure(
          code: AuthErrorCodes.mfaVerificationFailed,
          message: AuthErrorMessages.mfaVerificationFailed,
        );
      case AuthErrorType.mfaVerificationRejected:
        return Failure(
          code: AuthErrorCodes.mfaVerificationRejected,
          message: AuthErrorMessages.mfaVerificationRejected,
        );
      case AuthErrorType.mfaVerifiedFactorExists:
        return Failure(
          code: AuthErrorCodes.mfaVerifiedFactorExists,
          message: AuthErrorMessages.mfaVerifiedFactorExists,
        );
      case AuthErrorType.mfaWebAuthnEnrollNotEnabled:
        return Failure(
          code: AuthErrorCodes.mfaWebAuthnEnrollNotEnabled,
          message: AuthErrorMessages.mfaWebAuthnEnrollNotEnabled,
        );
      case AuthErrorType.mfaWebAuthnVerifyNotEnabled:
        return Failure(
          code: AuthErrorCodes.mfaWebAuthnVerifyNotEnabled,
          message: AuthErrorMessages.mfaWebAuthnVerifyNotEnabled,
        );
      case AuthErrorType.noAuthorization:
        return Failure(
          code: AuthErrorCodes.noAuthorization,
          message: AuthErrorMessages.noAuthorization,
        );
      case AuthErrorType.notAdmin:
        return Failure(
          code: AuthErrorCodes.notAdmin,
          message: AuthErrorMessages.notAdmin,
        );
      case AuthErrorType.oauthProviderNotSupported:
        return Failure(
          code: AuthErrorCodes.oauthProviderNotSupported,
          message: AuthErrorMessages.oauthProviderNotSupported,
        );
      case AuthErrorType.otpDisabled:
        return Failure(
          code: AuthErrorCodes.otpDisabled,
          message: AuthErrorMessages.otpDisabled,
        );
      case AuthErrorType.otpExpired:
        return Failure(
          code: AuthErrorCodes.otpExpired,
          message: AuthErrorMessages.otpExpired,
        );
      case AuthErrorType.overEmailSendRateLimit:
        return Failure(
          code: AuthErrorCodes.overEmailSendRateLimit,
          message: AuthErrorMessages.overEmailSendRateLimit,
        );
      case AuthErrorType.overRequestRateLimit:
        return Failure(
          code: AuthErrorCodes.overRequestRateLimit,
          message: AuthErrorMessages.overRequestRateLimit,
        );
      case AuthErrorType.overSmsSendRateLimit:
        return Failure(
          code: AuthErrorCodes.overSmsSendRateLimit,
          message: AuthErrorMessages.overSmsSendRateLimit,
        );
      case AuthErrorType.phoneExists:
        return Failure(
          code: AuthErrorCodes.phoneExists,
          message: AuthErrorMessages.phoneExists,
        );
      case AuthErrorType.phoneNotConfirmed:
        return Failure(
          code: AuthErrorCodes.phoneNotConfirmed,
          message: AuthErrorMessages.phoneNotConfirmed,
        );
      case AuthErrorType.phoneProviderDisabled:
        return Failure(
          code: AuthErrorCodes.phoneProviderDisabled,
          message: AuthErrorMessages.phoneProviderDisabled,
        );
      case AuthErrorType.providerDisabled:
        return Failure(
          code: AuthErrorCodes.providerDisabled,
          message: AuthErrorMessages.providerDisabled,
        );
      case AuthErrorType.providerEmailNeedsVerification:
        return Failure(
          code: AuthErrorCodes.providerEmailNeedsVerification,
          message: AuthErrorMessages.providerEmailNeedsVerification,
        );
      case AuthErrorType.reauthenticationNeeded:
        return Failure(
          code: AuthErrorCodes.reauthenticationNeeded,
          message: AuthErrorMessages.reauthenticationNeeded,
        );
      case AuthErrorType.reauthenticationNotValid:
        return Failure(
          code: AuthErrorCodes.reauthenticationNotValid,
          message: AuthErrorMessages.reauthenticationNotValid,
        );
      case AuthErrorType.refreshTokenAlreadyUsed:
        return Failure(
          code: AuthErrorCodes.refreshTokenAlreadyUsed,
          message: AuthErrorMessages.refreshTokenAlreadyUsed,
        );
      case AuthErrorType.refreshTokenNotFound:
        return Failure(
          code: AuthErrorCodes.refreshTokenNotFound,
          message: AuthErrorMessages.refreshTokenNotFound,
        );
      case AuthErrorType.requestTimeout:
        return Failure(
          code: AuthErrorCodes.requestTimeout,
          message: AuthErrorMessages.requestTimeout,
        );
      case AuthErrorType.samePassword:
        return Failure(
          code: AuthErrorCodes.samePassword,
          message: AuthErrorMessages.samePassword,
        );
      case AuthErrorType.samlAssertionNoEmail:
        return Failure(
          code: AuthErrorCodes.samlAssertionNoEmail,
          message: AuthErrorMessages.samlAssertionNoEmail,
        );
      case AuthErrorType.samlAssertionNoUserId:
        return Failure(
          code: AuthErrorCodes.samlAssertionNoUserId,
          message: AuthErrorMessages.samlAssertionNoUserId,
        );
      case AuthErrorType.samlEntityIdMismatch:
        return Failure(
          code: AuthErrorCodes.samlEntityIdMismatch,
          message: AuthErrorMessages.samlEntityIdMismatch,
        );
      case AuthErrorType.samlIdpAlreadyExists:
        return Failure(
          code: AuthErrorCodes.samlIdpAlreadyExists,
          message: AuthErrorMessages.samlIdpAlreadyExists,
        );
      case AuthErrorType.samlIdpNotFound:
        return Failure(
          code: AuthErrorCodes.samlIdpNotFound,
          message: AuthErrorMessages.samlIdpNotFound,
        );
      case AuthErrorType.samlMetadataFetchFailed:
        return Failure(
          code: AuthErrorCodes.samlMetadataFetchFailed,
          message: AuthErrorMessages.samlMetadataFetchFailed,
        );
      case AuthErrorType.samlProviderDisabled:
        return Failure(
          code: AuthErrorCodes.samlProviderDisabled,
          message: AuthErrorMessages.samlProviderDisabled,
        );
      case AuthErrorType.samlRelayStateExpired:
        return Failure(
          code: AuthErrorCodes.samlRelayStateExpired,
          message: AuthErrorMessages.samlRelayStateExpired,
        );
      case AuthErrorType.samlRelayStateNotFound:
        return Failure(
          code: AuthErrorCodes.samlRelayStateNotFound,
          message: AuthErrorMessages.samlRelayStateNotFound,
        );
      case AuthErrorType.sessionExpired:
        return Failure(
          code: AuthErrorCodes.sessionExpired,
          message: AuthErrorMessages.sessionExpired,
        );
      case AuthErrorType.sessionNotFound:
        return Failure(
          code: AuthErrorCodes.sessionNotFound,
          message: AuthErrorMessages.sessionNotFound,
        );
      case AuthErrorType.signupDisabled:
        return Failure(
          code: AuthErrorCodes.signupDisabled,
          message: AuthErrorMessages.signupDisabled,
        );
      case AuthErrorType.singleIdentityNotDeletable:
        return Failure(
          code: AuthErrorCodes.singleIdentityNotDeletable,
          message: AuthErrorMessages.singleIdentityNotDeletable,
        );
      case AuthErrorType.smsSendFailed:
        return Failure(
          code: AuthErrorCodes.smsSendFailed,
          message: AuthErrorMessages.smsSendFailed,
        );
      case AuthErrorType.ssoDomainAlreadyExists:
        return Failure(
          code: AuthErrorCodes.ssoDomainAlreadyExists,
          message: AuthErrorMessages.ssoDomainAlreadyExists,
        );
      case AuthErrorType.ssoProviderNotFound:
        return Failure(
          code: AuthErrorCodes.ssoProviderNotFound,
          message: AuthErrorMessages.ssoProviderNotFound,
        );
      case AuthErrorType.tooManyEnrolledMfaFactors:
        return Failure(
          code: AuthErrorCodes.tooManyEnrolledMfaFactors,
          message: AuthErrorMessages.tooManyEnrolledMfaFactors,
        );
      case AuthErrorType.unexpectedAudience:
        return Failure(
          code: AuthErrorCodes.unexpectedAudience,
          message: AuthErrorMessages.unexpectedAudience,
        );
      case AuthErrorType.unexpectedFailure:
        return Failure(
          code: AuthErrorCodes.unexpectedFailure,
          message: AuthErrorMessages.unexpectedFailure,
        );
      case AuthErrorType.userAlreadyExists:
        return Failure(
          code: AuthErrorCodes.userAlreadyExists,
          message: AuthErrorMessages.userAlreadyExists,
        );
      case AuthErrorType.userBanned:
        return Failure(
          code: AuthErrorCodes.userBanned,
          message: AuthErrorMessages.userBanned,
        );
      case AuthErrorType.userNotFound:
        return Failure(
          code: AuthErrorCodes.userNotFound,
          message: AuthErrorMessages.userNotFound,
        );
      case AuthErrorType.userSsoManaged:
        return Failure(
          code: AuthErrorCodes.userSsoManaged,
          message: AuthErrorMessages.userSsoManaged,
        );
      case AuthErrorType.validationFailed:
        return Failure(
          code: AuthErrorCodes.validationFailed,
          message: AuthErrorMessages.validationFailed,
        );
      case AuthErrorType.weakPassword:
        return Failure(
          code: AuthErrorCodes.weakPassword,
          message: AuthErrorMessages.weakPassword,
        );
      case AuthErrorType.unknown:
        return Failure(
          code: AuthErrorCodes.unknown,
          message: AuthErrorMessages.unknown,
        );
    }
  }
}
