import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:favorites/domain/repository/fav_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavUseCase {
  FavRepo favRepo;
  FavUseCase({required this.favRepo});
  Future<Either<List<CarEntity>, Failure>> getFavCars(
    List<String> favCarsIds,
  ) async {
    return await favRepo.getFavCars(favCarsIds);
  }
}
