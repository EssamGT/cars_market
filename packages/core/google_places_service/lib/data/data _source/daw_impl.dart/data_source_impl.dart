import 'package:constants/constants_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_places_service/data/data%20_source/data_source.dart';
import 'package:google_places_service/data/models/google_maps_auto_complete/google_maps_model.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote/api_manager.dart';
import 'package:uuid/v4.dart';

@Injectable(as: GooglePlacesService)
class GooglePlacesServiceDataSourceImpl implements GooglePlacesService {
  ApiManager apiManager;
  GooglePlacesServiceDataSourceImpl(this.apiManager);
  String sessiontoken = UuidV4().generate();
  final apiKey = dotenv.env[AppConstants.mapsApiKey];
  @override
  Future<GoogleMapsModel> getAutoComplete(String input) async {
    final response = await apiManager
        .getRequest(AppConstants.googlePlacesAutoCompleteBaseUrl, {
          "input": input,
          "components": "country:eg",
          "key": apiKey,
          "sessiontoken": sessiontoken,
          // "types": "locality|point_of_interest|plus_code",
        });
    return GoogleMapsModel.fromJson(response.data);
  }
}
