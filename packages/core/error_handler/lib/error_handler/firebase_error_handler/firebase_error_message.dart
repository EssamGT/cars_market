import 'package:constants/strings_manager.dart';

class FirebaseErrorMessage {
  // Firestore messages
  static String get cancelled => StringsManager.firebaseCancel;
  static String get invalidArgument => StringsManager.firebaseInvalidArgument;
  static String get deadlineExceeded => StringsManager.firebaseDeadlineExceeded;
  static String get notFound => StringsManager.firebaseNotFound;
  static String get alreadyExists => StringsManager.firebaseAlreadyExists;
  static String get permissionDenied => StringsManager.firebasePermissionDenied;
  static String get resourceExhausted => StringsManager.firebaseResourceExhausted;
  static String get failedPrecondition => StringsManager.firebaseFailedPrecondition;
  static String get aborted => StringsManager.firebaseAborted;
  static String get outOfRange => StringsManager.firebaseOutOfRange;
  static String get unimplemented => StringsManager.firebaseUnimplemented;
  static String get internal => StringsManager.firebaseInternal;
  static String get unavailable => StringsManager.firebaseUnavailable;
  static String get dataLoss => StringsManager.firebaseDataLoss;
  static String get unauthenticated => StringsManager.firebaseUnauthenticated;

  // Firebase Storage messages
  static String get objectNotFound => StringsManager.firebaseObjectNotFound;
  static String get bucketNotFound => StringsManager.firebaseBucketNotFound;
  static String get projectNotFound => StringsManager.firebaseProjectNotFound;
  static String get quotaExceeded => StringsManager.firebaseQuotaExceeded;
  static String get unauthorized => StringsManager.firebaseUnauthorized;
  static String get retryLimitExceeded => StringsManager.firebaseRetryLimitExceeded;
  static String get invalidChecksum => StringsManager.firebaseInvalidChecksum;
  static String get canceled => StringsManager.firebaseCanceled;
  static String get downloadSizeExceeded => StringsManager.firebaseDownloadSizeExceeded;

  // Shared fallback
  static String get unknown => StringsManager.firebaseUnknown;
}
