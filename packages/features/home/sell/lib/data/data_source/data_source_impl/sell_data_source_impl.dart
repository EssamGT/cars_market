import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:remote/remote/api/api_manager.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';
import 'package:sell/data/data_source/sell_data_source.dart';

@LazySingleton(as: SellDataSource)
class SellDataSourceImpl implements SellDataSource {
  FirebaseDbManager storageManager;
  ApiManager apiManager;
  SellDataSourceImpl({required this.storageManager, required this.apiManager});

  @override
  Future<Either<Failure, void>> uploadCar(SellCarUploadModel car) async {
    try {
      await storageManager.uploadCar(car);
      return Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseErrorHandler.handleFirestoreError(e));
    } catch (e) {
      return Left(Failure(message: e.toString(), code: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CarImage>>> uploadImages(
    List<XFile> images,
    String uuid,
  ) async {
    try {
      final response = await storageManager.uploadCarImages(images, uuid);
      return Right(response);
    } on FirebaseException catch (e) {
      return Left(FirebaseErrorHandler.handleFirestoreError(e));
    } catch (e) {
      return Left(Failure(message: e.toString(), code: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<XFile>>> downloadOnlineImages(
    List<String> urls,
  ) async {
    try {
      List<XFile> images = [];
      final dir = await getTemporaryDirectory();

      for (String url in urls) {
        final i = urls.indexOf(url);
        final ext = url.split('.').last.split('?').first;
        final filePath = '${dir.path}/image_$i.$ext';
        await apiManager.getImages(url, filePath);
        images.add(XFile(filePath));
      }
      return Right(images);
    } catch (e) {
      return Left(Failure(message: e.toString(), code: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteImages(List<String> paths) async {
    try {
      await storageManager.deleteCarImages(paths);
      return Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseErrorHandler.handleFirestoreError(e));
    } catch (e) {
      return Left(Failure(message: e.toString(), code: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CarImage>> uploadImage(
    XFile image,
    String uuid,
  ) async {
    try {
      final res = await storageManager.uploadCarImage(image, uuid);
      return Right(res);
    } on FirebaseException catch (e) {
      return Left(FirebaseErrorHandler.handleFirestoreError(e));
    } catch (e) {
      return Left(Failure(message: e.toString(), code: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> uploadEditedCar(SellCarUploadModel car) async {
    try {
      await storageManager.uploadEditedCar(car);
      return Right(null);
    } on FirebaseException catch (e) {
      return Left(FirebaseErrorHandler.handleFirestoreError(e));
    } catch (e) {
      return Left(Failure(message: e.toString(), code: e.toString()));
    }
  }
}
