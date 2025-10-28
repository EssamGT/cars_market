import 'package:add/domain/repository/add_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddUseCase {
  AddRepository addRepository;
  AddUseCase({required this.addRepository});
  Future<Either<String, List<CarImage>>> uploadImage(
    List<XFile> images,
    String uuid,
  ) => addRepository.uploadImage(images, uuid);

  Future<Either<String, void>> uploadCar(CarModel car) =>
      addRepository.uploadCar(car);
}
