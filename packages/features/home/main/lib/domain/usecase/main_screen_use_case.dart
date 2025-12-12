import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:main/domain/repository/main_screen_repository.dart';

@injectable
class MainScreenUseCase {
  MainScreenRepository repository;
  MainScreenUseCase({required this.repository});

  Future<Either<Failure, List<CarEntity>>> getMainScreenCars() {
    return repository.getMainScreenCars();
  }
}
