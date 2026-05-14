import 'package:cars_market/generated/l10n.dart';
import 'package:intl/intl.dart';

class LocalizationService {
  static late S _currentLocalizations;

  /// Initialize the service with the current AppLocalizations
  static void initialize(S localizations) {
    _currentLocalizations = localizations;
  }

  /// Update localizations when locale changes
  static void updateLocalizations(S localizations) {
    _currentLocalizations = localizations;
  }

  /// Get current localizations
  static S get strings => _currentLocalizations;

  static bool get isRTL => Intl.getCurrentLocale() == 'ar';
  static bool isArabic(String text) {
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
  }
}
