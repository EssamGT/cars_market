import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_image.dart';
import 'package:data/models/car/sell_car_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';
import 'package:sell/data/data_source/sell_data_source.dart';
import 'package:sell/domain/repository/sell_repository.dart';

@LazySingleton(as: SellRepository)
class SellRepoImpl implements SellRepository {
  SellDataSource sellDataSource;
  NetworkInfo networkInfo;
  SellRepoImpl({required this.sellDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<CarImage>>> uploadImages(
    List<XFile> images,
    String uuid,
  ) async {
    if (await networkInfo.isConnected) {
      return await sellDataSource.uploadImages(images, uuid);
    }
    return Left(BaseErrorType.noInternet.getFailure());
  }

  @override
  Future<Either<Failure, void>> uploadCar(SellCarUploadModel car) async {
    if (await networkInfo.isConnected) {
      return await sellDataSource.uploadCar(car);
    }
    return Left(BaseErrorType.noInternet.getFailure());
  }

  @override
  Future<Either<Failure, List<XFile>>> downloadOnlineImages(
    List<String> urls,
  ) async {
    if (await networkInfo.isConnected) {
      return await sellDataSource.downloadOnlineImages(urls);
    }
    return Left(BaseErrorType.noInternet.getFailure());
  }

  @override
  Future<Either<Failure, void>> deleteImages(List<String> paths) async {
    if (await networkInfo.isConnected) {
      return sellDataSource.deleteImages(paths);
    }
    return Left(BaseErrorType.noInternet.getFailure());
  }

  @override
  Future<Either<Failure, CarImage>> uploadImage(
    XFile image,
    String uuid,
  ) async {
    if (await networkInfo.isConnected) {
      return sellDataSource.uploadImage(image, uuid);
    }
    return Left(BaseErrorType.noInternet.getFailure());
  }

  @override
  Future<Either<Failure, void>> uploadEditedCar(SellCarUploadModel car) async {
    if (await networkInfo.isConnected) {
      return sellDataSource.uploadEditedCar(car);
    }
    return Left(BaseErrorType.noInternet.getFailure());
  }
}
