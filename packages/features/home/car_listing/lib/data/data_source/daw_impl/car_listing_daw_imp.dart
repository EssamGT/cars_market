import '../car_listing_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart' show Failure;
import 'package:data/models/user/user_data.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_ext.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_handler.dart';
import 'package:error_handler/error_handler/firebase_error_handler/firebase_error_type.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/firebase/firebase_db_manager.dart';

@Injectable(as: CarListingDataSource)
class CarListingDawImp extends CarListingDataSource {
  final FirebaseDbManager dbManager;
  CarListingDawImp({required this.dbManager});
  @override
  Future<Either<Failure, UserData>> getUserData(String userId) async {
    try {
      final userData = await dbManager.getOwnerData(userId);
      return Right(userData);
    } on FirebaseException catch (e) {
      return Left(FirebaseErrorHandler.handleFirestoreError(e));
    } catch (e) {
      return Left(FirebaseErrorType.unknown.getFailure());
    }
  }

  @override
  Future<void> lead(String carId, String userId) async {
    await dbManager.lead(carId, userId);
  }

  @override
  Future<void> view(String carId, String userId) async {
    await dbManager.view(carId, userId);
  }
}
