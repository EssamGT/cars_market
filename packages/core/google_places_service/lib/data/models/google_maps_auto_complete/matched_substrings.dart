class MatchedSubstrings {
  int? length;
  int? offset;

  MatchedSubstrings({this.length, this.offset});

  MatchedSubstrings.fromJson(Map<String, dynamic> json) {
    if (json["length"] is int) {
      length = json["length"];
    }
    if (json["offset"] is int) {
      offset = json["offset"];
    }
  }

  static List<MatchedSubstrings> fromList(List<Map<String, dynamic>> list) {
    return list.map(MatchedSubstrings.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["length"] = length;
    data["offset"] = offset;
    return data;
  }
}
