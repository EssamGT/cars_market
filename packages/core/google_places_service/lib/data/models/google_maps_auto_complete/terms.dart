class Terms {
  int? offset;
  String? value;

  Terms({this.offset, this.value});

  Terms.fromJson(Map<String, dynamic> json) {
    if (json["offset"] is int) {
      offset = json["offset"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
  }

  static List<Terms> fromList(List<Map<String, dynamic>> list) {
    return list.map(Terms.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["offset"] = offset;
    data["value"] = value;
    return data;
  }
}
