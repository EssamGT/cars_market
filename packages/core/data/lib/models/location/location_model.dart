import 'package:data/models/location/locations_catalog.dart';

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
    return locationCatalog.firstWhere(
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
}
