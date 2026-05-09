import '../repository/car_listing_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:data/models/user/user_data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CarListingUseCase {
  final CarListingRepo repo;
  CarListingUseCase({required this.repo});
  Future<Either<Failure, UserData>> getUserData(String userId) async =>
      await repo.getUserData(userId);

  Future<void> view(String carId, String userId) async =>
      await repo.view(carId, userId);
  Future<void> lead(String carId, String userId) async =>
      await repo.lead(carId, userId);
}
