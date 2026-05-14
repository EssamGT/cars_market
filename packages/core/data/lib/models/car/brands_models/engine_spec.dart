import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:domain/entity/car_entitys/engine_spec_entity.dart';

enum EngineCylinderNumber { i3, i4, i5, i6, v6, v8, v10, v12, v16, none }

extension EngineCylinderNumberExtension on EngineCylinderNumber {
  String getEngineCylinderNumberName() {
    switch (this) {
      case EngineCylinderNumber.i3:
        return StringsManager.i3Engine;
      case EngineCylinderNumber.i4:
        return StringsManager.i4Engine;
      case EngineCylinderNumber.i5:
        return StringsManager.i5Engine;
      case EngineCylinderNumber.i6:
        return StringsManager.i6Engine;
      case EngineCylinderNumber.v6:
        return StringsManager.v6Engine;
      case EngineCylinderNumber.v8:
        return StringsManager.v8Engine;
      case EngineCylinderNumber.v10:
        return StringsManager.v10Engine;
      case EngineCylinderNumber.v12:
        return StringsManager.v12Engine;
      case EngineCylinderNumber.v16:
        return StringsManager.v16Engine;
      case EngineCylinderNumber.none:
        return StringsManager.selectEngineCylinder;
    }
  }

  String getEngineCylinderNumberNameOnly() {
    switch (this) {
      case EngineCylinderNumber.i3:
        return StringsManager.i3Engine;
      case EngineCylinderNumber.i4:
        return StringsManager.i4Engine;
      case EngineCylinderNumber.i5:
        return StringsManager.i5Engine;
      case EngineCylinderNumber.i6:
        return StringsManager.s6Engine;
      case EngineCylinderNumber.v6:
        return StringsManager.s6Engine;
      case EngineCylinderNumber.v8:
        return StringsManager.v8Engine;
      case EngineCylinderNumber.v10:
        return StringsManager.v10Engine;
      case EngineCylinderNumber.v12:
        return StringsManager.v12Engine;
      case EngineCylinderNumber.v16:
        return StringsManager.v16Engine;
      case EngineCylinderNumber.none:
        return StringsManager.selectEngineCylinder;
    }
  }

  String getEngineType() {
    switch (this) {
      case EngineCylinderNumber.i3:
        return StringsManager.i3EngineSpec;
      case EngineCylinderNumber.i4:
        return StringsManager.i4EngineSpec;
      case EngineCylinderNumber.i5:
        return StringsManager.i5EngineSpec;
      case EngineCylinderNumber.i6:
        return StringsManager.i6EngineSpec;
      case EngineCylinderNumber.v6:
        return StringsManager.v6EngineSpec;
      case EngineCylinderNumber.v8:
        return StringsManager.v8EngineSpec;
      case EngineCylinderNumber.v10:
        return StringsManager.v10EngineSpec;
      case EngineCylinderNumber.v12:
        return StringsManager.v12EngineSpec;
      case EngineCylinderNumber.v16:
        return StringsManager.none;
      case EngineCylinderNumber.none:
        return '';
    }
  }

  List<EngineCapacityModel> getEngineCapacity() {
    switch (this) {
      case EngineCylinderNumber.i3:
        return i3EngineCapacities;

      case EngineCylinderNumber.i4:
        return i4EngineCapacities;
      case EngineCylinderNumber.i5:
        return i5EngineCapacities;
      case EngineCylinderNumber.i6:
        return i6EngineCapacities;
      case EngineCylinderNumber.v6:
        return v6EngineCapacities;

      case EngineCylinderNumber.v8:
        return v8EngineCapacities;
      case EngineCylinderNumber.v10:
        return v10EngineCapacities;

      case EngineCylinderNumber.v12:
        return v12EngineCapacities;
      case EngineCylinderNumber.v16:
        return v16EngineCapacities;
      case EngineCylinderNumber.none:
        return [];
    }
  }
}

