import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';
import 'package:search/data/data_source/search_data_source.dart';

@Injectable(as: SearchDataSource)
class SearchDawImpl extends SearchDataSource {
  final FirebaseDbManager firebaseDbManager;
  SearchDawImpl(this.firebaseDbManager);
  @override
  Future<Either<Failure, List<CarEntity>>> search(
    CarFilterModel searchModel,
  ) async {
    try {
      final result = await firebaseDbManager.searchScreenCars(searchModel);
      return Right(result);
    } catch (e) {
      return Left(Failure(code: "500", message: e.toString()));
    }
  }
}
