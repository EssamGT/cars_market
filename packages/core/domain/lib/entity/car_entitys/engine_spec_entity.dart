import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/sell_car_model.dart';

class EngineSpecEntity {
  EngineCapacity engineCapacity;
  EngineCylinderNumber engineCylinderNumber;
  String? hp;
  String? topSpeed;
  String? fuelConsumption;
  FuelType fuelType;
  EngineSpecEntity({
    this.engineCapacity = EngineCapacity.none,
    this.engineCylinderNumber = EngineCylinderNumber.none,
    this.fuelType = FuelType.none,
    this.hp,
    this.topSpeed,
    this.fuelConsumption,
  });

  String getEngineSpec() {
    int engineCapacity = int.parse(
      this.engineCapacity.getEngineCapacityName().replaceAll(
        RegExp(r'[^0-9]'),
        '',
      ),
    );
    double engineCapacityDivider = engineCapacity / 1000;

    String engineTypeText = engineCylinderNumber.getEngineType();

    return '${engineCapacityDivider}L $engineTypeText ';
  }

  Map<String, dynamic> toJson() {
    return {
      CarsTableKeys.engineCapacity: engineCapacity.name,
      CarsTableKeys.engineCylinderNumber: engineCylinderNumber.name,
      CarsTableKeys.hp: hp,
      CarsTableKeys.topSpeed: topSpeed,
      CarsTableKeys.fuelConsumption: fuelConsumption,
      CarsTableKeys.fuelType: fuelType.name,
    };
  }

  EngineSpecEntity.fromJson(Map<String, dynamic> json)
    : engineCapacity = EngineCapacity.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.engineCapacity],
        orElse: () => EngineCapacity.none,
      ),
      engineCylinderNumber = EngineCylinderNumber.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.engineCylinderNumber],
        orElse: () => EngineCylinderNumber.none,
      ),
      hp = json[CarsTableKeys.hp],
      topSpeed = json[CarsTableKeys.topSpeed],
      fuelConsumption = json[CarsTableKeys.fuelConsumption],
      fuelType = FuelType.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.fuelType],
        orElse: () => FuelType.none,
      );
}
