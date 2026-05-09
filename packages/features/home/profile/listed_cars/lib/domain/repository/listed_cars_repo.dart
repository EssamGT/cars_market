import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';

abstract class ListedCarsRepo {
  Future<Either<Failure, List<CarEntity>>> getListedCars(
    List<String> listedCarIds,
  );
}
