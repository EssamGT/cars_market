import 'package:constants/strings_manager.dart';

class ErrorStrings {
  static String get success => StringsManager.success;
  static String get noContent => StringsManager.notFound;
  static String get badRequest => StringsManager.badRequest;
  static String get unauthorized => StringsManager.unauthorized;
  static String get forbidden => StringsManager.forbidden;
  static String get internalServerError => StringsManager.internalError;
  static String get connectTimeOut => StringsManager.timeout;
  static String get cancelled => StringsManager.cancelled;
  static String get receivedTimeout => StringsManager.timeout;
  static String get sendTimeout => StringsManager.timeout;
  static  String get cacheError => StringsManager.error;
  static String get noInternetConnection => StringsManager.noInternet;
  static String get defaultError => StringsManager.firebaseUnknown;
}
