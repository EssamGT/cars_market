class StructuredFormattingEntity {
  final String mainText;
  final String secondaryText;
  StructuredFormattingEntity({
    required this.mainText,
    required this.secondaryText,
  });

  StructuredFormattingEntity.fromJson(Map<String, dynamic> json)
      : mainText = json["main_text"] ?? '',
        secondaryText = json["secondary_text"] ?? '';

  static List<StructuredFormattingEntity> fromList(
    List<Map<String, dynamic>> list,
  ) {
    return list.map(StructuredFormattingEntity.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["main_text"] = mainText;

    data["secondary_text"] = secondaryText;
    return data;
  }

}
