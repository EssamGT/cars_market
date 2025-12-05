import 'package:add/data/data_source/add_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/car_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/storage/storage_manager.dart';

@Injectable(as: AddDataSource, env: [Environment.dev, Environment.test])
class AddDataSourceImpl implements AddDataSource {
  StorageManager storageManger;
  AddDataSourceImpl({required this.storageManger});

  @override
  Future<Either<String, void>> uploadCar(CarModel car) async {
    try {
      await storageManger.uploadCar(car);
      return Right(null);
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CarImage>>> uploadImage(
    List<XFile> images,
    String uuid,
  ) async {
    try {
      final response = await storageManger.uploadCarImages(images, uuid);
      return Right(response);
    } catch (e) {
      print(e);

      return Left(e.toString());
    }
  }
}

@Injectable(as: AddDataSource, env: [Environment.prod])
class AddDataSourceImplProd implements AddDataSource {
  StorageManager storageManager;
  AddDataSourceImplProd({required this.storageManager});

  @override
  Future<Either<String, void>> uploadCar(CarModel car) async {
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
