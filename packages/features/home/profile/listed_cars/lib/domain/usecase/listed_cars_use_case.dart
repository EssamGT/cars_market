import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:listed_cars/domain/repository/listed_cars_repo.dart';

@injectable
class ListedCarsUseCase {
  ListedCarsRepo repo;
  ListedCarsUseCase(this.repo);
  Future<Either<Failure, List<CarEntity>>> getListedCars(
    List<String> listedCarIds,
  ) async => await repo.getListedCars(listedCarIds);
  Future<Either<Failure, void>> deactivateCarFromListedCars(
    String carId,
  ) async => await repo.deactivateCarFromListedCars(carId);
  Future<Either<Failure, void>> deleteCarFromListedCars(String carId) async =>
      await repo.deleteCarFromListedCars(carId);
  Future<Either<Failure, void>> reactivateCarFromListedCars(String carId) async =>
      await repo.reactivateCarFromListedCars(carId);
}
