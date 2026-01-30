import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:error_handler/error_handler/base_errors/base_error_type.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_service/data/data%20_source/data_source.dart';
import 'package:google_places_service/domain/entity/google_maps_entity.dart';
import 'package:google_places_service/domain/repository/google_places_service_reop.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/network_info/network_info.dart';

@Injectable(as: GooglePlacesServiceRepo)
class GooglePlacesServiceRepoImpl extends GooglePlacesServiceRepo {
  GooglePlacesService service;
  NetworkInfo networkInfo;
  GooglePlacesServiceRepoImpl(this.service, this.networkInfo);
  @override
  Future<Either<Failure, GoogleMapsEntity>> getAutoComplete(
    String input,
  ) async {
    try {
      if (await networkInfo.isConnected) {
        final result = await service.getAutoComplete(input);
        return Right(result.toEntity());
      } else {
        return Left(BaseErrorType.noInternet.getFailure());
      }
    } catch (e) {
      //  return Left();
      print(e);
      return Left(Failure(code: 'no', message: '$e'));
    }
  }

  @override
  Future<Either<Failure, LatLng>> getCarLocation(String placeId) async {
    try {
      if (await networkInfo.isConnected) {
        return service.getCarLocation(placeId);
      } else {
        return Left(BaseErrorType.noInternet.getFailure());
      }
    } catch (e) {
      return Left(Failure(code: 'no', message: '$e'));
    }
  }
}
