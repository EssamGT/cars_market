import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_service/data/models/google_maps_auto_complete/google_maps_model.dart';

abstract class GooglePlacesService {
  Future<GoogleMapsModel> getAutoComplete(String input);
  Future<Either<Failure, LatLng>> getCarLocation(String placeId);
}
