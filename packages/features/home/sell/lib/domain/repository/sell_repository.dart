import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:image_picker/image_picker.dart';

abstract class SellRepository {
  Future<Either<Failure, List<CarImage>>> uploadImages(
    List<XFile> images,
    String uuid,
  );
  Future<Either<Failure, CarImage>> uploadImage(XFile image, String uuid);
  Future<Either<Failure, void>> uploadCar(SellCarUploadModel car);
  Future<Either<Failure, void>> uploadEditedCar(SellCarUploadModel car);
  Future<Either<Failure, List<XFile>>> downloadOnlineImages(List<String> urls);
  Future<Either<Failure, void>> deleteImages(List<String> paths);
}
