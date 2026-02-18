import 'package:constants/strings_manager.dart';

final List<String> gearboxTypes = ["Automatic", "Manual"];
final List<String> filterGearboxTypes = ["Any", "Automatic", "Manual"];

enum TransmissionType { automatic, manual, none }

extension TransmissionTypeExtension on TransmissionType {
  String getTransmissionTypeName() {
    switch (this) {
      case TransmissionType.automatic:
        return StringsManager.automatic;
      case TransmissionType.manual:
        return StringsManager.manual;
      default:
        return '';
    }
  }
}
