class MainTextMatchedSubstrings {
  int? length;
  int? offset;

  MainTextMatchedSubstrings({this.length, this.offset});

  MainTextMatchedSubstrings.fromJson(Map<String, dynamic> json) {
    if (json["length"] is int) {
      length = json["length"];
    }
    if (json["offset"] is int) {
      offset = json["offset"];
    }
  }

  static List<MainTextMatchedSubstrings> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(MainTextMatchedSubstrings.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["length"] = length;
    data["offset"] = offset;
    return data;
  }
}
