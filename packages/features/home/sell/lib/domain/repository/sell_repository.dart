import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class SellRepository {
  Future<Either<String, List<CarImage>>> uploadImage(List<XFile> images,String uuid);
  Future<Either<String, void>> uploadCar(SellCarUploadModel car);

}
