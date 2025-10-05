class ResponseCode {
  static const String success = '200';
  static const String noContent = '204';
  static const String badRequest = '400';
  static const String unauthorized = '401';
  static const String forbidden = '403';
  static const String internalServerError = '500';
  static const String notFound = '404';

  static const String connectTimeout = '-1';
  static const String cancelled = '-2';
  static const String receivedTimeout = ' -3';
  static const String sendTimeout = '-4';
  static const String cacheError = '-5';
  static const String noInternetConnection = '-6';
  static const String defaultError = '-7';
  // Add more response codes as needed
}