// final List<String> engineCapacity = [
//   "EV",
//   "800",
//   "1000",
//   "1100",
//   "1200",
//   "1300",
//   "1400",
//   "1500",
//   "1600",
//   "1700",
//   "1800",
//   "1900",
//   "2000",
//   "2100",
//   "2200",
//   "2300",
//   "2400",
//   "2500",
//   "2600",
//   "2700",
//   "2800",
//   "2900",
//   "3000",
//   "3200",
//   "3300",
//   "3500",
//   "3600",
//   "3700",
//   "4000",
//   "4200",
//   "4400",
//   "4500",
//   "4800",
//   "5000",
//   "5200",
//   "5500",
//   "5700",
//   "6000",
//   "6200",
//   "6500",
//   "7000",
//   "7700",
//   "8000",
// ];

enum EngineCapacity {
  c600,
  c700,
  c800,
  c1000,
  c1100,
  c1200,
  c1300,
  c1400,
  c1500,
  c1600,
  c1800,
  c2000,
  c2100,
  c2200,
  c2300,
  c2400,
  c2500,
  c2600,
  c2700,
  c2800,
  c2900,
  c3000,
  c3200,
  c3300,
  c3400,
  c3500,
  c3600,
  c3700,
  c3800,
  c4000,
  c4100,
  c4200,
  c4400,
  c4500,
  c4600,
  c4800,
  c5000,
  c5200,
  c5300,
  c5500,
  c5700,
  c5800,
  c6000,
  c6200,
  c6300,
  c6400,
  c6500,
  c6600,
  c7000,
  c7200,
  c7500,
  c8000,
  none,
}

extension EngineCapacityExtension on EngineCapacity {
  String getEngineCapacityName([bool filter = false]) {
    switch (this) {
      case EngineCapacity.c600:
        return StringsManager.c600;
      case EngineCapacity.c700:
        return StringsManager.c700;
      case EngineCapacity.c800:
        return StringsManager.c800;
      case EngineCapacity.c1000:
        return StringsManager.c1000;
      case EngineCapacity.c1100:
        return StringsManager.c1100;
      case EngineCapacity.c1200:
        return StringsManager.c1200;
      case EngineCapacity.c1300:
        return StringsManager.c1300;
      case EngineCapacity.c1400:
        return StringsManager.c1400;
      case EngineCapacity.c1500:
        return StringsManager.c1500;
      case EngineCapacity.c1600:
        return StringsManager.c1600;
      case EngineCapacity.c1800:
        return StringsManager.c1800;
      case EngineCapacity.c2000:
        return StringsManager.c2000;
      case EngineCapacity.c2100:
        return StringsManager.c2100;
      case EngineCapacity.c2200:
        return StringsManager.c2200;
      case EngineCapacity.c2300:
        return StringsManager.c2300;
      case EngineCapacity.c2400:
        return StringsManager.c2400;
      case EngineCapacity.c2500:
        return StringsManager.c2500;
      case EngineCapacity.c2600:
        return StringsManager.c2600;
      case EngineCapacity.c2700:
        return StringsManager.c2700;
      case EngineCapacity.c2800:
        return StringsManager.c2800;
      case EngineCapacity.c2900:
        return StringsManager.c2900;
      case EngineCapacity.c3000:
        return StringsManager.c3000;
      case EngineCapacity.c3200:
        return StringsManager.c3200;
      case EngineCapacity.c3300:
        return StringsManager.c3300;
      case EngineCapacity.c3400:
        return StringsManager.c3400;
      case EngineCapacity.c3500:
        return StringsManager.c3500;
      case EngineCapacity.c3600:
        return StringsManager.c3600;
      case EngineCapacity.c3700:
        return StringsManager.c3700;
      case EngineCapacity.c3800:
        return StringsManager.c3800;
      case EngineCapacity.c4000:
        return StringsManager.c4000;
      case EngineCapacity.c4100:
        return StringsManager.c4100;
      case EngineCapacity.c4200:
        return StringsManager.c4200;
      case EngineCapacity.c4400:
        return StringsManager.c4400;
      case EngineCapacity.c4500:
        return StringsManager.c4500;
      case EngineCapacity.c4600:
        return StringsManager.c4600;
      case EngineCapacity.c4800:
        return StringsManager.c4800;
      case EngineCapacity.c5000:
        return StringsManager.c5000;
      case EngineCapacity.c5200:
        return StringsManager.c5200;
      case EngineCapacity.c5300:
        return StringsManager.c5300;
      case EngineCapacity.c5500:
        return StringsManager.c5500;
      case EngineCapacity.c5700:
        return StringsManager.c5700;
      case EngineCapacity.c5800:
        return StringsManager.c5800;
      case EngineCapacity.c6000:
        return StringsManager.c6000;
      case EngineCapacity.c6200:
        return StringsManager.c6200;
      case EngineCapacity.c6300:
        return StringsManager.c6300;
      case EngineCapacity.c6400:
        return StringsManager.c6400;
      case EngineCapacity.c6500:
        return StringsManager.c6500;
      case EngineCapacity.c6600:
        return StringsManager.c6600;
      case EngineCapacity.c7000:
        return StringsManager.c7000;
      case EngineCapacity.c7200:
        return StringsManager.c7200;
      case EngineCapacity.c7500:
        return StringsManager.c7500;
      case EngineCapacity.c8000:
        return StringsManager.c8000;
      case EngineCapacity.none:
        if (filter) {
          return StringsManager.none;
        }
        return StringsManager.selectEngineCapacity;
    }
  }

