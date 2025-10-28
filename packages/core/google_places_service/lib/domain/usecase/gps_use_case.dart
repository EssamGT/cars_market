import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:google_places_service/domain/entity/google_maps_entity.dart';
import 'package:google_places_service/domain/repository/google_places_service_reop.dart';
import 'package:injectable/injectable.dart';

@injectable
 class GpsUseCase {
  GooglePlacesServiceRepo repo;
  GpsUseCase(this.repo);
  Future<Either<Failure, GoogleMapsEntity>> autoComplete(String input) =>
      repo.getAutoComplete(input);
}
