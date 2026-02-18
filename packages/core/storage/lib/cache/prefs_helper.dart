import 'dart:convert';

import 'package:data/models/car/brands_models/car_catalog.dart';
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

  Future<CarCatalogModel?> getCarCatalog() async {
    String? jsonString = _sharedPreferences.getString('cars_catalog');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return CarCatalogModel.fromJson(jsonMap);
    }
    return null;
  }
}
