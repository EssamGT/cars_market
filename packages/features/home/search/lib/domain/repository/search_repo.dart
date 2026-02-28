import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<CarEntity>>> search(CarFilterModel searchModel);
}
