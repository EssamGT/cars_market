import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_model.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';
import 'package:google_places_service/domain/entity/structured_formatting_entity.dart';

class CarEntity {
  String carId;
  String userId;
  String createdAt;
  String brand;
  String model;
  String year;
  String description;
  String bodyType;
  String fuelType;
  String gearboxType;
  String mileage;
  String paintColor;
  String paintCondition;
  String interiorFeatures;
  String modifications;
  String serviceHistory;
  String price;
  String version;
  List<String> safetyOptions;
  List<CarImage>? carImages;
  bool negotiable;
  PredictionsEntity location;

  CarEntity({
    this.carId = '',
    this.userId = '',
    this.createdAt = '',
    this.brand = '',
    this.model = '',
    this.year = '',
    this.description = '',
    this.bodyType = '',
    this.fuelType = '',
    this.gearboxType = '',
    this.interiorFeatures = '',
    this.mileage = '',
    this.modifications = '',
    this.paintColor = '',
    this.paintCondition = '',
    this.price = '',
    this.serviceHistory = '',
    this.version = '',
    PredictionsEntity? location,
    this.safetyOptions = const [],
  
    this.negotiable = true,
    this.carImages,
  }) : location =
           location ??
           PredictionsEntity(
             description: "",
             placeId: '',
             structuredFormatting: StructuredFormattingEntity(
               mainText: '',
               secondaryText: '',
             ),
             reference: '',
             types: [],
           );

  Map<String, dynamic> toJson() {
    return {
      CarsTableKeys.id: carId,
      CarsTableKeys.userId: userId,
      CarsTableKeys.createdAt: createdAt,
      CarsTableKeys.brand: brand,
      CarsTableKeys.model: model,
      CarsTableKeys.year: int.parse(year),
      CarsTableKeys.description: description,
      CarsTableKeys.bodyType: bodyType,
      CarsTableKeys.fuelType: fuelType,
      CarsTableKeys.gearboxType: gearboxType,
      CarsTableKeys.mileage: int.parse(
        mileage.replaceAll(RegExp(r'[^0-9]'), ''),
      ),
      CarsTableKeys.paintColor: paintColor,
      CarsTableKeys.paintCondition: paintCondition,
      CarsTableKeys.interiorFeatures: interiorFeatures,
      CarsTableKeys.modifications: modifications,
      CarsTableKeys.serviceHistory: serviceHistory,
      CarsTableKeys.price: int.parse(price.replaceAll(RegExp(r'[^0-9]'), '')),
      CarsTableKeys.version: version,
      CarsTableKeys.safetyOptions: safetyOptions,
      CarsTableKeys.negotiable: negotiable,
      CarsTableKeys.images: carImages!.map((e) => e.toJson()).toList(),
      CarsTableKeys.location: location.toJson(),
      // Note: images are not included in JSON representation
    };
  }
  CarEntity.fromJson(Map<String, dynamic> json)
      : carId = json[CarsTableKeys.id] ?? '',
        userId = json[CarsTableKeys.userId] ?? '',
        createdAt = json[CarsTableKeys.createdAt] ?? '',
        brand = json[CarsTableKeys.brand] ?? '',
        model = json[CarsTableKeys.model] ?? '',
        year = (json[CarsTableKeys.year] ?? '').toString(),
        description = json[CarsTableKeys.description] ?? '',
        bodyType = json[CarsTableKeys.bodyType] ?? '',
        fuelType = json[CarsTableKeys.fuelType] ?? '',
        gearboxType = json[CarsTableKeys.gearboxType] ?? '',
        mileage = (json[CarsTableKeys.mileage] ?? '').toString(),
        paintColor = json[CarsTableKeys.paintColor] ?? '',
        paintCondition = json[CarsTableKeys.paintCondition] ?? '',
        interiorFeatures = json[CarsTableKeys.interiorFeatures] ?? '',
        modifications = json[CarsTableKeys.modifications] ?? '',
        serviceHistory = json[CarsTableKeys.serviceHistory] ?? '',
        price = (json[CarsTableKeys.price] ?? '').toString(),
        version = json[CarsTableKeys.version] ?? '',
        safetyOptions = List<String>.from(json[CarsTableKeys.safetyOptions] ?? []),
        negotiable = json[CarsTableKeys.negotiable] ?? true,
        carImages = (json[CarsTableKeys.images] as List<dynamic>?)
            ?.map((e) => CarImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        location = PredictionsEntity.fromJson(
            json[CarsTableKeys.location] as Map<String, dynamic>? ?? {});
}