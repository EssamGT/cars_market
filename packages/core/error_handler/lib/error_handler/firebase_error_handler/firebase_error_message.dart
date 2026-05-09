class FirebaseErrorMessage {
  // Firestore messages
  static const String cancelled =
      'The operation was cancelled before it completed.';
  static const String invalidArgument =
      'Invalid data was sent. Please check your input and try again.';
  static const String deadlineExceeded =
      'The request took too long and timed out. Please try again.';
  static const String notFound =
      'The requested document was not found.';
  static const String alreadyExists =
      'The item already exists.';
  static const String permissionDenied =
      'You do not have permission to perform this action.';
  static const String resourceExhausted =
      'Resource limit reached. Please try again later.';
  static const String failedPrecondition =
      'Operation cannot be executed in the current state.';
  static const String aborted =
      'Operation was aborted due to a conflict. Please retry.';
  static const String outOfRange =
      'Value is out of allowed range.';
  static const String unimplemented =
      'This operation is not supported.';
  static const String internal =
      'Internal server error occurred. Please try again later.';
  static const String unavailable =
      'Service is currently unavailable. Please try again soon.';
  static const String dataLoss =
      'Unexpected data loss occurred. Please contact support.';
  static const String unauthenticated =
      'You need to sign in again to continue.';

  // Firebase Storage messages
  static const String objectNotFound =
      'The requested file was not found in storage.';
  static const String bucketNotFound =
      'Storage bucket was not found. Please check your configuration.';
  static const String projectNotFound =
      'Firebase project was not found. Please check your setup.';
  static const String quotaExceeded =
      'Storage quota has been exceeded. Please try again later.';
  static const String unauthorized =
      'You are not authorized to access this file.';
  static const String retryLimitExceeded =
      'Operation retried too many times. Please try again.';
  static const String invalidChecksum =
      'File upload failed due to checksum mismatch. Try uploading again.';
  static const String canceled =
      'The operation was canceled before completion.';
  static const String downloadSizeExceeded =
      'Download size exceeds the allowed limit.';

  // Shared fallback
  static const String unknown =
      'An unexpected Firebase error occurred. Please try again later.';
}
