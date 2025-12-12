import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:main/data/data_source/main_screen_data_source.dart';
import 'package:storage/data/remote/storage_manager.dart';

@Injectable(as: MainScreenDataSource, env: [Environment.prod])
class DataSourceImpl extends MainScreenDataSource {
  StorageManager storageManager;
  DataSourceImpl({required this.storageManager});
  @override
  Future<Either<Failure, List<CarEntity>>> getMainScreenCars() async {
    try {
      final result = await storageManager.getMainScreenCars();
      return Right(result);
    } catch (e) {
      return Left(Failure(code: '', message: e.toString()));
    }
  }
}

@Injectable(as: MainScreenDataSource, env: [Environment.dev, Environment.test])
class DataSourceImplDev extends MainScreenDataSource {
  StorageManager storageManager;
  DataSourceImplDev({required this.storageManager});
  @override
  Future<Either<Failure, List<CarEntity>>> getMainScreenCars() async {
    try {
      final result = await storageManager.getMainScreenCars();
      print('firebase cars length: ${result.length}');
      return Right(result);
    } catch (e) {
      print("Failure : ${e.toString()}");
      return Left(Failure(code: '', message: e.toString()));
    }
  }
}
