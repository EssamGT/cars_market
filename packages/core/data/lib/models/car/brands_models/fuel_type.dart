import 'package:constants/strings_manager.dart';

final List<String> fuelTypes = [
  "Petrol",
  "Diesel",
  "Hybrid",
  "Electric",
  "Natural Gas",
];

enum FuelType {
  none,
  petrol,
  diesel,
  naturalGas,
  hybrid,
  plugInHybrid,
  electric,
}

extension FuelTypeExtension on FuelType {
  String getFuelTypeName() {
    switch (this) {
      case FuelType.petrol:
        return StringsManager.petrol;
      case FuelType.diesel:
        return StringsManager.diesel;
      case FuelType.electric:
        return StringsManager.electric;
      case FuelType.hybrid:
        return StringsManager.hybrid;
      case FuelType.naturalGas:
        return StringsManager.naturalGas;
      case FuelType.plugInHybrid:
        return StringsManager.plugInHybrid;
      default:
        return '';
    }
  }

  String getFuelTypeNameForFilter() {
    switch (this) {
      case FuelType.petrol:
        return StringsManager.petrol;
      case FuelType.diesel:
        return StringsManager.diesel;
      case FuelType.electric:
        return StringsManager.electric;
      case FuelType.hybrid:
        return StringsManager.hybrid;
      case FuelType.naturalGas:
        return StringsManager.naturalGas;
      case FuelType.plugInHybrid:
        return StringsManager.plugInHybrid;
      default:
        return StringsManager.all;
    }
  }
}
