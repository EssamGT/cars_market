import '../car_edit_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';

@LazySingleton(as: CarEditDataSource)
class CarEditDataSourceImpl implements CarEditDataSource {
  FirebaseDbManager storageManager;
  CarEditDataSourceImpl({required this.storageManager});

  @override
  Future<Either<String, void>> uploadCar(SellCarUploadModel car) async {
    try {
      await storageManager.uploadCar(car);
      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CarImage>>> uploadImage(
    List<XFile> images,
    String uuid,
  ) async {
    try {
      final response = await storageManager.uploadCarImages(images, uuid);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
