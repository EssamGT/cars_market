import 'package:dartz/dartz.dart';
import 'package:data/models/car/car_filter_model.dart';
import 'package:data/models/failure/failure.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:search/domain/repository/search_repo.dart';

@injectable
class SearchUseCase {
  final SearchRepo searchRepo;
  SearchUseCase(this.searchRepo);
  Future<Either<Failure, List<CarEntity>>> search(
    CarFilterModelRequest searchModel,
  ) async => searchRepo.search(searchModel);
}
