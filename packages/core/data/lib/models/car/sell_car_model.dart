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
import 'package:data/models/car/brands_models/whatsapp_message.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_status.dart';
import 'package:data/models/location/location_model.dart';
import 'package:google_places_service/data/models/text_search_model/text_search_model.dart';
import 'package:image_picker/image_picker.dart';

class CarsTableKeys {
  static const String id = 'carId';
  static const String userId = 'userId';
  static const String createdAt = 'createdAt';
  static const String brandId = 'brandId';
  static const String brandName = 'brandName';
  static const String modelId = 'modelId';
  static const String modelName = 'modelName';
  static const String leads = 'leads';
  static const String views = 'views';
  static const String whatsappMessage = 'whatsappMessage';
  static const String engineCapacityValue = 'engineCapacityValue';
  static const String status = 'status';

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
  static const String googleMapsLocation = 'googleMapsLocation';
}

class SellCarUploadModel {
  CarBrand brand;
  String carId;
  String userId;
  String createdAt;
  LocationModel location;
  TextSearchModel googleMapsLocation;
  PaymentOptions paymentOptions;
  InteriorType interiorType;
  String seatsNumber;
  String year;
  CarStatus status;
  AirConTypes airConType;
  WhatsAppMessage whatsappMessage;
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
  List<String> leads;
  List<String> views;
  NegotiationType negotiable;
  List<FeaturesList> features;

  SellCarUploadModel({
    this.carId = '',
    this.userId = '',
    this.createdAt = '',
    this.status = CarStatus.pendingReview,
    this.year = '',
    this.whatsappMessage = WhatsAppMessage.none,
    CarBrand? brand,
    EngineSpec? engineSpec,
    LocationModel? location2,
    TextSearchModel? googleMapsLocation,

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
    List<XFile>? selectedImages,
    List<XFile>? pendingUploadImages,
    List<FeaturesList>? features,

    this.negotiable = NegotiationType.none,
    this.uploadedImages,
    this.leads = const [],
    this.views = const [],
  }) : brand = brand ?? CarBrand.empty(),
       engineSpec = engineSpec ?? EngineSpec(),
       selectedImages = selectedImages ?? [],
       pendingUploadImages = pendingUploadImages ?? [],
       features = features ?? [],
       googleMapsLocation = googleMapsLocation ?? TextSearchModel.empty(),
       location = location2 ?? LocationModel.empty();

  Map<String, dynamic> toJson() {
    return {
      CarsTableKeys.id: carId,
      CarsTableKeys.userId: userId,
      CarsTableKeys.createdAt: createdAt,
      CarsTableKeys.brandId: brand.id,
      CarsTableKeys.modelId: brand.selectedModel.id,
      CarsTableKeys.brandName: brand.name,
      CarsTableKeys.status: status.name,
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
      CarsTableKeys.version: version.trim(),
      CarsTableKeys.negotiable: negotiable.name,
      CarsTableKeys.images: uploadedImages!.map((e) => e.toJson()).toList(),
      // only id
      CarsTableKeys.location: location.toJsonId(),
      CarsTableKeys.carCondition: carCondition.name,
      CarsTableKeys.interiorType: interiorType.name,
      CarsTableKeys.paymentOptions: paymentOptions.name,
      CarsTableKeys.seatsNumber: seatsNumber,
      CarsTableKeys.airConType: airConType.name,
      CarsTableKeys.whatsappMessage: whatsappMessage.name,
      CarsTableKeys.googleMapsLocation: googleMapsLocation.toJson(),
      CarsTableKeys.leads: leads,
      CarsTableKeys.views: views,
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
