import 'package:constants/strings_manager.dart';

enum NegotiationType { yes, no, none }

extension NegotiationTypeExtension on NegotiationType {
  String getConditionText() {
    switch (this) {
      case NegotiationType.yes:
        return StringsManager.yes;
      case NegotiationType.no:
        return StringsManager.no;
      case NegotiationType.none:
        return StringsManager.none;
    }
  }
}
