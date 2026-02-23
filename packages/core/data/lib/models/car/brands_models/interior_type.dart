import 'package:constants/strings_manager.dart';

enum InteriorType { cloth, fullLather, partLather, velour, other, none }

extension InteriorTypeExtension on InteriorType {
  String get getText {
    switch (this) {
      case InteriorType.cloth:
        return StringsManager.clothSeats;
      case InteriorType.fullLather:
        return StringsManager.leatherSeats;
      case InteriorType.partLather:
        return StringsManager.partLeatherSeats;
      case InteriorType.velour:
        return StringsManager.velourSeats;
      case InteriorType.other:
        return StringsManager.other;
      case InteriorType.none:
        return StringsManager.selectInteriorType;
    }
  }

  String get getTextForDetails {
    switch (this) {
      case InteriorType.cloth:
        return StringsManager.clothSeats;
      case InteriorType.fullLather:
        return StringsManager.leatherSeats;
      case InteriorType.partLather:
        return StringsManager.partLeatherSeats;
      case InteriorType.velour:
        return StringsManager.velourSeats;
      case InteriorType.other:
        return StringsManager.other;
      case InteriorType.none:
        return "";
    }
  }
}
