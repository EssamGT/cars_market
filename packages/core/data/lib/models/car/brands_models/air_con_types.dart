import 'package:constants/strings_manager.dart';

enum AirConTypes {
  manual,
  automatic,
  automatic2Zones,
  automatic3Zones,
  automatic4Zones,
  none,
}

extension AirConTypesExtension on AirConTypes {
  String get getText {
    switch (this) {
      case AirConTypes.manual:
        return StringsManager.manualAcLabel;
      case AirConTypes.automatic:
        return StringsManager.automaticAcLabel;
      case AirConTypes.automatic2Zones:
        return StringsManager.automatic2ZonesAcLabel;
      case AirConTypes.automatic3Zones:
        return StringsManager.automatic3ZonesAcLabel;
      case AirConTypes.automatic4Zones:
        return StringsManager.automatic4ZonesAcLabel;
      case AirConTypes.none:
        return StringsManager.selectAircon;
    }
  }

  String get getTextForDetails {
    switch (this) {
      case AirConTypes.manual:
        return StringsManager.manualAcLabel;
      case AirConTypes.automatic:
        return StringsManager.automaticAcLabel;
      case AirConTypes.automatic2Zones:
        return StringsManager.automatic2ZonesAcLabel;
      case AirConTypes.automatic3Zones:
        return StringsManager.automatic3ZonesAcLabel;
      case AirConTypes.automatic4Zones:
        return StringsManager.automatic4ZonesAcLabel;
      case AirConTypes.none:
        return '';
    }
  }
}
