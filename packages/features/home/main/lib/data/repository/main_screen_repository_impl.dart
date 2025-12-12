import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:injectable/injectable.dart';
import 'package:main/data/data_source/main_screen_data_source.dart';
import 'package:main/domain/repository/main_screen_repository.dart';
import 'package:remote/network_info/network_info.dart';

@Injectable(as: MainScreenRepository, env: [Environment.prod])
class MainScreenRepositoryImpl extends MainScreenRepository {
  NetworkInfo networkInfo;
  MainScreenDataSource dataSource;
  MainScreenRepositoryImpl({
    required this.networkInfo,
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<CarEntity>>> getMainScreenCars() async {
    if (await networkInfo.isConnected) {
      return await dataSource.getMainScreenCars();
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }
}

@Injectable(as: MainScreenRepository, env: [Environment.dev, Environment.test])
class MainScreenRepositoryImplDev extends MainScreenRepository {
  NetworkInfo networkInfo;
  MainScreenDataSource dataSource;
  MainScreenRepositoryImplDev({
    required this.networkInfo,
    required this.dataSource,
  });
  @override
  Future<Either<Failure, List<CarEntity>>> getMainScreenCars() async {
    if (await networkInfo.isConnected) {
      print('there is Internet Connection');
      return await dataSource.getMainScreenCars();
    } else {
      print('No Internet Connection');
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }
}