  String getEngineCapacityValue() {
    switch (this) {
      case EngineCapacity.c600:
        return StringsManager.c600Value;
      case EngineCapacity.c700:
        return StringsManager.c700Value;
      case EngineCapacity.c800:
        return StringsManager.c800Value;
      case EngineCapacity.c1000:
        return StringsManager.c1000Value;
      case EngineCapacity.c1100:
        return StringsManager.c1100Value;
      case EngineCapacity.c1200:
        return StringsManager.c1200Value;
      case EngineCapacity.c1300:
        return StringsManager.c1300Value;
      case EngineCapacity.c1400:
        return StringsManager.c1400Value;
      case EngineCapacity.c1500:
        return StringsManager.c1500Value;
      case EngineCapacity.c1600:
        return StringsManager.c1600Value;
      case EngineCapacity.c1800:
        return StringsManager.c1800Value;
      case EngineCapacity.c2000:
        return StringsManager.c2000Value;
      case EngineCapacity.c2100:
        return StringsManager.c2100Value;
      case EngineCapacity.c2200:
        return StringsManager.c2200Value;
      case EngineCapacity.c2300:
        return StringsManager.c2300Value;
      case EngineCapacity.c2400:
        return StringsManager.c2400Value;
      case EngineCapacity.c2500:
        return StringsManager.c2500Value;
      case EngineCapacity.c2600:
        return StringsManager.c2600Value;
      case EngineCapacity.c2700:
        return StringsManager.c2700Value;
      case EngineCapacity.c2800:
        return StringsManager.c2800Value;
      case EngineCapacity.c2900:
        return StringsManager.c2900Value;
      case EngineCapacity.c3000:
        return StringsManager.c3000Value;
      case EngineCapacity.c3200:
        return StringsManager.c3200Value;
      case EngineCapacity.c3300:
        return StringsManager.c3300Value;
      case EngineCapacity.c3400:
        return StringsManager.c3400Value;
      case EngineCapacity.c3500:
        return StringsManager.c3500Value;
      case EngineCapacity.c3600:
        return StringsManager.c3600Value;
      case EngineCapacity.c3700:
        return StringsManager.c3700Value;
      case EngineCapacity.c3800:
        return StringsManager.c3800Value;
      case EngineCapacity.c4000:
        return StringsManager.c4000Value;
      case EngineCapacity.c4100:
        return StringsManager.c4100Value;
      case EngineCapacity.c4200:
        return StringsManager.c4200Value;
      case EngineCapacity.c4400:
        return StringsManager.c4400Value;
      case EngineCapacity.c4500:
        return StringsManager.c4500Value;
      case EngineCapacity.c4600:
        return StringsManager.c4600Value;
      case EngineCapacity.c4800:
        return StringsManager.c4800Value;
      case EngineCapacity.c5000:
        return StringsManager.c5000Value;
      case EngineCapacity.c5200:
        return StringsManager.c5200Value;
      case EngineCapacity.c5300:
        return StringsManager.c5300Value;
      case EngineCapacity.c5500:
        return StringsManager.c5500Value;
      case EngineCapacity.c5700:
        return StringsManager.c5700Value;
      case EngineCapacity.c5800:
        return StringsManager.c5800Value;
      case EngineCapacity.c6000:
        return StringsManager.c6000Value;
      case EngineCapacity.c6200:
        return StringsManager.c6200Value;
      case EngineCapacity.c6300:
        return StringsManager.c6300Value;
      case EngineCapacity.c6400:
        return StringsManager.c6400Value;
      case EngineCapacity.c6500:
        return StringsManager.c6500Value;
      case EngineCapacity.c6600:
        return StringsManager.c6600Value;
      case EngineCapacity.c7000:
        return StringsManager.c7000Value;
      case EngineCapacity.c7200:
        return StringsManager.c7200Value;
      case EngineCapacity.c7500:
        return StringsManager.c7500Value;
      case EngineCapacity.c8000:
        return StringsManager.c8000Value;
      case EngineCapacity.none:
        return "0";
    }
  }
}

