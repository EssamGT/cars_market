import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';
import 'package:search/data/data_source/search_data_source.dart';
import 'package:search/domain/repository/search_repo.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl extends SearchRepo {
  final SearchDataSource searchDataSource;
  final NetworkInfo networkInfo;
  SearchRepoImpl(this.searchDataSource, this.networkInfo);
  @override
  Future<Either<Failure, List<CarEntity>>> search(
    CarFilterModelRequest searchModel,
  ) async {
    if (await networkInfo.isConnected) {
      return await searchDataSource.search(searchModel);
    } else {
      return Left(BaseErrorType.noInternet.getFailure());
    }
  }
}
