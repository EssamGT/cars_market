
import 'package:google_places_service/data/models/google_maps_auto_complete/google_maps_model.dart';

abstract class GooglePlacesService {
  Future<GoogleMapsModel> getAutoComplete(String input);
}