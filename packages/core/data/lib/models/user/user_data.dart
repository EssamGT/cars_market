import 'package:data/models/car/sell_car_model.dart';

class UserDataKeys {
  static const String data = 'data';
  static const String favoriteCarsIds = 'favoriteCarsIds';
  static const String listedCarsIds = 'listedCarsIds';
  static const String id = CarsTableKeys.userId;
  static const String name = 'name';
  static const String email = 'email';
  static const String phoneNumber = 'phoneNumber';
  static const String verifiedPhoneNumber = 'verifiedPhoneNumber';
  static const String verifiedEmail = 'verifiedEmail';
  static const String createdAt = 'createdAt';
  static const String role = 'role';
}

class UserData {
  final List<String> favoriteCarsIds;
  final List<String> listedCarsIds;
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final bool verifiedEmail;
  final String createdAt;
  final String role;

  UserData({
    required this.favoriteCarsIds,
    required this.listedCarsIds,
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.verifiedEmail,
    required this.createdAt,
    required this.role,
  });
  factory UserData.init() {
    return UserData(
      favoriteCarsIds: [],
      listedCarsIds: [],
      id: '',
      name: '',
      email: '',
      phoneNumber: '',
      verifiedEmail: false,
      createdAt: '',
      role: '',
    );
  }
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      favoriteCarsIds: List<String>.from(
        json[UserDataKeys.favoriteCarsIds] ?? [],
      ),
      listedCarsIds: List<String>.from(json[UserDataKeys.listedCarsIds] ?? []),
      id: json[UserDataKeys.id] ?? '',
      name: json[UserDataKeys.name] ?? '',
      email: json[UserDataKeys.email] ?? '',
      phoneNumber: json[UserDataKeys.phoneNumber] ?? '',
      verifiedEmail: json[UserDataKeys.verifiedEmail] ?? false,
      createdAt: json[UserDataKeys.createdAt] ?? '',
      role: json[UserDataKeys.role] ?? '',
    );
  }
  factory UserData.fromJsonForListedCars(Map<String, dynamic> json) {
    return UserData(
      favoriteCarsIds: List<String>.from([]),
      listedCarsIds: List<String>.from(json[UserDataKeys.listedCarsIds] ?? []),
      id: json[UserDataKeys.id] ?? '',
      name: json[UserDataKeys.name] ?? '',
      email: json[UserDataKeys.email] ?? '',
      phoneNumber: json[UserDataKeys.phoneNumber] ?? '',
      verifiedEmail: json[UserDataKeys.verifiedEmail] ?? false,
      createdAt: json[UserDataKeys.createdAt] ?? '',
      role: json[UserDataKeys.role] ?? '',
    );
  }
  UserData copyWith(UserData newData) {
    return UserData(
      favoriteCarsIds: newData.favoriteCarsIds,
      listedCarsIds: newData.listedCarsIds,
      id: newData.id,
      name: newData.name,
      email: newData.email,
      phoneNumber: newData.phoneNumber,
      verifiedEmail: newData.verifiedEmail,
      createdAt: newData.createdAt,
      role: newData.role,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserDataKeys.favoriteCarsIds: favoriteCarsIds,
      UserDataKeys.listedCarsIds: listedCarsIds,
      UserDataKeys.createdAt: createdAt,
      UserDataKeys.name: name,
      UserDataKeys.phoneNumber: phoneNumber,
      UserDataKeys.role: role,
    };
  }
}
