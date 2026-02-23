import 'package:constants/constants_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:data/models/failure/failure.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_service/data/data_source/data_source.dart';
import 'package:google_places_service/data/endpoints/endpoints.dart';
import 'package:google_places_service/data/models/google_maps_auto_complete/google_maps_model.dart';
import 'package:google_places_service/data/models/text_search_model/text_search_model.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/api/api_manager.dart';
import 'package:uuid/v4.dart';

@LazySingleton(as: GooglePlacesService)
class GooglePlacesServiceDataSourceImpl implements GooglePlacesService {
  ApiManager apiManager;
  GooglePlacesServiceDataSourceImpl(this.apiManager);
  String sessiontoken = UuidV4().generate();
  final apiKey = dotenv.env[AppConstants.mapsApiKey];
  @override
  Future<GoogleMapsModel> getAutoComplete(String input) async {
    final response = await apiManager
        .getRequest(GpsEndpoints.googlePlacesAutoCompleteBaseUrl, {
          "input": input,
          "components": "country:eg",
          "key": apiKey,
          "sessiontoken": sessiontoken,
          "types": "(cities)",
        });
    return GoogleMapsModel.fromJson(response.data);
  }

  @override
  Future<Either<Failure, LatLng>> getCarLocation(String placeId) async {
    try {
      final locationResponse = await apiManager.getRequest(
        GpsEndpoints.getPlacesDetailsBaseUrl(placeId),
        {"fields": "location", "key": apiKey},
      );
      Map<String, dynamic> locationJson = locationResponse.data['location'];
      LatLng location = LatLng(
        locationJson['latitude'],
        locationJson['longitude'],
      );
      if (location.latitude != 0.0 && location.longitude != 0.0) {
        return Right(location);
      } else {
        return Left(Failure(code: 'd', message: "Failed to get location"));
      }
    } catch (e) {
      return Left(Failure(code: 'e', message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TextSearchModel>> getLocationByName(
    String placeText,
  ) async {
    try {
      final response = await apiManager.postRequest(
        GpsEndpoints.textSearchBaseUrl,
        {
          "Content-Type": "application/json",
          "X-Goog-Api-Key": apiKey,
          "X-Goog-FieldMask":
              "places.displayName,places.formattedAddress,places.location,places.googleMapsLinks",
          "regionCode": "eg",
        },
        {"textQuery": placeText},
      );
      if (response.statusCode == 200) {
        final list = TextSearchModelResponse.fromJson(response.data);
        if (list.places.isNotEmpty) {
          return Right(list.places.first);
        } else {
          return Left(Failure(code: 'd', message: "Failed to get location"));
        }
      } else {
        return Left(Failure(code: 'd', message: "Failed to get location"));
      }
    } catch (e) {
      return Left(Failure(code: 'e', message: e.toString()));
    }
  }
}
