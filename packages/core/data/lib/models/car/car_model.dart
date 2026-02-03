import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:data/models/car/car_image.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';
import 'package:image_picker/image_picker.dart';

class CarsTableKeys {
  static const String id = 'carId';
  static const String userId = 'userId';
  static const String createdAt = 'createdAt';
  static const String brand = 'brand';
  static const String model = 'model';
  static const String year = 'year';
  static const String description = 'description';
  static const String bodyType = 'bodyType';
  static const String fuelType = 'fuelType';
  static const String gearboxType = 'gearboxType';
  static const String km = 'km';
  static const String paintColor = 'paintColor';
  static const String carCondition = 'carCondition';
  static const String paintCondition = 'paintCondition';
  static const String interiorFeatures = 'interiorFeatures';
  static const String modifications = 'modifications';
  static const String serviceHistory = 'serviceHistory';
  static const String price = 'price';
  static const String version = 'version';
  static const String safetyOptions = 'safetyOptions';
  static const String negotiable = 'negotiable';
  static const String images = 'images';
  static const String location = 'location';
  static const String engineCapacity = 'engineCapacity';
  static const String engineCylinderNumber = 'engineCylinderNumber';
}

class CarModel {
  String carId;
  String userId;
  String createdAt;
  String brand;
  String model;
  String engineCapacity;
  String engineCylinderNumber;
  String year;
  String description;
  String bodyType;
  String fuelType;
  String gearboxType;
  String km;
  CarConditionType carCondition;
  String paintColor;
  String paintCondition;
  String interiorFeatures;
  String modifications;
  String serviceHistory;
  String price;
  String version;
  List<String> safetyOptions;
  List<XFile> images;
  List<XFile> willUploadImages;
  List<CarImage>? uploadedImages;
  bool negotiable;
  PredictionsEntity location;

  CarModel({
    this.carId = '',
    this.userId = '',
    this.createdAt = '',
    this.brand = '',
    this.model = '',
    this.year = '',
    this.engineCapacity = '',
    this.engineCylinderNumber = '',
    this.description = '',
    this.bodyType = '',
    this.fuelType = '',
    this.gearboxType = '',
    this.interiorFeatures = '',
    this.km = '',
    this.carCondition = CarConditionType.usedCar,
    this.modifications = '',
    this.paintColor = '',
    this.paintCondition = '',
    this.price = '',
    this.serviceHistory = '',
    this.version = '',
    // this.location = PredictionsEntity(
    //   description: "",
    //   placeId: "",
    //   reference: "",
    //   structuredFormatting:  StructuredFormattingEntity(
    //     mainText: "",
    //     secondaryText: "",
    //   ),
    //   types: const [],
    // ),
    required this.location,
    this.safetyOptions = const [],
    this.willUploadImages = const [],
    this.images = const [],
    this.negotiable = true,
    this.uploadedImages,
  });

  Map<String, dynamic> toJson() {
    return {
      CarsTableKeys.id: carId,
      CarsTableKeys.userId: userId,
      CarsTableKeys.createdAt: createdAt,
      CarsTableKeys.brand: brand,
      CarsTableKeys.model: model,
      CarsTableKeys.engineCapacity: engineCapacity,
      CarsTableKeys.engineCylinderNumber: engineCylinderNumber,
      CarsTableKeys.year: int.parse(year),
      CarsTableKeys.description: description,
      CarsTableKeys.bodyType: bodyType,
      CarsTableKeys.fuelType: fuelType,
      CarsTableKeys.gearboxType: gearboxType,
      CarsTableKeys.km: int.parse(km.replaceAll(RegExp(r'[^0-9]'), '')),
      CarsTableKeys.paintColor: paintColor,
      CarsTableKeys.paintCondition: paintCondition,
      CarsTableKeys.interiorFeatures: interiorFeatures,
      CarsTableKeys.modifications: modifications,
      CarsTableKeys.serviceHistory: serviceHistory,
      CarsTableKeys.price: int.parse(price.replaceAll(RegExp(r'[^0-9]'), '')),
      CarsTableKeys.version: version,
      CarsTableKeys.safetyOptions: safetyOptions,
      CarsTableKeys.negotiable: negotiable,
      CarsTableKeys.images: uploadedImages!.map((e) => e.toJson()).toList(),
      CarsTableKeys.location: location.toJson(),
      CarsTableKeys.carCondition: carCondition,
      // Note: images are not included in JSON representation
    };
  }
}
