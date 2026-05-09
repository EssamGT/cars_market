import '../repository/car_edit_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CarEditUseCase {
  CarEditRepository sellRepository;
  CarEditUseCase({required this.sellRepository});
  Future<Either<String, List<CarImage>>> uploadImage(
    List<XFile> images,
    String uuid,
  ) => sellRepository.uploadImage(images, uuid);

  Future<Either<String, void>> uploadCar(SellCarUploadModel car) =>
      sellRepository.uploadCar(car);
}
