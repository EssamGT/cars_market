import 'package:data/models/car/car_image.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';
import 'package:image_picker/image_picker.dart';

// to do   improve
class CarsTableKeys2 {
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
  static const String mileage = 'mileage';
  static const String paintColor = 'paintColor';
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
}

class CarModel2 {
  String? _carId;
  String? _userId;
  String? _createdAt;
  String? _brand;
  String? _model;
  String? _year;
  String? _description;
  String? _bodyType;
  String? _fuelType;
  String? _gearboxType;
  String? _mileage;
  String? _paintColor;
  String? _paintCondition;
  List<String>? _interiorFeatures;
  List<String>? _modifications;
  List<String>? _serviceHistory;
  String? _price;
  String? _version;
  List<String>? _safetyOptions;
  List<XFile>? _images;
  List<CarImage>? _uploadedImages;
  bool? _negotiable;
  PredictionsEntity? _location;

  CarModel2();
  // Getters
  String? get carId => _carId;
  String? get userId => _userId;
  String? get createdAt => _createdAt;
  String? get brand => _brand;
  String? get model => _model;
  String? get year => _year;
  String? get description => _description;
  String? get bodyType => _bodyType;
  String? get fuelType => _fuelType;
  String? get gearboxType => _gearboxType;
  String? get mileage => _mileage;
  String? get paintColor => _paintColor;
  String? get paintCondition => _paintCondition;
  List<String>? get interiorFeatures => _interiorFeatures;
  List<String>? get modifications => _modifications;
  List<String>? get serviceHistory => _serviceHistory;
  String? get price => _price;
  String? get version => _version;
  List<String>? get safetyOptions => _safetyOptions;
  List<XFile>? get images => _images;
  List<CarImage>? get uploadedImages => _uploadedImages;
  bool? get negotiable => _negotiable;
  PredictionsEntity? get location => _location;

  // Setters
  set carId(String? value) => _carId = value;
  set userId(String? value) => _userId = value;
  set createdAt(String? value) => _createdAt = value;
  set brand(String? value) => _brand = value;
  set model(String? value) => _model = value;
  set year(String? value) => _year = value;
  set description(String? value) => _description = value;
  set bodyType(String? value) => _bodyType = value;
  set fuelType(String? value) => _fuelType = value;
  set gearboxType(String? value) => _gearboxType = value;
  set mileage(String? value) => _mileage = value;
  set paintColor(String? value) => _paintColor = value;
  set paintCondition(String? value) => _paintCondition = value;
  set interiorFeatures(List<String>? value) => _interiorFeatures = value;
  set modifications(List<String>? value) => _modifications = value;
  set serviceHistory(List<String>? value) => _serviceHistory = value;
  set price(String? value) => _price = value;
  set version(String? value) => _version = value;
  set safetyOptions(List<String>? value) => _safetyOptions = value;
  set images(List<XFile>? value) => _images = value;
  set uploadedImages(List<CarImage>? value) => _uploadedImages = value;
  set negotiable(bool? value) => _negotiable = value;
  set location(PredictionsEntity? value) => _location = value;
}
