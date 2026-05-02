import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';

abstract class FavRepo {
  Future<Either<List<CarEntity>, Failure>> getFavCars(List<String> favCarsIds);
}
