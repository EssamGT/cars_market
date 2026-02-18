import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:data/models/car/brands_models/air_con_types.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:data/models/car/brands_models/features_model.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/interior_type.dart';
import 'package:data/models/car/brands_models/negotiation.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:data/models/car/brands_models/payment_options.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:data/models/car/brands_models/wahtsaap_message.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_service/domain/usecase/gps_use_case.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:sell/domain/use_case/sell_use_case.dart';
import 'package:uuid/v4.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
part 'sell_state.dart';

@lazySingleton
class SellCubit extends Cubit<SellState> {
  SellUseCase sellUseCase;
  GpsUseCase gpsUseCase;
  SellCubit(this.sellUseCase, this.gpsUseCase) : super(AddInitial()) {
    initList();
  }

  static SellCubit get(BuildContext context) => BlocProvider.of(context);
  SellCarUploadModel car = SellCarUploadModel();

  late ImagePicker picker;

  int imagesLimit = 10;
  int imagesQuality = 100;
  void initList() {
    picker = ImagePicker();
  }

  void setFuelType(FuelType fuelType) {
    if (fuelType == FuelType.electric &&
        car.engineSpec.fuelType != FuelType.electric) {
      car.engineSpec.fuelType = fuelType;
      car.engineSpec.clearEngine();
      emit(FuelTypeSlected());
    } else if (fuelType != FuelType.electric &&
        car.engineSpec.fuelType == FuelType.electric) {
      car.engineSpec.fuelType = fuelType;
      car.engineSpec.clearEngine();

      emit(FuelTypeSlected());
    } else {
      car.engineSpec.fuelType = fuelType;
      car.engineSpec.clearEngine();
    }
  }

  void setCarConditionType(CarConditionType condition) {
    car.carCondition = condition;
  }

  void setTransmissionType(TransmissionType transmissionType) {
    car.transmissionType = transmissionType;
  }

  void setPaintColor(PaintColors paintColor) {
    car.paintColor = paintColor;
  }

  void setPaintCondition(PaintConditions paintCondition) {
    car.paintCondition = paintCondition;
  }

  void setBodyType(CarBodyType bodyType) {
    car.bodyType = bodyType;
  }

  void setEngine(EngineSpec engineSpec) {
    car.engineSpec.engineCylinderNumber = engineSpec.engineCylinderNumber;
    car.engineSpec.engineCapacity = engineSpec.engineCapacity;
  }

  void setCarBrand(CarBrand carBrand) {
    car.setBrand(carBrand);
  }

  void setCarModel(CarModel carModel) {
    car.setModel(carModel);
  }

  void resetCarBrandAndModel() {
    car.resetCarBrandAndModel();
  }

  void setNegotiationType(NegotiationType negotiation) {
    if (car.negotiable != negotiation) {
      car.negotiable = negotiation;
    }
  }

  void setAirConType(AirConTypes airConType) {
    if (car.airConType != airConType) {
      car.airConType = airConType;
    }
  }

  void setInteriorType(InteriorType interiorType) {
    if (car.interiorType != interiorType) {
      car.interiorType = interiorType;
    }
  }

  void setPaymentOptions(PaymentOptions paymentOptions) {
    if (car.paymentOptions != paymentOptions) {
      car.paymentOptions = paymentOptions;
    }
  }

  void setWahtsaapMessage(WahtsaapMessage wahtsaapMessage) {
    if (car.wahtsaapMessage != wahtsaapMessage) {
      car.wahtsaapMessage = wahtsaapMessage;
    }
  }

  void addFeature(FeaturesList featuresList, int index) {
    late int listIndex;
    bool found = false;
    for (int i = 0; i < car.features.length; i++) {
      if (car.features[i].id == featuresList.id) {
        listIndex = i;
        found = true;
        break;
      } else {
        found = false;
      }
    }
    if (found) {
      if (car.features[listIndex].features.contains(
        featuresList.features[index],
      )) {
        car.features[listIndex].features.remove(featuresList.features[index]);
        if (car.features[listIndex].features.isEmpty) {
          car.features.removeAt(listIndex);
        }
      } else {
        car.features[listIndex].features.add(featuresList.features[index]);
      }
    } else {
      final newList = FeaturesList(
        id: featuresList.id,
        title: featuresList.title,
        features: [featuresList.features[index]],
      );
      car.features.add(newList);
    }
  }

  bool isFeatureSelected(FeaturesList featuresList, int index) {
    late int listIndex;
    bool found = false;
    for (int i = 0; i < car.features.length; i++) {
      if (car.features[i].id == featuresList.id) {
        listIndex = i;
        found = true;
        break;
      } else {
        found = false;
      }
    }
    if (found) {
      return car.features[listIndex].features.contains(
        featuresList.features[index],
      );
    } else {
      return false;
    }
  }

  int getSelectedFeaturesCount() {
    int itemsCount = 0;
    if (car.features.isNotEmpty) {
      for (int i = 0; i < car.features.length; i++) {
        itemsCount += car.features[i].features.length;
      }
      return itemsCount;
    } else {
      return 0;
    }
  }

  Future<void> getImages() async {
    List<XFile> slectedImages = await picker.pickMultiImage(
      imageQuality: imagesQuality,
      limit: imagesLimit,
    );
    if (slectedImages.isEmpty) {
      return;
    } else {
      car.selectedImages = slectedImages;
      // emit(ImagesSelected(car.images));
    }
  }

  Future<void> addImages() async {
    List<XFile> slectedImages = await picker.pickMultiImage(
      imageQuality: imagesQuality,
      limit: imagesLimit - car.selectedImages.length,
    );
    if (slectedImages.isEmpty) {
      return;
    } else {
      for (var element in slectedImages) {
        car.selectedImages.add(element);
      }
    }
  }

  Future<void> compressImages(List<XFile> images) async {
    List<XFile> compressedImages = [];
    for (XFile image in images) {
      final file = File(image.path);

      final dir = await getTemporaryDirectory();
      final targetPath = '${dir.path}/${const UuidV4().generate()}.webp';
      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        format: CompressFormat.webp,
        quality: 80,
        minWidth: 1600,
      );
      if (result != null) {
        compressedImages.add(result);
      }
    }
    car.pendingUploadImages = compressedImages;
  }

  Future<void> reorderImages(int oldIndex, int newIndex) async {
    car.selectedImages.insert(newIndex, car.selectedImages.removeAt(oldIndex));
  }

  Future<void> deleteImage(int index) async {
    car.selectedImages.removeAt(index);
    if (car.selectedImages.isEmpty) {
      return;
    }
  }

  Future<Either<String, List<CarImage>>> uploadImages(String uuid) async {
    await compressImages(car.selectedImages);

    final response = await sellUseCase.uploadImage(
      car.pendingUploadImages,
      uuid,
    );
    return response;
  }

  Future<void> uploadCar() async {
    emit(UploadingLoading());
    String uuid = UuidV4().generate();
    car.carId = uuid;
    car.createdAt = DateTime.now().toString();
    final result = await uploadImages(uuid);
    result.fold(
      (error) {
        emit(UploadingError(error));
      },
      (images) async {
        car.uploadedImages = images;
        final latLng = await gpsUseCase.getCarLocation(car.location.placeId);
        latLng.fold(
          (error) {
            emit(UploadingError(error.message));
          },
          (sucs) async {
            car.location.latLng = sucs;
            final carLastResult = await sellUseCase.uploadCar(car);
            carLastResult.fold(
              (error) {
                emit(UploadingError(error));
              },
              (suc) {
                emit(UploadingSuccess());
              },
            );
          },
        );
      },
    );
  }
}