class EngineSpec {
  EngineCapacityModel engineCapacity;
  EngineCylinderNumber engineCylinderNumber;
  String? hp;
  String? topSpeed;
  String? fuelConsumption;
  FuelType fuelType;
  EngineSpec({
    EngineCapacityModel? engineCapacity,
    this.engineCylinderNumber = EngineCylinderNumber.none,
    this.fuelType = FuelType.none,
    this.hp,
    this.topSpeed,
    this.fuelConsumption,
  }) : engineCapacity =
           engineCapacity ??
           EngineCapacityModel(EngineCapacity.none, EngineCylinderNumber.none);
  void clear() {
    engineCapacity = EngineCapacityModel(
      EngineCapacity.none,
      EngineCylinderNumber.none,
    );
    engineCylinderNumber = EngineCylinderNumber.none;
    hp = null;
    topSpeed = null;
    fuelConsumption = null;
    fuelType = FuelType.none;
  }

  void clearEngine() {
    engineCapacity = EngineCapacityModel(
      EngineCapacity.none,
      EngineCylinderNumber.none,
    );
    engineCylinderNumber = EngineCylinderNumber.none;
  }

  static EngineSpec empty() {
    return EngineSpec();
  }

  String getEngineSpec() {
    return '${engineCylinderNumber.getEngineCylinderNumberName()} - ${engineCapacity.engineCapacity != EngineCapacity.none ? engineCapacity.engineCapacity.getEngineCapacityName() : StringsManager.selectEngineCapacity}';
  }

  Map<String, dynamic> toJson() {
    return {
      CarsTableKeys.engineCapacity: engineCapacity.engineCapacity.name,
      CarsTableKeys.engineCylinderNumber:
          engineCapacity.engineCylinderNumber.name,
      CarsTableKeys.engineCapacityValue: int.parse(
        engineCapacity.engineCapacity.getEngineCapacityValue(),
      ),
      CarsTableKeys.hp: hp,
      CarsTableKeys.topSpeed: topSpeed,
      CarsTableKeys.fuelConsumption: fuelConsumption,
      CarsTableKeys.fuelType: fuelType.name,
    };
  }
}

EngineSpec getEngineSpecEntity(EngineSpecEntity entity) {
  return EngineSpec(
    engineCapacity: entity.engineCapacity != EngineCapacity.none
        ? EngineCapacityModel(
            entity.engineCapacity,
            entity.engineCylinderNumber,
          )
        : null,
    engineCylinderNumber: entity.engineCylinderNumber,
    hp: entity.hp,
    topSpeed: entity.topSpeed,
    fuelConsumption: entity.fuelConsumption,
    fuelType: entity.fuelType,
  );
}

