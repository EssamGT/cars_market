import 'package:data/models/car/brands_models/air_con_types.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:data/models/car/brands_models/features_model.dart';
import 'package:data/models/car/brands_models/interior_type.dart';
import 'package:data/models/car/brands_models/negotiation.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/payment_options.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:data/models/car/brands_models/wahtsaap_message.dart';
import 'package:data/models/car/car_image.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';
import 'package:image_picker/image_picker.dart';

class CarsTableKeys {
  static const String id = 'carId';
  static const String userId = 'userId';
  static const String createdAt = 'createdAt';
  static const String brandId = 'brandId';
  static const String brandName = 'brandName';
  static const String modelId = 'modelId';
  static const String modelName = 'modelName';
  static const String wahtsaapMessage = 'wahtsaapMessage';

  static const String engineSpec = 'engineSpec';
  static const String hp = 'hp';
  static const String topSpeed = 'topSpeed';
  static const String fuelConsumption = 'fuelConsumption';
  static const String features = 'features';
  static const String featuresTitle = 'featuresTitle';
  static const String featuresId = 'featuresId';
  static const String featuresList = 'featuresList';
  static const String year = 'year';
  static const String paymentOptions = 'paymentOptions';
  static const String interiorType = 'interiorType';
  static const String airConType = 'airConType';
  static const String seatsNumber = 'seatsNumber';
  static const String description = 'description';
  static const String bodyType = 'bodyType';
  static const String fuelType = 'fuelType';
  static const String transmissionType = 'gearboxType';
  static const String km = 'km';
  static const String paintColor = 'paintColor';
  static const String carCondition = 'carCondition';
  static const String paintCondition = 'paintCondition';
  // static const String interiorFeatures = 'interiorFeatures';
  static const String modifications = 'modifications';
  static const String serviceHistory = 'serviceHistory';
  static const String price = 'price';
  static const String version = 'version';
  // static const String safetyOptions = 'safetyOptions';
  static const String negotiable = 'negotiable';
  static const String images = 'images';
  static const String location = 'location';
  static const String engineCapacity = 'engineCapacity';
  static const String engineCylinderNumber = 'engineCylinderNumber';
}

class SellCarUploadModel {
  CarBrand brand;
  String carId;
  String userId;
  String createdAt;

  PaymentOptions paymentOptions;
  InteriorType interiorType;
  String seatsNumber;
  String year;
  AirConTypes airConType;
  WahtsaapMessage wahtsaapMessage;
  String description;
  CarBodyType bodyType;
  TransmissionType transmissionType;
  String km;
  EngineSpec engineSpec;
  CarConditionType carCondition;
  PaintColors paintColor;
  PaintConditions paintCondition;
  String modifications;
  String serviceHistory;
  String price;
  String version;
  List<XFile> selectedImages;
  List<XFile> pendingUploadImages;
  List<CarImage>? uploadedImages;
  NegotiationType negotiable;
  PredictionsEntity location;
  List<FeaturesList> features;

  SellCarUploadModel({
    this.carId = '',
    this.userId = '',
    this.createdAt = '',

    this.year = '',
    this.wahtsaapMessage = WahtsaapMessage.none,
    CarBrand? brand,
    EngineSpec? engineSpec,

    this.interiorType = InteriorType.none,
    this.paymentOptions = PaymentOptions.none,
    this.seatsNumber = '',
    this.airConType = AirConTypes.none,
    this.description = '',
    this.bodyType = CarBodyType.none,
    this.transmissionType = TransmissionType.none,
    this.km = '',
    this.carCondition = CarConditionType.none,
    this.modifications = '',
    this.paintColor = PaintColors.none,
    this.paintCondition = PaintConditions.none,
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
    PredictionsEntity? location,
    List<XFile>? selectedImages,
    List<XFile>? pendingUploadImages,
    List<FeaturesList>? features,

    this.negotiable = NegotiationType.none,
    this.uploadedImages,
  }) : brand = brand ?? CarBrand.empty(),
       engineSpec = engineSpec ?? EngineSpec(),
       selectedImages = selectedImages ?? [],
       pendingUploadImages = pendingUploadImages ?? [],
       features = features ?? [],
       location = location ?? PredictionsEntity.empty();

  Map<String, dynamic> toJson() {
    return {
      CarsTableKeys.id: carId,
      CarsTableKeys.userId: userId,
      CarsTableKeys.createdAt: createdAt,
      CarsTableKeys.brandId: brand.id,
      CarsTableKeys.modelId: brand.selectedModel.id,
      CarsTableKeys.brandName: brand.name,
      CarsTableKeys.modelName: brand.selectedModel.name,
      CarsTableKeys.engineSpec: engineSpec.toJson(),
      CarsTableKeys.year: int.tryParse(year) ?? 0,
      CarsTableKeys.description: description,
      CarsTableKeys.bodyType: bodyType.name,
      CarsTableKeys.transmissionType: transmissionType.name,
      CarsTableKeys.km: int.tryParse(km.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0,
      CarsTableKeys.paintColor: paintColor.name,
      CarsTableKeys.paintCondition: paintCondition.name,
      CarsTableKeys.features: features.map((f) => f.toIdsJson()).toList(),
      CarsTableKeys.modifications: modifications,
      CarsTableKeys.serviceHistory: serviceHistory,
      CarsTableKeys.price:
          int.tryParse(price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0,
      CarsTableKeys.version: version,
      CarsTableKeys.negotiable: negotiable.name,
      CarsTableKeys.images: uploadedImages!.map((e) => e.toJson()).toList(),
      CarsTableKeys.location: location.toJson(),
      CarsTableKeys.carCondition: carCondition.name,
      CarsTableKeys.interiorType: interiorType.name,
      CarsTableKeys.paymentOptions: paymentOptions.name,
      CarsTableKeys.seatsNumber: seatsNumber,
      CarsTableKeys.airConType: airConType.name,
      CarsTableKeys.wahtsaapMessage: wahtsaapMessage.name,
      // Note: images are not included in JSON representation
    };
  }

  void setBrand(CarBrand brand) {
    this.brand = brand;
  }

  void setModel(CarModel model) {
    final oldBrand = brand;
    CarBrand updatedBrand = CarBrand(
      id: oldBrand.id,
      name: oldBrand.name,
      models: oldBrand.models,
      selectedModel: model,
    );
    brand = updatedBrand;
  }

  void resetCarBrandAndModel() {
    brand = CarBrand.empty();
  }

  String getCarName() {
    return '${brand.name} ${brand.selectedModel.name}';
  }
}
