import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_ext.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_handler.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_type.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:listed_cars/data/data_source/listed_cars_data_source.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';

@Injectable(as: ListedCarsDataSource)
class ListedCarsDawImpl extends ListedCarsDataSource {
  final FirebaseDbManager firebaseDbManager;
  ListedCarsDawImpl(this.firebaseDbManager);

  @override
  Future<Either<Failure, List<CarEntity>>> getListedCars(
    List<String> listedCarIds,
  ) async {
    try {
      final listedCars = await firebaseDbManager.getCarsByIds(listedCarIds);
      return Right(listedCars);
    } on FirebaseException catch (e) {
      return Left(FirebaseErrorHandler.handleFirestoreError(e));
    } catch (e) {
      return Left(FirebaseErrorType.unknown.getFailure());
    }
  }
}
