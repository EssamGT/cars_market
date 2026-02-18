import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:main/data/data_source/main_screen_data_source.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';

@LazySingleton(as: MainScreenDataSource,)
class DataSourceImpl extends MainScreenDataSource {
  FirebaseDbManager storageManager;
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

