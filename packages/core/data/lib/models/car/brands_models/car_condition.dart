import 'package:constants/strings_manager.dart';

enum CarConditionType { newCar, usedCar, accidented, none }

extension CarConditionTypeExtension on CarConditionType {
  String getConditionText() {
    switch (this) {
      case CarConditionType.newCar:
        return StringsManager.newLabel;
      case CarConditionType.usedCar:
        return StringsManager.usedLabel;
      case CarConditionType.accidented:
        return StringsManager.accidentedLabel;
      default:
        return '';
    }
  }
}
