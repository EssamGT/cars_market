import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:data/models/location/location_model.dart';

class CarFilterModel {
  CarBrand brand;
  String minYear;
  String maxYear;
  CarBodyType bodyType;
  FuelType fuelType;
  TransmissionType transmissionType;
  String minKm;
  String maxKm;
  String minPrice;
  String maxPrice;
  String minEngineCapacity;
  String maxEngineCapacity;
  String minEngineCylinderNumber;
  String maxEngineCylinderNumber;
  LocationModel location;
  PaintColors paintColor;
  PaintConditions paintCondition;

  CarFilterModel({
    this.minYear = "",
    this.maxYear = "",
    this.minKm = "",
    this.maxKm = "",
    this.minPrice = "",
    this.maxPrice = "",
    this.minEngineCapacity = "",
    this.maxEngineCapacity = "",
    this.minEngineCylinderNumber = "",
    this.maxEngineCylinderNumber = "",
    this.bodyType = CarBodyType.none,
    this.fuelType = FuelType.none,
    this.transmissionType = TransmissionType.none,
    this.paintColor = PaintColors.none,
    this.paintCondition = PaintConditions.none,
  }) : brand = CarBrand.all(),
       location = LocationModel.all();

  void reset() {
    brand = CarBrand.all();
    minYear = "";
    maxYear = "";
    bodyType = CarBodyType.none;
    fuelType = FuelType.none;
    transmissionType = TransmissionType.none;
    minKm = "";
    maxKm = "";
    minPrice = "";
    maxPrice = "";
    minEngineCapacity = "";
    maxEngineCapacity = "";
    minEngineCylinderNumber = "";
    maxEngineCylinderNumber = "";
    location = LocationModel.all();
    paintColor = PaintColors.none;
    paintCondition = PaintConditions.none;
  }

  void setCarBrand(CarBrand brand) {
    final newCarBrand = CarBrand(
      id: brand.id,
      name: brand.name,
      selectedModel: CarModel(
        name: "All",
        id: "",
        brandId: brand.id,
        brand: brand.name,
      ),
      models: [],
    );
    this.brand = newCarBrand;
    // brandId = brand.id;
    // modelId = null;
  }

  void setCarModel(CarModel model) {
    final newCarBrand = CarBrand(
      id: model.brandId,
      name: model.brand,
      selectedModel: model,
      models: [],
    );
    brand = newCarBrand;
    // brandId = model.brandId;
    // modelId = model.id;
  }

  CarFilterModelRequest toRequest() {
    print("brand id: ${brand.id}");
    return CarFilterModelRequest()
      ..brandId = brand.id.isEmpty ? null : brand.id
      ..modelId = brand.selectedModel.id.isEmpty ? null : brand.selectedModel.id
      ..minYear = minYear.isEmpty ? null : int.parse(minYear)
      ..maxYear = maxYear.isEmpty ? null : int.parse(maxYear)
      ..bodyType = bodyType == CarBodyType.none ? null : bodyType
      ..fuelType = fuelType == FuelType.none ? null : fuelType
      ..transmissionType = transmissionType == TransmissionType.none
          ? null
          : transmissionType
      ..minKm = minKm.isEmpty ? null : int.parse(minKm)
      ..maxKm = maxKm.isEmpty ? null : int.parse(maxKm)
      ..minPrice = minPrice.isEmpty ? null : int.parse(minPrice)
      ..maxPrice = maxPrice.isEmpty ? null : int.parse(maxPrice)
      ..minEngineCapacity = minEngineCapacity.isEmpty
          ? null
          : int.parse(minEngineCapacity)
      ..maxEngineCapacity = maxEngineCapacity.isEmpty
          ? null
          : int.parse(maxEngineCapacity)
      ..minEngineCylinderNumber = minEngineCylinderNumber.isEmpty
          ? null
          : minEngineCylinderNumber
      ..maxEngineCylinderNumber = maxEngineCylinderNumber.isEmpty
          ? null
          : maxEngineCylinderNumber
      ..location = location.id.isEmpty ? null : location
      ..paintColor = paintColor == PaintColors.none ? null : paintColor
      ..paintCondition = paintCondition == PaintConditions.none
          ? null
          : paintCondition;
  }
}

class CarFilterModelRequest {
  String? brandId;
  String? modelId;
  int? minYear;
  int? maxYear;
  CarBodyType? bodyType;
  FuelType? fuelType;
  TransmissionType? transmissionType;
  int? minKm;
  int? maxKm;
  int? minPrice;
  int? maxPrice;
  int? minEngineCapacity;
  int? maxEngineCapacity;
  String? minEngineCylinderNumber;
  String? maxEngineCylinderNumber;
  LocationModel? location;
  PaintColors? paintColor;
  PaintConditions? paintCondition;
  CarFilterModelRequest();
}
