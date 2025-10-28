import 'package:google_places_service/domain/entity/google_maps_entity.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';

import 'predictions.dart';

class GoogleMapsModel {
  List<Predictions>? predictions;
  String? status;

  GoogleMapsModel({this.predictions, this.status});

  GoogleMapsModel.fromJson(Map<String, dynamic> json) {
    if (json["predictions"] is List) {
      predictions = json["predictions"] == null
          ? null
          : (json["predictions"] as List)
                .map((e) => Predictions.fromJson(e))
                .toList();
    }
    if (json["status"] is String) {
      status = json["status"];
    }
  }

  static List<GoogleMapsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(GoogleMapsModel.fromJson).toList();
  }

  toEntity() {
    return GoogleMapsEntity(
      predictions: predictions!
          .map<PredictionsEntity>((e) => e.toEntity())
          .toList(),
      status: status ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (predictions != null) {
      data["predictions"] = predictions?.map((e) => e.toJson()).toList();
    }
    data["status"] = status;
    return data;
  }
}
