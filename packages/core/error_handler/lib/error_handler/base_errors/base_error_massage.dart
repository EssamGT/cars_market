// Human friendly messages for base errors (network/HTTP/general)
class BaseErrorMessage {
  static const String noInternet =
	  'No internet connection. Please check your network and try again.';
  static const String timeout =
	  'The request timed out. Please try again later.';
  static const String cancelled = 'The operation was cancelled.';
  static const String badRequest = 'Bad request. Please check and try again.';
  static const String unauthorized =
	  'You are not authorized to perform this action. Please sign in.';
  static const String forbidden =
	  'You do not have permission to perform this action.';
  static const String notFound = 'Requested resource was not found.';
  static const String serviceUnavailable =
	  'Service is unavailable. Please try again later.';
  static const String networkRequestFailed =
	  'Network error. Check your internet connection and try again.';
  static const String unknown = 'An unexpected error occurred. Please try again.';
}

