import 'package:google_places_service/domain/entity/structured_formatting_entity.dart';

import 'main_text_matched_substrings.dart';

class StructuredFormatting {
  String? mainText;
  List<MainTextMatchedSubstrings>? mainTextMatchedSubstrings;
  String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  StructuredFormatting.fromJson(Map<String, dynamic> json) {
    if (json["main_text"] is String) {
      mainText = json["main_text"];
    }
    if (json["main_text_matched_substrings"] is List) {
      mainTextMatchedSubstrings = json["main_text_matched_substrings"] == null
          ? null
          : (json["main_text_matched_substrings"] as List)
                .map((e) => MainTextMatchedSubstrings.fromJson(e))
                .toList();
    }
    if (json["secondary_text"] is String) {
      secondaryText = json["secondary_text"];
    }
  }

  static List<StructuredFormatting> fromList(List<Map<String, dynamic>> list) {
    return list.map(StructuredFormatting.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["main_text"] = mainText;
    if (mainTextMatchedSubstrings != null) {
      data["main_text_matched_substrings"] = mainTextMatchedSubstrings
          ?.map((e) => e.toJson())
          .toList();
    }
    data["secondary_text"] = secondaryText;
    return data;
  }

  toEntity() {
    return StructuredFormattingEntity(
      mainText: mainText ?? "",

      secondaryText: secondaryText ?? "",
    );
  }
}
