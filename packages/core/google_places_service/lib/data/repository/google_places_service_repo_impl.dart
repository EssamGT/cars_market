import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
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
        return Left(Failure(code: 'no', message: 'no'));
      }
    } catch (e) {
      //  return Left();
      print(e);
      return Left(Failure(code: 'no', message: '$e'));
    }
  }
}
