import 'package:add/domain/use_case/add_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/car/car2.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';
import 'package:google_places_service/domain/entity/structured_formatting_entity.dart';
import 'package:google_places_service/domain/usecase/gps_use_case.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/v4.dart';
part 'add_state.dart';

@lazySingleton
class AddCubit extends Cubit<AddState> {
  AddUseCase addUseCase;
  GpsUseCase gpsUseCase;
  AddCubit(this.addUseCase, this.gpsUseCase) : super(AddInitial()) {
    initList();
  }

  static AddCubit get(BuildContext context) => BlocProvider.of(context);
  CarModel car = CarModel(
    location: PredictionsEntity(
      description: '',
      placeId: '',
      structuredFormatting: StructuredFormattingEntity(
        mainText: '',
        secondaryText: '',
      ),
      reference: '',
      types: [],
      latLng: LatLng(0.0, 0.0),
    ),
  );
  CarModel2 car2 = CarModel2();
  // final List<String> sug = allCarBrands;
  late ImagePicker picker;
  // late List<XFile> images;

  initList() {
    picker = ImagePicker();
    // images = [];
    car.safetyOptions = [];
    car.images = [];
  }

  void safetyOptionAdd(String safetyOption) {
    car.safetyOptions.add(safetyOption);
    // emit(SafetyOptionsSlected());
  }

  void safetyOptionRemove(String safetyOption) {
    car.safetyOptions.remove(safetyOption);

    // emit(SafetyOptionsSlected());
  }

  Future<void> getImages() async {
    List<XFile> slectedImages = await picker.pickMultiImage();
    if (slectedImages.isEmpty) {
      return;
    } else {
      car.images = slectedImages;
      emit(ImagesSelected(car.images));
    }
  }

  Future<void> addImages() async {
    List<XFile> slectedImages = await picker.pickMultiImage();
    if (slectedImages.isEmpty) {
      return;
    } else {
      for (var element in slectedImages) {
        car.images.add(element);
      }

      emit(ImagesSelected(car.images));
    }
  }

  Future<void> reorderImages(int oldIndex, int newIndex) async {
    car.images.insert(newIndex, car.images.removeAt(oldIndex));
    emit(ImagesSelected(car.images));
  }

  Future<void> deleteImage(int index) async {
    car.images.removeAt(index);
    if (car.images.isEmpty) {
      emit(EmptyImages());
      return;
    }
    emit(ImagesSelected(car.images));
  }

  bool validateImage() {
    if (car.images.isEmpty) {
      emit(EmptyErrorImages());
      return false;
    }
    if (car.images.length < 3) {
      emit(LessThan3ErrorImages(car.images));
      return false;
    }

    return true;
  }

  Future<Either<String, List<CarImage>>> uploadImages(String uuid) async {
    final response = await addUseCase.uploadImage(car.images, uuid);
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
            final carLastResult = await addUseCase.uploadCar(car);
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
    // final response = await addUseCase.uploadCar(car);
    // Future.delayed(Duration(seconds: 5), () {
    //   emit(UploadingSuccess());
    // });
  }

  // bool step1Validation() {
  //   if (car.brand.isEmpty) {
  //     emit(ValidateBrand());
  //     return false;
  //   }
  //   if (car.model.isEmpty) {
  //     emit(ValidateModel());
  //     return false;
  //   }
  //   if (car.description.isEmpty ||
  //       car.description.isNotEmpty && car.description.length < 100) {
  //     print(car.description.length);
  //     emit(ValidateBrand());
  //     return false;
  //   } else {
  //     // sould be true just for testing
  //     return true;
  //     // emit()
  //   }
  // }
}
