import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_service/domain/entity/predictions_entity.dart';

import 'matched_substrings.dart';
import 'structured_formatting.dart';
import 'terms.dart';

class Predictions {
  String? description;
  List<MatchedSubstrings>? matchedSubstrings;
  String? placeId;
  String? reference;
  StructuredFormatting? structuredFormatting;
  List<Terms>? terms;
  List<String>? types;

  Predictions({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  Predictions.fromJson(Map<String, dynamic> json) {
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["matched_substrings"] is List) {
      matchedSubstrings = json["matched_substrings"] == null
          ? null
          : (json["matched_substrings"] as List)
                .map((e) => MatchedSubstrings.fromJson(e))
                .toList();
    }
    if (json["place_id"] is String) {
      placeId = json["place_id"];
    }
    if (json["reference"] is String) {
      reference = json["reference"];
    }
    if (json["structured_formatting"] is Map) {
      structuredFormatting = json["structured_formatting"] == null
          ? null
          : StructuredFormatting.fromJson(json["structured_formatting"]);
    }
    if (json["terms"] is List) {
      terms = json["terms"] == null
          ? null
          : (json["terms"] as List).map((e) => Terms.fromJson(e)).toList();
    }
    if (json["types"] is List) {
      types = json["types"] == null ? null : List<String>.from(json["types"]);
    }
  }

  static List<Predictions> fromList(List<Map<String, dynamic>> list) {
    return list.map(Predictions.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["description"] = description;
    if (matchedSubstrings != null) {
      data["matched_substrings"] = matchedSubstrings
          ?.map((e) => e.toJson())
          .toList();
    }
    data["place_id"] = placeId;
    data["reference"] = reference;
    if (structuredFormatting != null) {
      data["structured_formatting"] = structuredFormatting?.toJson();
    }
    if (terms != null) {
      data["terms"] = terms?.map((e) => e.toJson()).toList();
    }
    if (types != null) {
      data["types"] = types;
    }
    return data;
  }

  toEntity() {
    return PredictionsEntity(
      description: description ?? "",
      latLng: LatLng(0.0, 0.0),
      placeId: placeId ?? "",
      reference: reference ?? "",
      structuredFormatting: structuredFormatting?.toEntity(),
      types: types ?? [],
    );
  }
}
