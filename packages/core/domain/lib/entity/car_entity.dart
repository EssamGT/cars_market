import 'package:cars_market/globle/localization_service.dart';
import 'package:data/models/car/brands_models/air_con_types.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:data/models/car/brands_models/featrues_catalog.dart';
import 'package:data/models/car/brands_models/features_model.dart';
import 'package:data/models/car/brands_models/interior_type.dart';
import 'package:data/models/car/brands_models/negotiation.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/payment_options.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:data/models/car/brands_models/whatsapp_message.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_status.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:data/models/location/location_model.dart';
import 'package:domain/entity/car_entitys/engine_spec_entity.dart';
import 'package:google_places_service/data/models/text_search_model/text_search_model.dart';
import 'package:intl/intl.dart';

class CarEntity {
  final String carId;
  final String userId;
  final CarStatus status;
  final String createdAt;
  final EngineSpecEntity engineSpec;
  final String brand;
  final String model;
  final String brandId;
  final String modelId;
  final int year;
  final List<String> leads;
  final List<String> views;
  final String description;
  final CarBodyType bodyType;
  final TransmissionType transmissionType;
  final int km;
  final PaintColors paintColor;
  final PaintConditions paintCondition;
  final String? modifications;
  final String? serviceHistory;
  final TextSearchModel? googleMapsLocation;
  final int price;
  final String? version;
  final List<FeaturesList>? features;
  final List<CarImage> carImages;
  final NegotiationType negotiable;
  final LocationModel location;
  final PaymentOptions paymentOptions;
  final InteriorType interiorType;
  final AirConTypes airConType;
  final String? seatsNumber;
  final CarConditionType carCondition;
  final WhatsAppMessage whatsAppMessage;

  const CarEntity({
    required this.carId,
    required this.userId,
    required this.createdAt,
    required this.engineSpec,
    required this.brand,
    required this.model,
    required this.brandId,
    required this.modelId,
    required this.year,
    required this.description,
    required this.bodyType,
    required this.km,
    required this.paintColor,
    required this.paintCondition,
    this.googleMapsLocation,
    this.modifications,
    this.serviceHistory,
    required this.price,
    this.version,
    this.features,
    required this.carImages,
    required this.negotiable,
    required this.location,
    required this.paymentOptions,
    required this.interiorType,
    required this.airConType,
    this.seatsNumber,
    required this.carCondition,
    required this.whatsAppMessage,
    required this.transmissionType,
    required this.leads,
    required this.views,
    required this.status,
  });

  String getCarKM({bool withDot = false}) {
    if (km == 0) {
      return '';
    }
    if (LocalizationService.isRTL) {
      return withDot
          ? '${_formatter(km)} ${LocalizationService.strings.km} ·'
          : '${_formatter(km)} ${LocalizationService.strings.km}';
    }
    return withDot
        ? '· ${_formatter(km)} ${LocalizationService.strings.km}'
        : '${_formatter(km)} ${LocalizationService.strings.km}';
  }

  String getPrice({bool withDot = false}) {
    if (price == 0) {
      return '';
    }
    return withDot
        ? '· ${_formatter(price)} ${LocalizationService.strings.egp}'
        : '${_formatter(price)} ${LocalizationService.strings.egp}';
  }

  String _formatter(int price) {
    if (price == 0) {
      return '';
    }
    final formatter = NumberFormat('#,###');
    String formattedPrice = formatter.format(price);
    return formattedPrice;
  }

  Map<String, dynamic> toJson() {
    return {
      CarsTableKeys.id: carId,
      CarsTableKeys.userId: userId,
      CarsTableKeys.createdAt: createdAt,
      CarsTableKeys.brandName: brand,
      CarsTableKeys.modelName: model,
      CarsTableKeys.modelId: modelId,
      CarsTableKeys.brandId: brandId,
      CarsTableKeys.year: year,
      CarsTableKeys.description: description,
      CarsTableKeys.bodyType: bodyType.name,

      CarsTableKeys.transmissionType: transmissionType.name,
      CarsTableKeys.km: km,
      CarsTableKeys.paintColor: paintColor.name,
      CarsTableKeys.paintCondition: paintCondition.name,

      CarsTableKeys.modifications: modifications,
      CarsTableKeys.serviceHistory: serviceHistory,
      CarsTableKeys.price: price,
      CarsTableKeys.version: version,

      CarsTableKeys.negotiable: negotiable.name,
      CarsTableKeys.images: carImages.map((e) => e.toJson()).toList(),
      CarsTableKeys.location: location.toJson(),
      CarsTableKeys.googleMapsLocation: googleMapsLocation?.toJson(),
      // Note: images are not included in JSON representation
      CarsTableKeys.leads: leads,
      CarsTableKeys.views: views,
      CarsTableKeys.status: status.name,
    };
  }

