import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_service/data/models/text_search_model/text_search_model.dart';
import 'package:google_places_service/domain/entity/google_maps_entity.dart';

abstract class GooglePlacesServiceRepo {
  Future<Either<Failure, GoogleMapsEntity>> getAutoComplete(String input);
  Future<Either<Failure, LatLng>> getCarLocation(String placeId);
  Future<Either<Failure, TextSearchModel>> getLocationByName(String placeText);
}
