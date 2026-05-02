import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:favorites/data/data_source/fav_data_source.dart';
import 'package:favorites/domain/repository/fav_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';

@Injectable(as: FavRepo)
class FavRepoImpl extends FavRepo {
  FavDataSource favDataSource;
  NetworkInfo networkInfo;
  FavRepoImpl({required this.networkInfo, required this.favDataSource});
  @override
  Future<Either<List<CarEntity>, Failure>> getFavCars(
    List<String> favCarsIds,
  ) async {
    if (await networkInfo.isConnected) {
      return await favDataSource.getFavCars(favCarsIds);
    } else {
      return Right(BaseErrorType.noInternet.getFailure());
    }
  }
}
