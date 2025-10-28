import 'package:google_places_service/domain/entity/structured_formatting_entity.dart';

class PredictionsEntity {
  String description;
  String placeId;
  String reference;
  StructuredFormattingEntity structuredFormatting;
  List<String> types;

  PredictionsEntity({
    required this.description,
    required this.placeId,
    required this.reference,
    required this.structuredFormatting,
    required this.types,
  });

  PredictionsEntity.fromJson(Map<String, dynamic> json)
    : description = json["description"] ?? "",

      placeId = json["place_id"] ?? "",

      reference = json["reference"] ?? "",
      types = json["types"] != null ? List<String>.from(json["types"]) : [],
      structuredFormatting = StructuredFormattingEntity.fromJson(
        json["structured_formatting"],
      );

  static List<PredictionsEntity> fromList(List<Map<String, dynamic>> list) {
    return list.map(PredictionsEntity.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["description"] = description;

    data["place_id"] = placeId;
    data["reference"] = reference;

    data["structured_formatting"] = structuredFormatting.toJson();

    data["types"] = types;

    return data;
  }
}
