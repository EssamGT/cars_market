class FirebaseErrorCode {
  // Firestore error codes
  static const String cancelled = 'cancelled';
  static const String invalidArgument = 'invalid-argument';
  static const String deadlineExceeded = 'deadline-exceeded';
  static const String notFound = 'not-found';
  static const String alreadyExists = 'already-exists';
  static const String permissionDenied = 'permission-denied';
  static const String resourceExhausted = 'resource-exhausted';
  static const String failedPrecondition = 'failed-precondition';
  static const String aborted = 'aborted';
  static const String outOfRange = 'out-of-range';
  static const String unimplemented = 'unimplemented';
  static const String internal = 'internal';
  static const String unavailable = 'unavailable';
  static const String dataLoss = 'data-loss';
  static const String unauthenticated = 'unauthenticated';

  // Firebase Storage error codes
  static const String objectNotFound = 'object-not-found';
  static const String bucketNotFound = 'bucket-not-found';
  static const String projectNotFound = 'project-not-found';
  static const String quotaExceeded = 'quota-exceeded';
  static const String unauthorized = 'unauthorized';
  static const String retryLimitExceeded = 'retry-limit-exceeded';
  static const String invalidChecksum = 'invalid-checksum';
  static const String canceled = 'canceled';
  static const String downloadSizeExceeded = 'download-size-exceeded';

  // Shared / fallback
  static const String unknown = 'unknown';
}
