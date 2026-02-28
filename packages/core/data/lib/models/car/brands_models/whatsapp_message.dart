import 'package:constants/strings_manager.dart';

enum WhatsAppMessage { yes, no, none }

extension WhatsAppMessageExtension on WhatsAppMessage {
  String getConditionText() {
    switch (this) {
      case WhatsAppMessage.yes:
        return StringsManager.yes;
      case WhatsAppMessage.no:
        return StringsManager.no;
      case WhatsAppMessage.none:
        return StringsManager.none;
    }
  }
}