  CarEntity.fromJson(Map<String, dynamic> json)
    : carId = json[CarsTableKeys.id] ?? '',
      engineSpec = EngineSpecEntity.fromJson(
        json[CarsTableKeys.engineSpec] ?? {},
      ),
      // userData = UserData.init(),
      userId = json[CarsTableKeys.userId] ?? '',
      createdAt = json[CarsTableKeys.createdAt] ?? '',
      brand = json[CarsTableKeys.brandName] ?? '',
      model = json[CarsTableKeys.modelName] ?? '',
      year = (json[CarsTableKeys.year] ?? 0),
      description = json[CarsTableKeys.description] ?? '',
      bodyType = CarBodyType.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.bodyType],
        orElse: () => CarBodyType.none,
      ),

      km = (json[CarsTableKeys.km] ?? ''),
      paintColor = PaintColors.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.paintColor],
        orElse: () => PaintColors.none,
      ),
      status = CarStatus.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.status],
        orElse: () => CarStatus.pendingReview,
      ),
      paintCondition = PaintConditions.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.paintCondition],
        orElse: () => PaintConditions.none,
      ),
      modifications = json[CarsTableKeys.modifications] ?? '',
      serviceHistory = json[CarsTableKeys.serviceHistory] ?? '',
      price = (json[CarsTableKeys.price] ?? 0),
      version = json[CarsTableKeys.version] ?? '',

      negotiable = NegotiationType.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.negotiable],
        orElse: () => NegotiationType.none,
      ),
      carImages = (json[CarsTableKeys.images] as List<dynamic>? ?? [])
          .map((e) => CarImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      airConType = AirConTypes.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.airConType],
        orElse: () => AirConTypes.none,
      ),
      interiorType = InteriorType.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.interiorType],
        orElse: () => InteriorType.none,
      ),
      paymentOptions = PaymentOptions.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.paymentOptions],
        orElse: () => PaymentOptions.none,
      ),
      seatsNumber = json[CarsTableKeys.seatsNumber],
      carCondition = CarConditionType.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.carCondition],
        orElse: () => CarConditionType.none,
      ),
      brandId = json[CarsTableKeys.brandId] ?? '',
      modelId = json[CarsTableKeys.modelId] ?? '',
      features = json[CarsTableKeys.features] == null
          ? null
          : resolveFeaturesFromJson(json[CarsTableKeys.features]),
      whatsAppMessage = WhatsAppMessage.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.whatsappMessage],
        orElse: () => WhatsAppMessage.none,
      ),
      transmissionType = TransmissionType.values.firstWhere(
        (e) => e.name == json[CarsTableKeys.transmissionType],
        orElse: () => TransmissionType.none,
      ),
      location = LocationModel.fromJsonId(
        json[CarsTableKeys.location] as Map<String, dynamic>? ?? {},
      ),
      leads = List<String>.from(json[CarsTableKeys.leads] ?? []),

      views = List<String>.from(json[CarsTableKeys.views] ?? []),

      googleMapsLocation = TextSearchModel.fromJson(
        json[CarsTableKeys.googleMapsLocation] as Map<String, dynamic>? ?? {},
      );

  SellCarUploadModel toEditModel() {
    return SellCarUploadModel(
      carId: carId,
      userId: userId,
      createdAt: createdAt,
      engineSpec: getEngineSpecEntity(engineSpec),

      brand: CarBrand(
        id: brandId,
        name: brand,
        selectedModel: CarModel(
          id: modelId,
          name: model,
          brand: brand,
          brandId: brandId,
        ),
        models: [],
      ),
      status: status,
      year: year.toString(),
      description: description,
      bodyType: bodyType,
      km: km.toString(),
      paintColor: paintColor,
      paintCondition: paintCondition,
      modifications: modifications ?? '',
      serviceHistory: serviceHistory ?? '',
      price: price.toString(),
      version: version ?? '',
      features: features ?? [],
      negotiable: negotiable,

      selectedImages: [],
      uploadedImages: carImages,
      pendingUploadImages: [],
      googleMapsLocation: googleMapsLocation,
      location2: location,
      views: views,
      leads: leads,
      paymentOptions: paymentOptions,
      interiorType: interiorType,
      airConType: airConType,
      seatsNumber: seatsNumber ?? '',
      carCondition: carCondition,
      whatsappMessage: whatsAppMessage,
      transmissionType: transmissionType,
    );
  }
}
