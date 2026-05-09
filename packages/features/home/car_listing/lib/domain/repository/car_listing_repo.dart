import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';

abstract class CarListingRepo {
  Future<Either<Failure, UserData>> getUserData(String userId);
  Future<void> view(String carId, String userId);
  Future<void> lead(String carId, String userId);
}
