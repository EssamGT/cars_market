import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:injectable/injectable.dart';
import 'package:main/data/data_source/main_screen_data_source.dart';
import 'package:main/domain/repository/main_screen_repository.dart';
import 'package:remote/network_info/network_info.dart';

@LazySingleton(as: MainScreenRepository, )
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
