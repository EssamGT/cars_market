import 'dart:convert';

import 'package:data/models/car/brands_models/car_catalog.dart';
import 'package:data/models/location/locations_catalog.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PrefsHelper {
  final SharedPreferences _sharedPreferences;
  PrefsHelper(this._sharedPreferences);

  Future<void> setCarCatalog(CarCatalogModel carCatalog) async {
    String jsonString = jsonEncode(carCatalog.toJson());
    await _sharedPreferences.setString('cars_catalog', jsonString);
  }

  CarCatalogModel? getCarCatalog() {
    String? jsonString = _sharedPreferences.getString('cars_catalog');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return CarCatalogModel.fromJson(jsonMap);
    }
    return null;
  }

  Future<void> setLocationCatalog(LocationsCatalog locCatalog) async {
    String jsonString = jsonEncode(locCatalog.toJson());
    await _sharedPreferences.setString('locations_catalog', jsonString);
  }

  LocationsCatalog? getLocationCatalog() {
    String? jsonString = _sharedPreferences.getString('locations_catalog');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return LocationsCatalog.fromJson(jsonMap);
    }
    return null;
  }
}
