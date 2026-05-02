import 'package:data/models/car/sell_car_model.dart';

class UserDataKeys {
  static const String data = 'data';
  static const String favoriteCarsIds = 'favoriteCarsIds';
  static const String userListedCarsIds = 'userListedCarsIds';
  static const String id = CarsTableKeys.userId;
  static const String name = 'name';
  static const String email = 'email';
  static const String phoneNumber = 'phoneNumber';
  static const String verifiedPhoneNumber = 'verifiedPhoneNumber';
  static const String verifiedEmail = 'verifiedEmail';
  static const String createdAt = 'createdAt';
}

class UserData {
  final List<String> favoriteCarsIds;
  final List<String> userListedCarsIds;
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final bool verifiedEmail;
  final String createdAt;

  UserData({
    required this.favoriteCarsIds,
    required this.userListedCarsIds,
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.verifiedEmail,
    required this.createdAt,
  });
  factory UserData.init() {
    return UserData(
      favoriteCarsIds: [],
      userListedCarsIds: [],
      id: '',
      name: '',
      email: '',
      phoneNumber: '',
      verifiedEmail: false,
      createdAt: '',
    );
  }
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      favoriteCarsIds: List<String>.from(
        json[UserDataKeys.favoriteCarsIds] ?? [],
      ),
      userListedCarsIds: List<String>.from(
        json[UserDataKeys.userListedCarsIds] ?? [],
      ),
      id: json[UserDataKeys.id] ?? '',
      name: json[UserDataKeys.name] ?? '',
      email: json[UserDataKeys.email] ?? '',
      phoneNumber: json[UserDataKeys.phoneNumber] ?? '',
      verifiedEmail: json[UserDataKeys.verifiedEmail] ?? false,
      createdAt: json[UserDataKeys.createdAt] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      UserDataKeys.favoriteCarsIds: favoriteCarsIds,
      UserDataKeys.userListedCarsIds: userListedCarsIds,
      UserDataKeys.createdAt: createdAt,
    };
  }
}
