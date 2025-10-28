import 'package:google_places_service/domain/entity/predictions_entity.dart';

class GoogleMapsEntity {
  List<PredictionsEntity> predictions;
  String status;

  GoogleMapsEntity({required this.predictions, required this.status});

  GoogleMapsEntity.fromJson(Map<String, dynamic> json)
    : predictions = json["predictions"] = (json["predictions"] as List)
          .map((e) => PredictionsEntity.fromJson(e))
          .toList(),
      status = json["status"];

  static List<GoogleMapsEntity> fromList(List<Map<String, dynamic>> list) {
    return list.map(GoogleMapsEntity.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["predictions"] = predictions.map((e) => e.toJson()).toList();

    data["status"] = status;
    return data;
  }
}
