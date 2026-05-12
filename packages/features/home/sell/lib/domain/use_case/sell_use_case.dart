import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:sell/domain/repository/sell_repository.dart';

@lazySingleton
class SellUseCase {
  SellRepository sellRepository;
  SellUseCase({required this.sellRepository});
  Future<Either<Failure, List<CarImage>>> uploadImages(
    List<XFile> images,
    String uuid,
  ) => sellRepository.uploadImages(images, uuid);

  Future<Either<Failure, void>> uploadCar(SellCarUploadModel car) =>
      sellRepository.uploadCar(car);

  Future<Either<Failure, List<XFile>>> downloadOnlineImages(
    List<String> urls,
  ) async => await sellRepository.downloadOnlineImages(urls);
  Future<Either<Failure, void>> deleteImages(List<String> paths) async =>
      await sellRepository.deleteImages(paths);
  Future<Either<Failure, CarImage>> uploadImage(
    XFile image,
    String uuid,
  ) async => await sellRepository.uploadImage(image, uuid);
  Future<Either<Failure, void>> uploadEditedCar(SellCarUploadModel car) async =>
      await sellRepository.uploadEditedCar(car);
}
