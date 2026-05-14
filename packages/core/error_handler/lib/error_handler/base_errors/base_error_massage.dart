import 'package:constants/strings_manager.dart';

// Human friendly messages for base errors (network/HTTP/general)
class BaseErrorMessage {
  static String get noInternet => StringsManager.noInternet;
  static String get timeout => StringsManager.timeout;
  static String get cancelled => StringsManager.cancelled;
  static String get badRequest => StringsManager.badRequest;
  static String get unauthorized => StringsManager.unauthorized;
  static String get forbidden => StringsManager.forbidden;
  static String get notFound => StringsManager.notFound;
  static String get serviceUnavailable => StringsManager.serviceUnavailable;
  static String get networkRequestFailed => StringsManager.networkRequestFailed;
  static const String unknown = 'An unexpected error occurred. Please try again.';
}

