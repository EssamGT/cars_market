import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:favorites/data/data_source/fav_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';

@Injectable(as: FavDataSource)
class FavDawImpl extends FavDataSource {
  FirebaseDbManager firebaseDbManager;
  FavDawImpl({required this.firebaseDbManager});
  @override
  Future<Either<List<CarEntity>, Failure>> getFavCars(
    List<String> favCarsIds,
  ) async {
    try {
      final res = await firebaseDbManager.getCarsByIds(favCarsIds);
      return Left(res);
    } catch (e) {
      return Right(Failure(code: e.toString(), message: e.toString()));
    }
  }
}