List<EngineCapacityModel> i3EngineCapacities = [
  EngineCapacityModel(EngineCapacity.c600, EngineCylinderNumber.i3),
  EngineCapacityModel(EngineCapacity.c700, EngineCylinderNumber.i3),
  EngineCapacityModel(EngineCapacity.c800, EngineCylinderNumber.i3),
  EngineCapacityModel(EngineCapacity.c1000, EngineCylinderNumber.i3),
  EngineCapacityModel(EngineCapacity.c1100, EngineCylinderNumber.i3),
  EngineCapacityModel(EngineCapacity.c1200, EngineCylinderNumber.i3),
  EngineCapacityModel(EngineCapacity.c1300, EngineCylinderNumber.i3),
  EngineCapacityModel(EngineCapacity.c1400, EngineCylinderNumber.i3),
  EngineCapacityModel(EngineCapacity.c1500, EngineCylinderNumber.i3),
  EngineCapacityModel(EngineCapacity.c2000, EngineCylinderNumber.i3),
];
List<EngineCapacityModel> i4EngineCapacities = [
  EngineCapacityModel(EngineCapacity.c800, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c1000, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c1100, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c1200, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c1300, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c1400, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c1500, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c1600, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c1800, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2000, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2100, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2200, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2300, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2400, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2500, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2600, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2700, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2800, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c2900, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c3000, EngineCylinderNumber.i4),
  EngineCapacityModel(EngineCapacity.c3200, EngineCylinderNumber.i4),
];
List<EngineCapacityModel> i5EngineCapacities = [
  EngineCapacityModel(EngineCapacity.c2000, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c2100, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c2200, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c2300, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c2400, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c2500, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c2600, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c2700, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c2800, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c2900, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c3000, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c3200, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c3500, EngineCylinderNumber.i5),
  EngineCapacityModel(EngineCapacity.c3700, EngineCylinderNumber.i5),
];
List<EngineCapacityModel> v6EngineCapacities = [
  EngineCapacityModel(EngineCapacity.c2500, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c2700, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c2800, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c3000, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c3200, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c3300, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c3500, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c3600, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c3800, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c4000, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c4100, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c4200, EngineCylinderNumber.v6),
  EngineCapacityModel(EngineCapacity.c4500, EngineCylinderNumber.v6),
];
List<EngineCapacityModel> i6EngineCapacities = [
  EngineCapacityModel(EngineCapacity.c2500, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c2700, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c2800, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c3000, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c3200, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c3300, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c3500, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c3600, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c3800, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c4000, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c4100, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c4200, EngineCylinderNumber.i6),
  EngineCapacityModel(EngineCapacity.c4500, EngineCylinderNumber.i6),
];
List<EngineCapacityModel> v8EngineCapacities = [
  EngineCapacityModel(EngineCapacity.c3000, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c3200, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c3300, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c3500, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c3600, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c3800, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c4000, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c4200, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c4400, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c4600, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c4800, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c5000, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c5200, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c5500, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c5700, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c5800, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c6000, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c6200, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c6600, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c7200, EngineCylinderNumber.v8),
  EngineCapacityModel(EngineCapacity.c8000, EngineCylinderNumber.v8),
];
List<EngineCapacityModel> v10EngineCapacities = [
  EngineCapacityModel(EngineCapacity.c5000, EngineCylinderNumber.v10),
  EngineCapacityModel(EngineCapacity.c5200, EngineCylinderNumber.v10),
  EngineCapacityModel(EngineCapacity.c5300, EngineCylinderNumber.v10),
  EngineCapacityModel(EngineCapacity.c5500, EngineCylinderNumber.v10),
  EngineCapacityModel(EngineCapacity.c5800, EngineCylinderNumber.v10),
  EngineCapacityModel(EngineCapacity.c6000, EngineCylinderNumber.v10),
  EngineCapacityModel(EngineCapacity.c6200, EngineCylinderNumber.v10),
  EngineCapacityModel(EngineCapacity.c6500, EngineCylinderNumber.v10),
];
List<EngineCapacityModel> v12EngineCapacities = [
  EngineCapacityModel(EngineCapacity.c6000, EngineCylinderNumber.v12),
  EngineCapacityModel(EngineCapacity.c6200, EngineCylinderNumber.v12),
  EngineCapacityModel(EngineCapacity.c6400, EngineCylinderNumber.v12),
  EngineCapacityModel(EngineCapacity.c6500, EngineCylinderNumber.v12),
  EngineCapacityModel(EngineCapacity.c6600, EngineCylinderNumber.v12),
  EngineCapacityModel(EngineCapacity.c7000, EngineCylinderNumber.v12),
  EngineCapacityModel(EngineCapacity.c7500, EngineCylinderNumber.v12),
  EngineCapacityModel(EngineCapacity.c8000, EngineCylinderNumber.v12),
];
List<EngineCapacityModel> v16EngineCapacities = [
  EngineCapacityModel(EngineCapacity.c8000, EngineCylinderNumber.v16),
];
// List<EngineCapacity> i3EngineCapacities = [
//   EngineCapacity.c600,
//   EngineCapacity.c700,
//   EngineCapacity.c800,
//   EngineCapacity.c1000,
//   EngineCapacity.c1100,
//   EngineCapacity.c1200,
//   EngineCapacity.c1300,
//   EngineCapacity.c1400,
//   EngineCapacity.c1500,
//   EngineCapacity.c2000,
// ];
// List<EngineCapacity> i4EngineCapacities = [
//   EngineCapacity.c800,
//   EngineCapacity.c1000,
//   EngineCapacity.c1100,
//   EngineCapacity.c1200,
//   EngineCapacity.c1300,
//   EngineCapacity.c1400,
//   EngineCapacity.c1500,
//   EngineCapacity.c1600,
//   EngineCapacity.c1800,
//   EngineCapacity.c2000,
//   EngineCapacity.c2100,
//   EngineCapacity.c2200,
//   EngineCapacity.c2300,
//   EngineCapacity.c2400,
//   EngineCapacity.c2500,
//   EngineCapacity.c2600,
//   EngineCapacity.c2700,
//   EngineCapacity.c2800,
//   EngineCapacity.c2900,
//   EngineCapacity.c3000,
//   EngineCapacity.c3200,
// ];
// List<EngineCapacity> i5EngineCapacities = [
//   EngineCapacity.c2000,
//   EngineCapacity.c2100,
//   EngineCapacity.c2200,
//   EngineCapacity.c2300,
//   EngineCapacity.c2400,
//   EngineCapacity.c2500,
//   EngineCapacity.c2600,
//   EngineCapacity.c2700,
//   EngineCapacity.c2800,
//   EngineCapacity.c2900,
//   EngineCapacity.c3000,
//   EngineCapacity.c3200,
//   EngineCapacity.c3500,
//   EngineCapacity.c3700,
// ];
// List<EngineCapacity> vAndI6EngineCapacities = [
//   EngineCapacity.c2500,
//   EngineCapacity.c2700,
//   EngineCapacity.c2800,
//   EngineCapacity.c3000,
//   EngineCapacity.c3200,
//   EngineCapacity.c3300,
//   EngineCapacity.c3500,
//   EngineCapacity.c3600,
//   EngineCapacity.c3800,
//   EngineCapacity.c4000,
//   EngineCapacity.c4100,
//   EngineCapacity.c4200,
//   EngineCapacity.c4500,
// ];
// List<EngineCapacity> v8EngineCapacities = [
//   EngineCapacity.c3000,
//   EngineCapacity.c3200,
//   EngineCapacity.c3300,
//   EngineCapacity.c3500,
//   EngineCapacity.c3600,
//   EngineCapacity.c3800,
//   EngineCapacity.c4000,
//   EngineCapacity.c4200,
//   EngineCapacity.c4400,
//   EngineCapacity.c4600,
//   EngineCapacity.c4800,
//   EngineCapacity.c5000,
//   EngineCapacity.c5200,
//   EngineCapacity.c5500,
//   EngineCapacity.c5800,
//   EngineCapacity.c6000,
//   EngineCapacity.c6200,
//   EngineCapacity.c6600,
//   EngineCapacity.c7200,
//   EngineCapacity.c8000,
// ];
// List<EngineCapacity> v10EngineCapacities = [
//   EngineCapacity.c5000,
//   EngineCapacity.c5200,
//   EngineCapacity.c5300,
//   EngineCapacity.c5500,
//   EngineCapacity.c5800,
//   EngineCapacity.c6000,
//   EngineCapacity.c6200,
//   EngineCapacity.c6500,
// ];
// List<EngineCapacity> v12EngineCapacities = [
//   EngineCapacity.c6000,
//   EngineCapacity.c6200,
//   EngineCapacity.c6400,
//   EngineCapacity.c6500,
//   EngineCapacity.c6600,
//   EngineCapacity.c7000,
//   EngineCapacity.c7500,
//   EngineCapacity.c8000,
// ];
// List<EngineCapacity> v16EngineCapacities = [EngineCapacity.c8000];

class EngineCapacityModel {
  EngineCapacity engineCapacity;
  EngineCylinderNumber engineCylinderNumber;
  EngineCapacityModel(this.engineCapacity, this.engineCylinderNumber);
}
