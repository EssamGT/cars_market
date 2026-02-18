import 'package:constants/strings_manager.dart';

enum WahtsaapMessage { yes, no, none }

extension WahtsaapMessageExtension on WahtsaapMessage {
  String getConditionText() {
    switch (this) {
      case WahtsaapMessage.yes:
        return StringsManager.yes;
      case WahtsaapMessage.no:
        return StringsManager.no;
      case WahtsaapMessage.none:
        return StringsManager.none;
    }
  }
}
