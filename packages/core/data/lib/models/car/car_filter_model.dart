import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:domain/entity/location_entity/location_entity.dart';

class CarFilterModel {
  CarBrandFilter brand;
  String? minYear;
  String? maxYear;
  CarBodyType? bodyType;
  FuelType? fuelType;
  TransmissionType? transmissionType;
  String? minKm;
  String? maxKm;
  String? minPrice;
  String? maxPrice;
  String? minEngineCapacity;
  String? maxEngineCapacity;
  String? minEngineCylinderNumber;
  String? maxEngineCylinderNumber;
  LocationEntity? location;
  PaintColors? paintColor;
  PaintConditions? paintCondition;

  CarFilterModel() : brand = CarBrandFilter.empty();

  void clear() {
    brand = CarBrandFilter.empty();
    minYear = null;
    maxYear = null;
    bodyType = null;
    fuelType = null;
    transmissionType = null;
    minKm = null;
    maxKm = null;
    minPrice = null;
    maxPrice = null;
    minEngineCapacity = null;
    maxEngineCapacity = null;
    minEngineCylinderNumber = null;
    maxEngineCylinderNumber = null;
    location = null;
    paintColor = null;
    paintCondition = null;
  }

  void setCarBrand(CarBrandFilter brand) {
    final newCarBrand = CarBrandFilter(
      id: brand.id,
      name: brand.name,
      selectedModel: CarModelFilter(name: "All", brandId: brand.id),
      models: [],
    );
    this.brand = newCarBrand;
    // brandId = brand.id;
    // modelId = null;
  }

  void setCarModel(CarModelFilter model) {
    final newCarBrand = CarBrandFilter(
      id: model.brandId,
      name: model.brand ?? '',
      selectedModel: model,
      models: [],
    );
    brand = newCarBrand;
    // brandId = model.brandId;
    // modelId = model.id;
  }
}
