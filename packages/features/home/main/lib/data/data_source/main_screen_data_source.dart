import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';

abstract class MainScreenDataSource {
  Future<Either<Failure, List<CarEntity>>> getMainScreenCars();
}
