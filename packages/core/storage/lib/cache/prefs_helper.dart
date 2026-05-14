import 'dart:convert';
import 'dart:ui';

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

  CarCatalogModel getCarCatalog() {
    String? jsonString = _sharedPreferences.getString('cars_catalog');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return CarCatalogModel.fromJson(jsonMap);
    }
    return CarCatalogModel.empty();
  }

  Future<void> setLocationCatalog(LocationsCatalog locCatalog) async {
    String jsonString = jsonEncode(locCatalog.toJson());
    await _sharedPreferences.setString('locations_catalog', jsonString);
  }

  LocationsCatalog getLocationCatalog() {
    String? jsonString = _sharedPreferences.getString('locations_catalog');
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return LocationsCatalog.fromJson(jsonMap);
    }
    return LocationsCatalog.empty();
  }

  void setFavoriteCarsIds(List<String> ids) {
    _sharedPreferences.setStringList('favorite_cars_ids', ids);
  }

  List<String> getFavoriteCarsIds() {
    return _sharedPreferences.getStringList('favorite_cars_ids') ?? [];
  }

  int getThemeMode() {
    return _sharedPreferences.getInt('theme_mode') ?? 0;
  }

  void setThemeMode(int mode) {
    _sharedPreferences.setInt('theme_mode', mode);
  }

  void setLocale(String locale) {
    _sharedPreferences.setString('locale', locale);
  }

  String getLocale() {
    final lanCode = _sharedPreferences.getString('locale');
    if (lanCode != null) {
      return lanCode;
    } else {
      final sysLanCode = PlatformDispatcher.instance.locale.languageCode;
      if (sysLanCode == "ar") {
        return "ar";
      }
      if (sysLanCode == "en") {
        return "en";
      }
    }
    return "en"; // Default locale
  }
}
