enum PersonalInfoEditType { name, email, phone, password, none }

class CardModel {
  final String title;
  final String value;
  final bool isVerified;
  final bool showEditIcon;
  final PersonalInfoEditType editType;

  CardModel({
    required this.title,
    required this.value,
    this.isVerified = false,
    this.showEditIcon = true,
    this.editType = PersonalInfoEditType.none,
  });
}
