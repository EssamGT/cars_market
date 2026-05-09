import '../data_source/car_listing_data_source.dart';
import '../../domain/repository/car_listing_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';

@Injectable(as: CarListingRepo)
class CarListingRepoImpl extends CarListingRepo {
  final CarListingDataSource dataSource;
  final NetworkInfo networkInfo;
  CarListingRepoImpl({required this.dataSource, required this.networkInfo});
  @override
  Future<Either<Failure, UserData>> getUserData(String userId) async {
    if (await networkInfo.isConnected) {
      return await dataSource.getUserData(userId);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }

  @override
  Future<void> lead(String carId, String userId) async {
    if (await networkInfo.isConnected) {
      await dataSource.lead(carId, userId);
    }
  }

  @override
  Future<void> view(String carId, String userId) async {
    if (await networkInfo.isConnected) {
      await dataSource.view(carId, userId);
    }
  }
}
