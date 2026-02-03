import 'package:google_places_service/domain/entity/predictions_entity.dart';

class CarFilterModel {
  String? brand;
  String? model;
  String? minYear;
  String? maxYear;
  String? bodyType;
  String? fuelType;
  String? gearboxType;
  String? minMileage;
  String? maxMileage;
  String? minPrice;
  String? maxPrice;
  String? minEngineCapacity;
  String? maxEngineCapacity;
  String? minEngineCylinderNumber;
  String? maxEngineCylinderNumber;
  PredictionsEntity? location;
  String? paintColor;
  String? paintCondition;
  List<String>? safetyOptions;
  CarFilterModel();
}
