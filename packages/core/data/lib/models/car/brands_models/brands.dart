import 'package:constants/constants_manager.dart';
import 'package:data/models/car/brands_models/car_models.dart';

// const List<String> allCarBrands = [
//   // 🇩🇪 Germany
//   "BMW",
//   "Mercedes-Benz",
//   "Audi",
//   "Volkswagen",
//   "Porsche",
//   "Opel",
//   "Maybach",

//   "Smart",

//   // 🇯🇵 Japan
//   "Toyota",
//   "Lexus",
//   "Nissan",
//   "Infiniti",
//   "Honda",
//   "Acura",
//   "Mazda",
//   "Subaru",
//   "Mitsubishi",
//   "Suzuki",
//   "Daihatsu",
//   "Isuzu",

//   // 🇰🇷 Korea
//   "Hyundai",
//   "Kia",
//   "Genesis",

//   // 🇫🇷 France
//   "Peugeot",
//   "Citroën",
//   "Renault",
//   "DS Automobiles",
//   "Bugatti",

//   // 🇮🇹 Italy
//   "Fiat",
//   "Alfa Romeo",
//   "Ferrari",
//   "Maserati",
//   "Lamborghini",
//   "Pagani",

//   // 🇸🇪 Sweden
//   "Volvo",
//   "Polestar",
//   "Koenigsegg",

//   // 🇬🇧 United Kingdom
//   "Aston Martin",
//   "Bentley",
//   "Rolls-Royce",
//   "McLaren",
//   "Mini (UK)",
//   "Jaguar",
//   "Land Rover",
//   "Lotus",
//   "Vauxhall",

//   // 🇪🇸 Spain
//   "SEAT",
//   "Cupra",

//   // 🇺🇸 United States
//   "Ford",
//   "Chevrolet",
//   "GMC",
//   "Cadillac",
//   "Chrysler",
//   "Dodge",
//   "Jeep",
//   "Ram",
//   "Lincoln",
//   "Buick",
//   "Tesla",
//   "Lucid",
//   "Rivian",
//   "Hummer",

//   // 🇨🇦 Canada
//   "Campagna",
//   "Conquest Vehicles",

//   // 🇨🇳 China
//   "Great Wall",
//   "Haval",
//   "Changan",
//   "NIO",
//   "XPeng",
//   "Hongqi",
//   "Lynk & Co",
//   "Zeekr",
//   "Leapmotor",
//   "MG",
//   "BYTON",
//   "Wuling",
//   "Baojun",
//   "NEVS",

//   // 🇮🇳 India
//   "Tata",
//   "Mahindra",
//   "Maruti Suzuki",

//   // 🇻🇳 Vietnam
//   "VinFast",

//   // 🇲🇾 Malaysia
//   "Proton",
//   "Perodua",

//   // 🇮🇷 Iran
//   "IKCO",
//   "Saipa",

//   // 🇹🇷 Turkey
//   "TOGG",

//   // 🇷🇺 Russia
//   "Lada",
//   "GAZ",

//   // 🇨🇭 Switzerland
//   "Rinspeed",

//   // 🇳🇱 Netherlands
//   "Spyker",
//   "VDL Nedcar",

//   // 🇷🇴 Romania
//   "Dacia",

//   // 🇨🇿 Czech Republic
//   "Škoda",

//   // 🇺🇦 Ukraine
//   "ZAZ",

//   // 🇧🇷 Brazil
//   "Troller",

//   // 🇦🇺 Australia
//   "Holden",

//   // 🇮🇩 Indonesia
//   "Esemka",

//   // 🇸🇦 Saudi Arabia
//   "Ceer",

//   // 🇪🇬 Egypt
//   "Nasr",

//   // EV startups / New brands 🌍
//   "Fisker",
//   "Faraday Future",
//   "Aptera",
//   "Canoo",
//   "Lordstown",
//   "Lucid Motors",
//   "VinFast",
//   "NIO",
//   "XPeng",
//   "Rivian",
//   "Zeekr",
//   "BYD",
//   "Polestar",
//   "Aiways",
//   "Leapmotor",
//   "Li Auto",
//   "WM Motor",
// ];

class CarBrand {
  final String id;
  final String name;
  final String logoUrl;
  final double version;

  final List<CarModel> models;
  final CarModel selectedModel;
  const CarBrand._({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.models,
    required this.selectedModel,
    required this.version,
  });

  factory CarBrand({
    required String id,
    required String name,
    String? logoUrl,
    required List<CarModel> models,
    CarModel? selectedModel,
    double? version,
  }) {
    return CarBrand._(
      id: id,
      name: name,
      logoUrl: logoUrl ?? AppConstants.defaultCarImageUrl(id),
      models: models,
      selectedModel: selectedModel ?? const CarModel(id: '', name: ''),
      version: version ?? 1.0,
    );
  }
  factory CarBrand.empty({
    String? id,
    String? name,
    String? logoUrl,
    List<CarModel>? models,
    CarModel? selectedModel,
    double? version,
  }) {
    return CarBrand._(
      id: id ?? '',
      name: name ?? '',
      logoUrl: logoUrl ?? '',
      models: models ?? [],
      selectedModel: selectedModel ?? const CarModel(id: '', name: ''),
      version: version ?? 1.0,
    );
  }
  toJson() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'models': models.map((model) => model.toJson()).toList(),
      'version': version,
    };
  }

  factory CarBrand.fromJson(Map<String, dynamic> json) {
    return CarBrand(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      logoUrl: json['logoUrl'] ?? '',
      models:
          (json['models'] as List<dynamic>?)
              ?.map((modelJson) => CarModel.fromJson(modelJson))
              .toList() ??
          [],
      // selectedModel: json['selectedModel'] != null
      //     ? CarModel.fromJson(json['selectedModel'])
      //     : const CarModel(id: '', name: ''),
      version: json['version'] ?? 1.0,
    );
  }
}
