import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:injectable/injectable.dart';
import 'package:listed_cars/data/data_source/listed_cars_data_source.dart';
import 'package:listed_cars/domain/repository/listed_cars_repo.dart';
import 'package:remote/network_info/network_info.dart';

@Injectable(as: ListedCarsRepo)
class ListedCarsRepoImpl extends ListedCarsRepo {
  ListedCarsDataSource dataSource;
  NetworkInfo networkInfo;
  ListedCarsRepoImpl(this.dataSource, this.networkInfo);
  @override
  Future<Either<Failure, List<CarEntity>>> getListedCars(
    List<String> listedCarIds,
  ) async {
    if (await networkInfo.isConnected) {
      return await dataSource.getListedCars(listedCarIds);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deactivateCarFromListedCars(
    String carId,
  ) async {
    if (await networkInfo.isConnected) {
      return await dataSource.deactivateCarFromListedCars(carId);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> reactivateCarFromListedCars(
    String carId,
  ) async {
    if (await networkInfo.isConnected) {
      return await dataSource.reactivateCarFromListedCars(carId);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCarFromListedCars(String carId) async {
    if (await networkInfo.isConnected) {
      return await dataSource.deleteCarFromListedCars(carId);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }
}
