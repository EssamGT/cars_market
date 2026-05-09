enum FirebaseErrorType {
  // Firestore
  cancelled,
  invalidArgument,
  deadlineExceeded,
  notFound,
  alreadyExists,
  permissionDenied,
  resourceExhausted,
  failedPrecondition,
  aborted,
  outOfRange,
  unimplemented,
  internal,
  unavailable,
  dataLoss,
  unauthenticated,

  // Storage
  objectNotFound,
  bucketNotFound,
  projectNotFound,
  quotaExceeded,
  unauthorized,
  retryLimitExceeded,
  invalidChecksum,
  canceled,
  downloadSizeExceeded,

  // Fallback
  unknown,
}
