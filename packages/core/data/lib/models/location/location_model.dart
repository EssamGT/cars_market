import 'package:cars_market/di/di.dart';
import 'package:storage/cache/prefs_helper.dart';

class LocationModel {
  String nameEn;
  String nameAr;
  String governorateEn;
  String governorateAr;
  String id;
  LocationModel({
    required this.nameEn,
    required this.nameAr,
    required this.governorateEn,
    required this.governorateAr,
    required this.id,
  });
  Map<String, dynamic> toJson() {
    return {
      "name_en": nameEn,
      "name_ar": nameAr,
      "governorate_en": governorateEn,
      "governorate_ar": governorateAr,
      "id": id,
    };
  }

  Map<String, dynamic> toJsonId() {
    return {"id": id};
  }

  factory LocationModel.fromJsonId(Map<String, dynamic> json) {
    final locationCatalog = getIt.get<PrefsHelper>().getLocationCatalog();
    return locationCatalog.locationsCatalog.firstWhere(
      (element) => element.id == json["id"],
      orElse: () => LocationModel.empty(),
    );
  }

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
      governorateEn: json["governorate_en"],
      governorateAr: json["governorate_ar"],
      id: json["id"],
    );
  }

  factory LocationModel.empty() {
    return LocationModel(
      nameEn: "",
      nameAr: "",
      governorateEn: "",
      governorateAr: "",
      id: "",
    );
  }
  factory LocationModel.all() {
    return LocationModel(
      nameEn: "All",
      nameAr: "الكل",
      governorateEn: "",
      governorateAr: "",
      id: "",
    );
  }
  String getLocationName() {
    if (nameEn == governorateEn) {
      return nameEn;
    }

    return '$nameEn, $governorateEn';
  }
}
