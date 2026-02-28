import 'package:constants/constants_manager.dart';

class CarModel {
  final String id;
  final String name;
  final String brand;
  final String brandId;

  const CarModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.brandId,
  });
  String getLogoUrl() {
    return AppConstants.basetBrandLogoUrl(brandId);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'brand': brand, 'brandId': brandId};
  }

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      brand: json['brand'] ?? '',
      brandId: json['brandId'] ?? '',
    );
  }
  String getFullName() {
    return "$brand $name";
  }
}

class CarModelFilter {
  final String? id;
  final String name;
  final String? brand;
  final String? brandId;

  const CarModelFilter({this.id, required this.name, this.brand, this.brandId});

  factory CarModelFilter.nullable() {
    return const CarModelFilter(
      id: null,
      name: '',
      brand: null,
      brandId: null,
    );
  }
  String getLogoUrl() {
    return AppConstants.basetBrandLogoUrl(brandId ?? '');
  }

  String getFullName() {
    return "$brand $name";
  }
}

List<CarModel> toyotaModels = [
  CarModel(id: "corolla", name: "Corolla", brand: "Toyota", brandId: "toyota"),
  CarModel(
    id: "corolla_cross",
    name: "Corolla Cross",
    brand: "Toyota",
    brandId: "toyota",
  ),
  CarModel(id: "camry", name: "Camry", brand: "Toyota", brandId: "toyota"),
  CarModel(id: "yaris", name: "Yaris", brand: "Toyota", brandId: "toyota"),
  CarModel(id: "rav4", name: "RAV4", brand: "Toyota", brandId: "toyota"),
  CarModel(
    id: "highlander",
    name: "Highlander",
    brand: "Toyota",
    brandId: "toyota",
  ),
  CarModel(
    id: "fortuner",
    name: "Fortuner",
    brand: "Toyota",
    brandId: "toyota",
  ),
  CarModel(id: "hilux", name: "Hilux", brand: "Toyota", brandId: "toyota"),
  CarModel(
    id: "land_cruiser",
    name: "Land Cruiser",
    brand: "Toyota",
    brandId: "toyota",
  ),
  CarModel(id: "prius", name: "Prius", brand: "Toyota", brandId: "toyota"),
  CarModel(id: "c_hr", name: "C-HR", brand: "Toyota", brandId: "toyota"),
  CarModel(id: "supra", name: "Supra", brand: "Toyota", brandId: "toyota"),
  CarModel(id: "tacoma", name: "Tacoma", brand: "Toyota", brandId: "toyota"),
  CarModel(id: "tundra", name: "Tundra", brand: "Toyota", brandId: "toyota"),
  CarModel(id: "avalon", name: "Avalon", brand: "Toyota", brandId: "toyota"),
  CarModel(id: "other", name: "other", brand: "Toyota", brandId: "toyota"),
];

List<CarModel> hondaModels = [
  CarModel(id: "civic", name: "Civic", brand: "Honda", brandId: "honda"),
  CarModel(id: "accord", name: "Accord", brand: "Honda", brandId: "honda"),
  CarModel(id: "city", name: "City", brand: "Honda", brandId: "honda"),
  CarModel(id: "cr_v", name: "CR-V", brand: "Honda", brandId: "honda"),
  CarModel(id: "hr_v", name: "HR-V", brand: "Honda", brandId: "honda"),
  CarModel(id: "br_v", name: "BR-V", brand: "Honda", brandId: "honda"),
  CarModel(id: "pilot", name: "Pilot", brand: "Honda", brandId: "honda"),
  CarModel(id: "odyssey", name: "Odyssey", brand: "Honda", brandId: "honda"),
  CarModel(id: "fit", name: "Fit", brand: "Honda", brandId: "honda"),
  CarModel(id: "jazz", name: "Jazz", brand: "Honda", brandId: "honda"),
  CarModel(
    id: "ridgeline",
    name: "Ridgeline",
    brand: "Honda",
    brandId: "honda",
  ),
  CarModel(id: "passport", name: "Passport", brand: "Honda", brandId: "honda"),
  CarModel(id: "insight", name: "Insight", brand: "Honda", brandId: "honda"),
  CarModel(id: "other", name: "other", brand: "Honda", brandId: "honda"),
];

List<CarModel> nissanModels = [
  CarModel(id: "altima", name: "Altima", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "sentra", name: "Sentra", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "sunny", name: "Sunny", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "maxima", name: "Maxima", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "leaf", name: "Leaf", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "murano", name: "Murano", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "rogue", name: "Rogue", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "x_trail", name: "X-Trail", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "qashqai", name: "Qashqai", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "juke", name: "Juke", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "kicks", name: "Kicks", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "navara", name: "Navara", brand: "Nissan", brandId: "nissan"),
  CarModel(
    id: "frontier",
    name: "Frontier",
    brand: "Nissan",
    brandId: "nissan",
  ),
  CarModel(id: "370z", name: "370Z", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "z", name: "Z", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "gt_r", name: "GT-R", brand: "Nissan", brandId: "nissan"),
  CarModel(id: "other", name: "other", brand: "Nissan", brandId: "nissan"),
];

List<CarModel> mazdaModels = [
  CarModel(id: "mazda2", name: "Mazda2", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "mazda3", name: "Mazda3", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "mazda6", name: "Mazda6", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "cx_3", name: "CX-3", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "cx_30", name: "CX-30", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "cx_5", name: "CX-5", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "cx_50", name: "CX-50", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "cx_9", name: "CX-9", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "cx_90", name: "CX-90", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "mx_5", name: "MX-5 Miata", brand: "Mazda", brandId: "mazda"),
  CarModel(id: "other", name: "other", brand: "Mazda", brandId: "mazda"),
];

List<CarModel> mitsubishiModels = [
  CarModel(
    id: "lancer",
    name: "Lancer",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
  CarModel(
    id: "mirage",
    name: "Mirage",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
  CarModel(
    id: "attrage",
    name: "Attrage",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
  CarModel(
    id: "outlander",
    name: "Outlander",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
  CarModel(
    id: "outlander_sport",
    name: "Outlander Sport",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
  CarModel(
    id: "eclipse_cross",
    name: "Eclipse Cross",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
  CarModel(
    id: "xpander",
    name: "Xpander",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
  CarModel(
    id: "pajero",
    name: "Pajero",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
  CarModel(
    id: "triton",
    name: "Triton",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "Mitsubishi",
    brandId: "mitsubishi",
  ),
];

List<CarModel> subaruModels = [
  CarModel(id: "impreza", name: "Impreza", brand: "Subaru", brandId: "subaru"),
  CarModel(id: "legacy", name: "Legacy", brand: "Subaru", brandId: "subaru"),
  CarModel(id: "outback", name: "Outback", brand: "Subaru", brandId: "subaru"),
  CarModel(
    id: "forester",
    name: "Forester",
    brand: "Subaru",
    brandId: "subaru",
  ),
  CarModel(
    id: "crosstrek",
    name: "Crosstrek",
    brand: "Subaru",
    brandId: "subaru",
  ),
  CarModel(id: "wrx", name: "WRX", brand: "Subaru", brandId: "subaru"),
  CarModel(id: "brz", name: "BRZ", brand: "Subaru", brandId: "subaru"),
  CarModel(id: "ascent", name: "Ascent", brand: "Subaru", brandId: "subaru"),
  CarModel(id: "other", name: "other", brand: "Subaru", brandId: "subaru"),
];

List<CarModel> suzukiModels = [
  CarModel(id: "swift", name: "Swift", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "dzire", name: "Dzire", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "ciaz", name: "Ciaz", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "celerio", name: "Celerio", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "baleno", name: "Baleno", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "alto", name: "Alto", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "vitara", name: "Vitara", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "s_cross", name: "S-Cross", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "ertiga", name: "Ertiga", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "jimny", name: "Jimny", brand: "Suzuki", brandId: "suzuki"),
  CarModel(id: "other", name: "other", brand: "Suzuki", brandId: "suzuki"),
];

List<CarModel> hyundaiModels = [
  CarModel(
    id: "grand_i10",
    name: "Grand i10",
    brand: "Hyundai",
    brandId: "hyundai",
  ),
  CarModel(id: "getz", name: "Getz", brand: "Hyundai", brandId: "hyundai"),
  CarModel(id: "accent", name: "Accent", brand: "Hyundai", brandId: "hyundai"),
  CarModel(id: "verna", name: "Verna", brand: "Hyundai", brandId: "hyundai"),
  CarModel(
    id: "elantra",
    name: "Elantra",
    brand: "Hyundai",
    brandId: "hyundai",
  ),
  CarModel(id: "sonata", name: "Sonata", brand: "Hyundai", brandId: "hyundai"),
  CarModel(id: "tucson", name: "Tucson", brand: "Hyundai", brandId: "hyundai"),
  CarModel(
    id: "santa_fe",
    name: "Santa Fe",
    brand: "Hyundai",
    brandId: "hyundai",
  ),
  CarModel(
    id: "palisade",
    name: "Palisade",
    brand: "Hyundai",
    brandId: "hyundai",
  ),
  CarModel(id: "kona", name: "Kona", brand: "Hyundai", brandId: "hyundai"),
  CarModel(id: "creta", name: "Creta", brand: "Hyundai", brandId: "hyundai"),
  CarModel(id: "venue", name: "Venue", brand: "Hyundai", brandId: "hyundai"),
  CarModel(id: "ioniq", name: "Ioniq", brand: "Hyundai", brandId: "hyundai"),
  CarModel(
    id: "ioniq_5",
    name: "Ioniq 5",
    brand: "Hyundai",
    brandId: "hyundai",
  ),
  CarModel(
    id: "ioniq_6",
    name: "Ioniq 6",
    brand: "Hyundai",
    brandId: "hyundai",
  ),
  CarModel(id: "staria", name: "Staria", brand: "Hyundai", brandId: "hyundai"),
  CarModel(id: "other", name: "other", brand: "Hyundai", brandId: "hyundai"),
];

List<CarModel> kiaModels = [
  CarModel(id: "picanto", name: "Picanto", brand: "Kia", brandId: "kia"),
  CarModel(id: "rio", name: "Rio", brand: "Kia", brandId: "kia"),
  CarModel(id: "cerato", name: "Cerato", brand: "Kia", brandId: "kia"),
  CarModel(id: "k3", name: "K3", brand: "Kia", brandId: "kia"),
  CarModel(id: "optima", name: "Optima", brand: "Kia", brandId: "kia"),
  CarModel(id: "k5", name: "K5", brand: "Kia", brandId: "kia"),
  CarModel(id: "k6", name: "K6", brand: "Kia", brandId: "kia"),
  CarModel(id: "carens", name: "Carens", brand: "Kia", brandId: "kia"),
  CarModel(id: "soul", name: "Soul", brand: "Kia", brandId: "kia"),
  CarModel(id: "sportage", name: "Sportage", brand: "Kia", brandId: "kia"),
  CarModel(id: "sorento", name: "Sorento", brand: "Kia", brandId: "kia"),
  CarModel(id: "seltos", name: "Seltos", brand: "Kia", brandId: "kia"),
  CarModel(id: "telluride", name: "Telluride", brand: "Kia", brandId: "kia"),
  CarModel(id: "carnival", name: "Carnival", brand: "Kia", brandId: "kia"),
  CarModel(id: "ev6", name: "EV6", brand: "Kia", brandId: "kia"),
  CarModel(id: "ev9", name: "EV9", brand: "Kia", brandId: "kia"),
  CarModel(id: "other", name: "other", brand: "Kia", brandId: "kia"),
];

List<CarModel> lexusModels = [
  CarModel(id: "is", name: "IS", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "es", name: "ES", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "gs", name: "GS", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "ls", name: "LS", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "rx", name: "RX", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "nx", name: "NX", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "gx", name: "GX", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "lx", name: "LX", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "ux", name: "UX", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "rc", name: "RC", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "lc", name: "LC", brand: "Lexus", brandId: "lexus"),
  CarModel(id: "other", name: "other", brand: "Lexus", brandId: "lexus"),
];

List<CarModel> infinitiModels = [
  CarModel(id: "q50", name: "Q50", brand: "Infiniti", brandId: "infiniti"),
  CarModel(id: "q60", name: "Q60", brand: "Infiniti", brandId: "infiniti"),
  CarModel(id: "q70", name: "Q70", brand: "Infiniti", brandId: "infiniti"),
  CarModel(id: "qx30", name: "QX30", brand: "Infiniti", brandId: "infiniti"),
  CarModel(id: "qx50", name: "QX50", brand: "Infiniti", brandId: "infiniti"),
  CarModel(id: "qx60", name: "QX60", brand: "Infiniti", brandId: "infiniti"),
  CarModel(id: "qx80", name: "QX80", brand: "Infiniti", brandId: "infiniti"),
  CarModel(id: "other", name: "other", brand: "Infiniti", brandId: "infiniti"),
];

List<CarModel> acuraModels = [
  CarModel(id: "ilx", name: "ILX", brand: "Acura", brandId: "acura"),
  CarModel(id: "tlx", name: "TLX", brand: "Acura", brandId: "acura"),
  CarModel(id: "rlx", name: "RLX", brand: "Acura", brandId: "acura"),
  CarModel(id: "rdx", name: "RDX", brand: "Acura", brandId: "acura"),
  CarModel(id: "mdx", name: "MDX", brand: "Acura", brandId: "acura"),
  CarModel(id: "nsx", name: "NSX", brand: "Acura", brandId: "acura"),
  CarModel(id: "integra", name: "Integra", brand: "Acura", brandId: "acura"),
  CarModel(id: "other", name: "other", brand: "Acura", brandId: "acura"),
];

List<CarModel> genesisModels = [
  CarModel(id: "g70", name: "G70", brand: "Genesis", brandId: "genesis"),
  CarModel(id: "g80", name: "G80", brand: "Genesis", brandId: "genesis"),
  CarModel(id: "g90", name: "G90", brand: "Genesis", brandId: "genesis"),
  CarModel(id: "gv60", name: "GV60", brand: "Genesis", brandId: "genesis"),
  CarModel(id: "gv70", name: "GV70", brand: "Genesis", brandId: "genesis"),
  CarModel(id: "gv80", name: "GV80", brand: "Genesis", brandId: "genesis"),
  CarModel(id: "other", name: "other", brand: "Genesis", brandId: "genesis"),
];

List<CarModel> isuzuModels = [
  CarModel(id: "d_max", name: "D-Max", brand: "Isuzu", brandId: "isuzu"),
  CarModel(id: "mu_x", name: "MU-X", brand: "Isuzu", brandId: "isuzu"),
  CarModel(id: "trooper", name: "Trooper", brand: "Isuzu", brandId: "isuzu"),
  CarModel(id: "axiom", name: "Axiom", brand: "Isuzu", brandId: "isuzu"),
  CarModel(id: "other", name: "other", brand: "Isuzu", brandId: "isuzu"),
];

List<CarModel> protonModels = [
  CarModel(id: "saga", name: "Saga", brand: "Proton", brandId: "proton"),
  CarModel(id: "persona", name: "Persona", brand: "Proton", brandId: "proton"),
  CarModel(id: "iriz", name: "Iriz", brand: "Proton", brandId: "proton"),
  CarModel(id: "x50", name: "X50", brand: "Proton", brandId: "proton"),
  CarModel(id: "x70", name: "X70", brand: "Proton", brandId: "proton"),
  CarModel(id: "x90", name: "X90", brand: "Proton", brandId: "proton"),
  CarModel(id: "other", name: "other", brand: "Proton", brandId: "proton"),
];

List<CarModel> peroduaModels = [
  CarModel(id: "myvi", name: "Myvi", brand: "Perodua", brandId: "perodua"),
  CarModel(id: "axia", name: "Axia", brand: "Perodua", brandId: "perodua"),
  CarModel(id: "bezza", name: "Bezza", brand: "Perodua", brandId: "perodua"),
  CarModel(id: "ativa", name: "Ativa", brand: "Perodua", brandId: "perodua"),
  CarModel(id: "alza", name: "Alza", brand: "Perodua", brandId: "perodua"),
  CarModel(id: "other", name: "other", brand: "Perodua", brandId: "perodua"),
];

List<CarModel> tataModels = [
  CarModel(id: "nexon", name: "Nexon", brand: "Tata", brandId: "tata"),
  CarModel(id: "safari", name: "Safari", brand: "Tata", brandId: "tata"),
  CarModel(id: "harrier", name: "Harrier", brand: "Tata", brandId: "tata"),
  CarModel(id: "altroz", name: "Altroz", brand: "Tata", brandId: "tata"),
  CarModel(id: "tiago", name: "Tiago", brand: "Tata", brandId: "tata"),
  CarModel(id: "punch", name: "Punch", brand: "Tata", brandId: "tata"),
  CarModel(id: "tigor", name: "Tigor", brand: "Tata", brandId: "tata"),
  CarModel(id: "other", name: "other", brand: "Tata", brandId: "tata"),
];

List<CarModel> mahindraModels = [
  CarModel(
    id: "scorpio",
    name: "Scorpio",
    brand: "Mahindra",
    brandId: "mahindra",
  ),
  CarModel(
    id: "xuv300",
    name: "XUV300",
    brand: "Mahindra",
    brandId: "mahindra",
  ),
  CarModel(
    id: "xuv500",
    name: "XUV500",
    brand: "Mahindra",
    brandId: "mahindra",
  ),
  CarModel(
    id: "xuv700",
    name: "XUV700",
    brand: "Mahindra",
    brandId: "mahindra",
  ),
  CarModel(id: "thar", name: "Thar", brand: "Mahindra", brandId: "mahindra"),
  CarModel(
    id: "bolero",
    name: "Bolero",
    brand: "Mahindra",
    brandId: "mahindra",
  ),
  CarModel(id: "other", name: "other", brand: "Mahindra", brandId: "mahindra"),
];

List<CarModel> bydModels = [
  CarModel(id: "f3", name: "F3", brand: "BYD", brandId: "byd"),
  CarModel(id: "l3", name: "L3", brand: "BYD", brandId: "byd"),
  CarModel(id: "atto_3", name: "Atto 3", brand: "BYD", brandId: "byd"),
  CarModel(id: "han", name: "Han", brand: "BYD", brandId: "byd"),
  CarModel(id: "tang", name: "Tang", brand: "BYD", brandId: "byd"),
  CarModel(id: "seal", name: "Seal", brand: "BYD", brandId: "byd"),
  CarModel(id: "dolphin", name: "Dolphin", brand: "BYD", brandId: "byd"),
  CarModel(id: "song_plus", name: "Song Plus", brand: "BYD", brandId: "byd"),
  CarModel(id: "sealion_7", name: "Sealion 7", brand: "BYD", brandId: "byd"),
  CarModel(id: "other", name: "other", brand: "BYD", brandId: "byd"),
];

List<CarModel> geelyModels = [
  CarModel(id: "coolray", name: "Coolray", brand: "Geely", brandId: "geely"),
  CarModel(id: "azkarra", name: "Azkarra", brand: "Geely", brandId: "geely"),
  CarModel(id: "okavango", name: "Okavango", brand: "Geely", brandId: "geely"),
  CarModel(id: "emgrand", name: "Emgrand", brand: "Geely", brandId: "geely"),
  CarModel(id: "monjaro", name: "Monjaro", brand: "Geely", brandId: "geely"),
  CarModel(id: "x7", name: "X7", brand: "Geely", brandId: "geely"),
  CarModel(id: "tugella", name: "Tugella", brand: "Geely", brandId: "geely"),
  CarModel(
    id: "geometry_a",
    name: "Geometry A",
    brand: "Geely",
    brandId: "geely",
  ),
  CarModel(
    id: "geometry_c",
    name: "Geometry C",
    brand: "Geely",
    brandId: "geely",
  ),
  CarModel(id: "other", name: "other", brand: "Geely", brandId: "geely"),
];

List<CarModel> bmwModels = [
  CarModel(id: "116", name: "116", brand: "BMW", brandId: "bmw"),
  CarModel(id: "118", name: "118", brand: "BMW", brandId: "bmw"),
  CarModel(id: "120", name: "120", brand: "BMW", brandId: "bmw"),
  CarModel(id: "125", name: "125", brand: "BMW", brandId: "bmw"),
  CarModel(id: "128", name: "128", brand: "BMW", brandId: "bmw"),
  CarModel(id: "130", name: "130", brand: "BMW", brandId: "bmw"),
  CarModel(id: "135", name: "135", brand: "BMW", brandId: "bmw"),
  CarModel(id: "140", name: "140", brand: "BMW", brandId: "bmw"),
  CarModel(id: "m1", name: "M1", brand: "BMW", brandId: "bmw"),

  CarModel(id: "216", name: "216", brand: "BMW", brandId: "bmw"),
  CarModel(id: "218", name: "218", brand: "BMW", brandId: "bmw"),
  CarModel(id: "220", name: "220", brand: "BMW", brandId: "bmw"),
  CarModel(id: "225", name: "225", brand: "BMW", brandId: "bmw"),
  CarModel(id: "228", name: "228", brand: "BMW", brandId: "bmw"),
  CarModel(id: "230", name: "230", brand: "BMW", brandId: "bmw"),
  CarModel(id: "235", name: "235", brand: "BMW", brandId: "bmw"),
  CarModel(id: "240", name: "240", brand: "BMW", brandId: "bmw"),
  CarModel(id: "m2", name: "M2", brand: "BMW", brandId: "bmw"),

  CarModel(id: "316", name: "316", brand: "BMW", brandId: "bmw"),
  CarModel(id: "318", name: "318", brand: "BMW", brandId: "bmw"),
  CarModel(id: "320", name: "320", brand: "BMW", brandId: "bmw"),
  CarModel(id: "325", name: "325", brand: "BMW", brandId: "bmw"),
  CarModel(id: "328", name: "328", brand: "BMW", brandId: "bmw"),
  CarModel(id: "330", name: "330", brand: "BMW", brandId: "bmw"),
  CarModel(id: "335", name: "335", brand: "BMW", brandId: "bmw"),
  CarModel(id: "340", name: "340", brand: "BMW", brandId: "bmw"),
  CarModel(id: "m3", name: "M3", brand: "BMW", brandId: "bmw"),

  CarModel(id: "418", name: "418", brand: "BMW", brandId: "bmw"),
  CarModel(id: "420", name: "420", brand: "BMW", brandId: "bmw"),
  CarModel(id: "425", name: "425", brand: "BMW", brandId: "bmw"),
  CarModel(id: "428", name: "428", brand: "BMW", brandId: "bmw"),
  CarModel(id: "430", name: "430", brand: "BMW", brandId: "bmw"),
  CarModel(id: "435", name: "435", brand: "BMW", brandId: "bmw"),
  CarModel(id: "440", name: "440", brand: "BMW", brandId: "bmw"),
  CarModel(id: "m4", name: "M4", brand: "BMW", brandId: "bmw"),

  CarModel(id: "520", name: "520", brand: "BMW", brandId: "bmw"),
  CarModel(id: "525", name: "525", brand: "BMW", brandId: "bmw"),
  CarModel(id: "528", name: "528", brand: "BMW", brandId: "bmw"),
  CarModel(id: "530", name: "530", brand: "BMW", brandId: "bmw"),
  CarModel(id: "535", name: "535", brand: "BMW", brandId: "bmw"),
  CarModel(id: "540", name: "540", brand: "BMW", brandId: "bmw"),
  CarModel(id: "545", name: "545", brand: "BMW", brandId: "bmw"),
  CarModel(id: "550", name: "550", brand: "BMW", brandId: "bmw"),
  CarModel(id: "555", name: "555", brand: "BMW", brandId: "bmw"),
  CarModel(id: "m5", name: "M5", brand: "BMW", brandId: "bmw"),

  CarModel(id: "640", name: "640", brand: "BMW", brandId: "bmw"),
  CarModel(id: "650", name: "650", brand: "BMW", brandId: "bmw"),
  CarModel(id: "m6", name: "M6", brand: "BMW", brandId: "bmw"),

  CarModel(id: "730", name: "730", brand: "BMW", brandId: "bmw"),
  CarModel(id: "740", name: "740", brand: "BMW", brandId: "bmw"),
  CarModel(id: "745", name: "745", brand: "BMW", brandId: "bmw"),
  CarModel(id: "750", name: "750", brand: "BMW", brandId: "bmw"),
  CarModel(id: "760", name: "760", brand: "BMW", brandId: "bmw"),
  CarModel(id: "m760", name: "M 760", brand: "BMW", brandId: "bmw"),

  CarModel(id: "x1", name: "X1", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x2", name: "X2 ", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x3", name: "X3", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x3m", name: "X3 M", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x4", name: "X4", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x4m", name: "X4 M", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x5", name: "X5", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x5m", name: "X5 M", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x6", name: "X6", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x6m", name: "X6 M", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x7", name: "X7", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x7m", name: "X7 M", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x8", name: "X8", brand: "BMW", brandId: "bmw"),
  CarModel(id: "x8m", name: "X8 M", brand: "BMW", brandId: "bmw"),
  CarModel(id: "xm", name: "XM", brand: "BMW", brandId: "bmw"),
  CarModel(id: "z1", name: "Z1", brand: "BMW", brandId: "bmw"),
  CarModel(id: "z2", name: "Z2", brand: "BMW", brandId: "bmw"),
  CarModel(id: "z3", name: "Z3", brand: "BMW", brandId: "bmw"),
  CarModel(id: "z4", name: "Z4", brand: "BMW", brandId: "bmw"),
  CarModel(id: "z8", name: "Z8", brand: "BMW", brandId: "bmw"),
  CarModel(id: "820", name: "820", brand: "BMW", brandId: "bmw"),
  CarModel(id: "830", name: "830", brand: "BMW", brandId: "bmw"),
  CarModel(id: "840", name: "840", brand: "BMW", brandId: "bmw"),
  CarModel(id: "850", name: "850", brand: "BMW", brandId: "bmw"),
  CarModel(id: "m8", name: "M8", brand: "BMW", brandId: "bmw"),
  CarModel(id: "i3", name: "i3", brand: "BMW", brandId: "bmw"),
  CarModel(id: "i4", name: "i4", brand: "BMW", brandId: "bmw"),
  CarModel(id: "i5", name: "i5", brand: "BMW", brandId: "bmw"),
  CarModel(id: "i6", name: "i6", brand: "BMW", brandId: "bmw"),
  CarModel(id: "i7", name: "i7", brand: "BMW", brandId: "bmw"),
  CarModel(id: "i8", name: "i8", brand: "BMW", brandId: "bmw"),
  CarModel(id: "iX", name: "iX", brand: "BMW", brandId: "bmw"),
  CarModel(id: "ix1", name: "ix1", brand: "BMW", brandId: "bmw"),
  CarModel(id: "iX2", name: "iX2", brand: "BMW", brandId: "bmw"),
  CarModel(id: "iX3", name: "iX3", brand: "BMW", brandId: "bmw"),
  CarModel(id: "iX40", name: "iX40", brand: "BMW", brandId: "bmw"),
  CarModel(id: "iX50", name: "iX50", brand: "BMW", brandId: "bmw"),
  CarModel(id: "other", name: "other", brand: "BMW", brandId: "bmw"),
];

List<CarModel> volkswagenModels = [
  CarModel(
    id: "polo",
    name: "Polo",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "golf",
    name: "Golf",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "jetta",
    name: "Jetta",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "passat",
    name: "Passat",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "arteon",
    name: "Arteon",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "tiguan",
    name: "Tiguan",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "touareg",
    name: "Touareg",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "t_roc",
    name: "T-Roc",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "taos",
    name: "Taos",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "id_3",
    name: "ID.3",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "id_4",
    name: "ID.4",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "id_5",
    name: "ID.5",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "id_buzz",
    name: "ID. Buzz",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "Volkswagen",
    brandId: "volkswagen",
  ),
];

List<CarModel> volvoModels = [
  CarModel(id: "xc40", name: "XC40", brand: "Volvo", brandId: "volvo"),
  CarModel(id: "xc60", name: "XC60", brand: "Volvo", brandId: "volvo"),
  CarModel(id: "xc90", name: "XC90", brand: "Volvo", brandId: "volvo"),
  CarModel(id: "s60", name: "S60", brand: "Volvo", brandId: "volvo"),
  CarModel(id: "s90", name: "S90", brand: "Volvo", brandId: "volvo"),
  CarModel(id: "v60", name: "V60", brand: "Volvo", brandId: "volvo"),
  CarModel(id: "v90", name: "V90", brand: "Volvo", brandId: "volvo"),
  CarModel(id: "ex30", name: "EX30", brand: "Volvo", brandId: "volvo"),
  CarModel(id: "ex90", name: "EX90", brand: "Volvo", brandId: "volvo"),
  CarModel(id: "other", name: "other", brand: "Volvo", brandId: "volvo"),
];

List<CarModel> renaultModels = [
  CarModel(id: "clio", name: "Clio", brand: "Renault", brandId: "renault"),
  CarModel(id: "megane", name: "Megane", brand: "Renault", brandId: "renault"),
  CarModel(id: "captur", name: "Captur", brand: "Renault", brandId: "renault"),
  CarModel(id: "kadjar", name: "Kadjar", brand: "Renault", brandId: "renault"),
  CarModel(
    id: "talisman",
    name: "Talisman",
    brand: "Renault",
    brandId: "renault",
  ),
  CarModel(id: "koleos", name: "Koleos", brand: "Renault", brandId: "renault"),
  CarModel(id: "arkana", name: "Arkana", brand: "Renault", brandId: "renault"),
  CarModel(
    id: "austral",
    name: "Austral",
    brand: "Renault",
    brandId: "renault",
  ),
  CarModel(id: "zoe", name: "Zoe", brand: "Renault", brandId: "renault"),
  CarModel(id: "other", name: "other", brand: "Renault", brandId: "renault"),
];

List<CarModel> peugeotModels = [
  CarModel(id: "208", name: "208", brand: "Peugeot", brandId: "peugeot"),
  CarModel(id: "2008", name: "2008", brand: "Peugeot", brandId: "peugeot"),
  CarModel(id: "308", name: "308", brand: "Peugeot", brandId: "peugeot"),
  CarModel(id: "3008", name: "3008", brand: "Peugeot", brandId: "peugeot"),
  CarModel(id: "408", name: "408", brand: "Peugeot", brandId: "peugeot"),
  CarModel(id: "4008", name: "4008", brand: "Peugeot", brandId: "peugeot"),
  CarModel(id: "508", name: "508", brand: "Peugeot", brandId: "peugeot"),
  CarModel(id: "5008", name: "5008", brand: "Peugeot", brandId: "peugeot"),
  CarModel(id: "rifter", name: "Rifter", brand: "Peugeot", brandId: "peugeot"),
  CarModel(id: "other", name: "other", brand: "Peugeot", brandId: "peugeot"),
];

List<CarModel> citroenModels = [
  CarModel(id: "c3", name: "C3", brand: "Citroen", brandId: "citroen"),
  CarModel(id: "c4", name: "C4", brand: "Citroen", brandId: "citroen"),
  CarModel(
    id: "c5_aircross",
    name: "C5 Aircross",
    brand: "Citroen",
    brandId: "citroen",
  ),
  CarModel(
    id: "berlingo",
    name: "Berlingo",
    brand: "Citroen",
    brandId: "citroen",
  ),
  CarModel(
    id: "c3_aircross",
    name: "C3 Aircross",
    brand: "Citroen",
    brandId: "citroen",
  ),
  CarModel(id: "c5_x", name: "C5 X", brand: "Citroen", brandId: "citroen"),
  CarModel(id: "ami", name: "Ami", brand: "Citroen", brandId: "citroen"),
  CarModel(id: "other", name: "other", brand: "Citroen", brandId: "citroen"),
];

List<CarModel> fiatModels = [
  CarModel(id: "500", name: "500", brand: "Fiat", brandId: "fiat"),
  CarModel(id: "panda", name: "Panda", brand: "Fiat", brandId: "fiat"),
  CarModel(id: "tipo", name: "Tipo", brand: "Fiat", brandId: "fiat"),
  CarModel(id: "500x", name: "500X", brand: "Fiat", brandId: "fiat"),
  CarModel(id: "punto", name: "Punto", brand: "Fiat", brandId: "fiat"),
  CarModel(id: "linea", name: "Linea", brand: "Fiat", brandId: "fiat"),
  CarModel(id: "tempra", name: "Tempra", brand: "Fiat", brandId: "fiat"),
  CarModel(id: "doblo", name: "Doblo", brand: "Fiat", brandId: "fiat"),
  CarModel(id: "ducato", name: "Ducato", brand: "Fiat", brandId: "fiat"),
  CarModel(id: "other", name: "other", brand: "Fiat", brandId: "fiat"),
];

List<CarModel> ferrariModels = [
  CarModel(id: "roma", name: "Roma", brand: "Ferrari", brandId: "ferrari"),
  CarModel(
    id: "portofino",
    name: "Portofino",
    brand: "Ferrari",
    brandId: "ferrari",
  ),
  CarModel(
    id: "f8_tributo",
    name: "F8 Tributo",
    brand: "Ferrari",
    brandId: "ferrari",
  ),
  CarModel(
    id: "296_gtb",
    name: "296 GTB",
    brand: "Ferrari",
    brandId: "ferrari",
  ),
  CarModel(id: "sf90", name: "SF90", brand: "Ferrari", brandId: "ferrari"),
  CarModel(
    id: "purosangue",
    name: "Purosangue",
    brand: "Ferrari",
    brandId: "ferrari",
  ),
  CarModel(id: "other", name: "other", brand: "Ferrari", brandId: "ferrari"),
];

List<CarModel> porscheModels = [
  CarModel(id: "911", name: "911", brand: "Porsche", brandId: "porsche"),
  CarModel(
    id: "cayenne",
    name: "Cayenne",
    brand: "Porsche",
    brandId: "porsche",
  ),
  CarModel(id: "macan", name: "Macan", brand: "Porsche", brandId: "porsche"),
  CarModel(
    id: "panamera",
    name: "Panamera",
    brand: "Porsche",
    brandId: "porsche",
  ),
  CarModel(id: "taycan", name: "Taycan", brand: "Porsche", brandId: "porsche"),
  CarModel(id: "cayman", name: "Cayman", brand: "Porsche", brandId: "porsche"),
  CarModel(
    id: "boxster",
    name: "Boxster",
    brand: "Porsche",
    brandId: "porsche",
  ),
  CarModel(id: "other", name: "other", brand: "Porsche", brandId: "porsche"),
];

List<CarModel> jaguarModels = [
  CarModel(id: "xe", name: "XE", brand: "Jaguar", brandId: "jaguar"),
  CarModel(id: "xf", name: "XF", brand: "Jaguar", brandId: "jaguar"),
  CarModel(id: "f_pace", name: "F-Pace", brand: "Jaguar", brandId: "jaguar"),
  CarModel(id: "i_pace", name: "I-Pace", brand: "Jaguar", brandId: "jaguar"),
  CarModel(id: "f_type", name: "F-Type", brand: "Jaguar", brandId: "jaguar"),
  CarModel(id: "e_pace", name: "E-Pace", brand: "Jaguar", brandId: "jaguar"),
  CarModel(id: "other", name: "other", brand: "Jaguar", brandId: "jaguar"),
];

List<CarModel> landRoverModels = [
  CarModel(
    id: "defender",
    name: "Defender",
    brand: "Land Rover",
    brandId: "land-rover",
  ),
  CarModel(
    id: "discovery",
    name: "Discovery",
    brand: "Land Rover",
    brandId: "land-rover",
  ),
  CarModel(
    id: "discovery_sport",
    name: "Discovery Sport",
    brand: "Land Rover",
    brandId: "land-rover",
  ),
  CarModel(
    id: "range_rover",
    name: "Range Rover",
    brand: "Land Rover",
    brandId: "land-rover",
  ),
  CarModel(
    id: "range_rover_sport",
    name: "Range Rover Sport",
    brand: "Land Rover",
    brandId: "land-rover",
  ),
  CarModel(
    id: "range_rover_velar",
    name: "Range Rover Velar",
    brand: "Land Rover",
    brandId: "land-rover",
  ),
  CarModel(
    id: "range_rover_evoque",
    name: "Range Rover Evoque",
    brand: "Land Rover",
    brandId: "land-rover",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "Land Rover",
    brandId: "land-rover",
  ),
];

List<CarModel> miniModels = [
  CarModel(id: "hatch", name: "Hatch", brand: "Mini", brandId: "mini"),
  CarModel(id: "clubman", name: "Clubman", brand: "Mini", brandId: "mini"),
  CarModel(
    id: "countryman",
    name: "Countryman",
    brand: "Mini",
    brandId: "mini",
  ),
  CarModel(
    id: "convertible",
    name: "Convertible",
    brand: "Mini",
    brandId: "mini",
  ),
  CarModel(id: "other", name: "other", brand: "Mini", brandId: "mini"),
];

List<CarModel> skodaModels = [
  CarModel(id: "fabia", name: "Fabia", brand: "Skoda", brandId: "skoda"),
  CarModel(id: "octavia", name: "Octavia", brand: "Skoda", brandId: "skoda"),
  CarModel(id: "superb", name: "Superb", brand: "Skoda", brandId: "skoda"),
  CarModel(id: "kodiaq", name: "Kodiaq", brand: "Skoda", brandId: "skoda"),
  CarModel(id: "karoq", name: "Karoq", brand: "Skoda", brandId: "skoda"),
  CarModel(id: "enyaq", name: "Enyaq", brand: "Skoda", brandId: "skoda"),
  CarModel(id: "scala", name: "Scala", brand: "Skoda", brandId: "skoda"),
  CarModel(id: "other", name: "other", brand: "Skoda", brandId: "skoda"),
];

List<CarModel> seatModels = [
  CarModel(id: "ibiza", name: "Ibiza", brand: "Seat", brandId: "seat"),
  CarModel(id: "leon", name: "Leon", brand: "Seat", brandId: "seat"),
  CarModel(id: "toledo", name: "Toledo", brand: "Seat", brandId: "seat"),
  CarModel(id: "ateca", name: "Ateca", brand: "Seat", brandId: "seat"),
  CarModel(id: "tarraco", name: "Tarraco", brand: "Seat", brandId: "seat"),
  CarModel(id: "arona", name: "Arona", brand: "Seat", brandId: "seat"),
  CarModel(id: "other", name: "other", brand: "Seat", brandId: "seat"),
];

List<CarModel> fordModels = [
  CarModel(id: "focus", name: "Focus", brand: "Ford", brandId: "ford"),
  CarModel(id: "fusion", name: "Fusion", brand: "Ford", brandId: "ford"),
  CarModel(id: "mondeo", name: "Mondeo", brand: "Ford", brandId: "ford"),
  CarModel(id: "mustang", name: "Mustang", brand: "Ford", brandId: "ford"),
  CarModel(id: "explorer", name: "Explorer", brand: "Ford", brandId: "ford"),
  CarModel(id: "escape", name: "Escape", brand: "Ford", brandId: "ford"),
  CarModel(id: "edge", name: "Edge", brand: "Ford", brandId: "ford"),
  CarModel(id: "ranger", name: "Ranger", brand: "Ford", brandId: "ford"),
  CarModel(id: "f_150", name: "F-150", brand: "Ford", brandId: "ford"),
  CarModel(id: "bronco", name: "Bronco", brand: "Ford", brandId: "ford"),
  CarModel(id: "everest", name: "Everest", brand: "Ford", brandId: "ford"),
  CarModel(id: "other", name: "other", brand: "Ford", brandId: "ford"),
];

List<CarModel> chevroletModels = [
  CarModel(
    id: "spark",
    name: "Spark",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(id: "aveo", name: "Aveo", brand: "Chevrolet", brandId: "chevrolet"),
  CarModel(
    id: "optra",
    name: "Optra",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "cruze",
    name: "Cruze",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "malibu",
    name: "Malibu",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "camaro",
    name: "Camaro",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "corvette",
    name: "Corvette",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "captiva",
    name: "Captiva",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "equinox",
    name: "Equinox",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "tahoe",
    name: "Tahoe",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "silverado",
    name: "Silverado",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "traverse",
    name: "Traverse",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "blazer",
    name: "Blazer",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "suburban",
    name: "Suburban",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "Chevrolet",
    brandId: "chevrolet",
  ),
];

List<CarModel> gmcModels = [
  CarModel(id: "terrain", name: "Terrain", brand: "GMC", brandId: "gmc"),
  CarModel(id: "acadia", name: "Acadia", brand: "GMC", brandId: "gmc"),
  CarModel(id: "yukon", name: "Yukon", brand: "GMC", brandId: "gmc"),
  CarModel(id: "sierra", name: "Sierra", brand: "GMC", brandId: "gmc"),
  CarModel(id: "canyon", name: "Canyon", brand: "GMC", brandId: "gmc"),
  CarModel(id: "other", name: "other", brand: "GMC", brandId: "gmc"),
];

List<CarModel> dodgeModels = [
  CarModel(id: "charger", name: "Charger", brand: "Dodge", brandId: "dodge"),
  CarModel(
    id: "challenger",
    name: "Challenger",
    brand: "Dodge",
    brandId: "dodge",
  ),
  CarModel(id: "durango", name: "Durango", brand: "Dodge", brandId: "dodge"),
  CarModel(id: "journey", name: "Journey", brand: "Dodge", brandId: "dodge"),
  CarModel(id: "other", name: "other", brand: "Dodge", brandId: "dodge"),
];

List<CarModel> jeepModels = [
  CarModel(id: "compass", name: "Compass", brand: "Jeep", brandId: "jeep"),
  CarModel(id: "cherokee", name: "Cherokee", brand: "Jeep", brandId: "jeep"),
  CarModel(
    id: "grand_cherokee",
    name: "Grand Cherokee",
    brand: "Jeep",
    brandId: "jeep",
  ),
  CarModel(id: "wrangler", name: "Wrangler", brand: "Jeep", brandId: "jeep"),
  CarModel(id: "gladiator", name: "Gladiator", brand: "Jeep", brandId: "jeep"),
  CarModel(id: "renegade", name: "Renegade", brand: "Jeep", brandId: "jeep"),
  CarModel(id: "wagoneer", name: "Wagoneer", brand: "Jeep", brandId: "jeep"),
  CarModel(id: "other", name: "other", brand: "Jeep", brandId: "jeep"),
];

List<CarModel> chryslerModels = [
  CarModel(id: "300", name: "300", brand: "Chrysler", brandId: "chrysler"),
  CarModel(
    id: "pacifica",
    name: "Pacifica",
    brand: "Chrysler",
    brandId: "chrysler",
  ),
  CarModel(
    id: "voyager",
    name: "Voyager",
    brand: "Chrysler",
    brandId: "chrysler",
  ),
  CarModel(id: "other", name: "other", brand: "Chrysler", brandId: "chrysler"),
];

List<CarModel> cadillacModels = [
  CarModel(id: "ct4", name: "CT4", brand: "Cadillac", brandId: "cadillac"),
  CarModel(id: "ct5", name: "CT5", brand: "Cadillac", brandId: "cadillac"),
  CarModel(id: "xt4", name: "XT4", brand: "Cadillac", brandId: "cadillac"),
  CarModel(id: "xt5", name: "XT5", brand: "Cadillac", brandId: "cadillac"),
  CarModel(id: "xt6", name: "XT6", brand: "Cadillac", brandId: "cadillac"),
  CarModel(
    id: "escalade",
    name: "Escalade",
    brand: "Cadillac",
    brandId: "cadillac",
  ),
  CarModel(id: "lyriq", name: "Lyriq", brand: "Cadillac", brandId: "cadillac"),
  CarModel(id: "other", name: "other", brand: "Cadillac", brandId: "cadillac"),
];

List<CarModel> teslaModels = [
  CarModel(id: "model_3", name: "Model 3", brand: "Tesla", brandId: "tesla"),
  CarModel(id: "model_y", name: "Model Y", brand: "Tesla", brandId: "tesla"),
  CarModel(id: "model_s", name: "Model S", brand: "Tesla", brandId: "tesla"),
  CarModel(id: "model_x", name: "Model X", brand: "Tesla", brandId: "tesla"),
  CarModel(
    id: "cybertruck",
    name: "Cybertruck",
    brand: "Tesla",
    brandId: "tesla",
  ),
  CarModel(id: "other", name: "other", brand: "Tesla", brandId: "tesla"),
];

List<CarModel> lucidModels = [
  CarModel(id: "air", name: "Air", brand: "Lucid", brandId: "lucid"),
  CarModel(id: "gravity", name: "Gravity", brand: "Lucid", brandId: "lucid"),
  CarModel(id: "other", name: "other", brand: "Lucid", brandId: "lucid"),
];

List<CarModel> rivianModels = [
  CarModel(id: "r1t", name: "R1T", brand: "Rivian", brandId: "rivian"),
  CarModel(id: "r1s", name: "R1S", brand: "Rivian", brandId: "rivian"),
  CarModel(id: "r2", name: "R2", brand: "Rivian", brandId: "rivian"),
  CarModel(id: "other", name: "other", brand: "Rivian", brandId: "rivian"),
];

List<CarModel> astonMartinModels = [
  CarModel(
    id: "db11",
    name: "DB11",
    brand: "Aston Martin",
    brandId: "aston-martin",
  ),
  CarModel(
    id: "db9",
    name: "DB9",
    brand: "Aston Martin",
    brandId: "aston-martin",
  ),
  CarModel(
    id: "dbx",
    name: "DBX",
    brand: "Aston Martin",
    brandId: "aston-martin",
  ),
  CarModel(
    id: "vantage",
    name: "Vantage",
    brand: "Aston Martin",
    brandId: "aston-martin",
  ),
  CarModel(
    id: "rapide",
    name: "Rapide",
    brand: "Aston Martin",
    brandId: "aston-martin",
  ),
  CarModel(
    id: "valhalla",
    name: "Valhalla",
    brand: "Aston Martin",
    brandId: "aston-martin",
  ),
  CarModel(
    id: "db12",
    name: "DB12",
    brand: "Aston Martin",
    brandId: "aston-martin",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "Aston Martin",
    brandId: "aston-martin",
  ),
];

List<CarModel> bentleyModels = [
  CarModel(
    id: "continental_gt",
    name: "Continental GT",
    brand: "Bentley",
    brandId: "bentley",
  ),
  CarModel(
    id: "flying_spur",
    name: "Flying Spur",
    brand: "Bentley",
    brandId: "bentley",
  ),
  CarModel(
    id: "bentayga",
    name: "Bentayga",
    brand: "Bentley",
    brandId: "bentley",
  ),
  CarModel(id: "other", name: "other", brand: "Bentley", brandId: "bentley"),
];

List<CarModel> rollsRoyceModels = [
  CarModel(
    id: "ghost",
    name: "Ghost",
    brand: "Rolls Royce",
    brandId: "rolls-royce",
  ),
  CarModel(
    id: "phantom",
    name: "Phantom",
    brand: "Rolls Royce",
    brandId: "rolls-royce",
  ),
  CarModel(
    id: "cullinan",
    name: "Cullinan",
    brand: "Rolls Royce",
    brandId: "rolls-royce",
  ),
  CarModel(
    id: "spectre",
    name: "Spectre",
    brand: "Rolls Royce",
    brandId: "rolls-royce",
  ),
  CarModel(
    id: "dawn",
    name: "Dawn",
    brand: "Rolls Royce",
    brandId: "rolls-royce",
  ),
  CarModel(
    id: "wraith",
    name: "Wraith",
    brand: "Rolls Royce",
    brandId: "rolls-royce",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "Rolls Royce",
    brandId: "rolls-royce",
  ),
];

List<CarModel> mclarenModels = [
  CarModel(id: "gt", name: "GT", brand: "McLaren", brandId: "mclaren"),
  CarModel(id: "artura", name: "Artura", brand: "McLaren", brandId: "mclaren"),
  CarModel(id: "720s", name: "720S", brand: "McLaren", brandId: "mclaren"),
  CarModel(id: "750s", name: "750S", brand: "McLaren", brandId: "mclaren"),
  CarModel(id: "senna", name: "Senna", brand: "McLaren", brandId: "mclaren"),
  CarModel(id: "other", name: "other", brand: "McLaren", brandId: "mclaren"),
];

List<CarModel> bugattiModels = [
  CarModel(id: "chiron", name: "Chiron", brand: "Bugatti", brandId: "bugatti"),
  CarModel(id: "divo", name: "Divo", brand: "Bugatti", brandId: "bugatti"),
  CarModel(
    id: "mistral",
    name: "Mistral",
    brand: "Bugatti",
    brandId: "bugatti",
  ),
  CarModel(id: "bolide", name: "Bolide", brand: "Bugatti", brandId: "bugatti"),
  CarModel(id: "other", name: "other", brand: "Bugatti", brandId: "bugatti"),
];

List<CarModel> paganiModels = [
  CarModel(id: "zonda", name: "Zonda", brand: "Pagani", brandId: "pagani"),
  CarModel(id: "huayra", name: "Huayra", brand: "Pagani", brandId: "pagani"),
  CarModel(id: "utopia", name: "Utopia", brand: "Pagani", brandId: "pagani"),
  CarModel(id: "other", name: "other", brand: "Pagani", brandId: "pagani"),
];

List<CarModel> koenigseggModels = [
  CarModel(
    id: "jesko",
    name: "Jesko",
    brand: "Koenigsegg",
    brandId: "koenigsegg",
  ),
  CarModel(
    id: "gemera",
    name: "Gemera",
    brand: "Koenigsegg",
    brandId: "koenigsegg",
  ),
  CarModel(
    id: "regera",
    name: "Regera",
    brand: "Koenigsegg",
    brandId: "koenigsegg",
  ),
  CarModel(
    id: "agera",
    name: "Agera",
    brand: "Koenigsegg",
    brandId: "koenigsegg",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "Koenigsegg",
    brandId: "koenigsegg",
  ),
];

List<CarModel> vinfastModels = [
  CarModel(id: "vf3", name: "VF3", brand: "Vinfast", brandId: "vinfast"),
  CarModel(id: "vf5", name: "VF5", brand: "Vinfast", brandId: "vinfast"),
  CarModel(id: "vf7", name: "VF7", brand: "Vinfast", brandId: "vinfast"),
  CarModel(id: "vf8", name: "VF8", brand: "Vinfast", brandId: "vinfast"),
  CarModel(id: "vf9", name: "VF9", brand: "Vinfast", brandId: "vinfast"),
  CarModel(id: "other", name: "other", brand: "Vinfast", brandId: "vinfast"),
];

List<CarModel> bytonModels = [
  CarModel(id: "m_byte", name: "M-Byte", brand: "Byton", brandId: "byton"),
  CarModel(id: "k_byte", name: "K-Byte", brand: "Byton", brandId: "byton"),
  CarModel(id: "other", name: "other", brand: "Byton", brandId: "byton"),
];

List<CarModel> nioModels = [
  CarModel(id: "es6", name: "ES6", brand: "Nio", brandId: "nio"),
  CarModel(id: "es8", name: "ES8", brand: "Nio", brandId: "nio"),
  CarModel(id: "et5", name: "ET5", brand: "Nio", brandId: "nio"),
  CarModel(id: "et7", name: "ET7", brand: "Nio", brandId: "nio"),
  CarModel(id: "ec6", name: "EC6", brand: "Nio", brandId: "nio"),
  CarModel(id: "other", name: "other", brand: "Nio", brandId: "nio"),
];

List<CarModel> xpengModels = [
  CarModel(id: "g3", name: "G3", brand: "XPeng", brandId: "xpeng"),
  CarModel(id: "g9", name: "G9", brand: "XPeng", brandId: "xpeng"),
  CarModel(id: "p5", name: "P5", brand: "XPeng", brandId: "xpeng"),
  CarModel(id: "p7", name: "P7", brand: "XPeng", brandId: "xpeng"),
  CarModel(id: "g6", name: "G6", brand: "XPeng", brandId: "xpeng"),
  CarModel(id: "other", name: "other", brand: "XPeng", brandId: "xpeng"),
];

List<CarModel> zeekrModels = [
  CarModel(id: "001", name: "001", brand: "Zeekr", brandId: "zeekr"),
  CarModel(id: "007", name: "007", brand: "Zeekr", brandId: "zeekr"),
  CarModel(id: "009", name: "009", brand: "Zeekr", brandId: "zeekr"),
  CarModel(id: "x", name: "X", brand: "Zeekr", brandId: "zeekr"),
  CarModel(id: "other", name: "other", brand: "Zeekr", brandId: "zeekr"),
];

List<CarModel> lynkAndCoModels = [
  CarModel(id: "01", name: "01", brand: "Lynk & Co", brandId: "lynkAndCo"),
  CarModel(id: "03", name: "03", brand: "Lynk & Co", brandId: "lynkAndCo"),
  CarModel(id: "05", name: "05", brand: "Lynk & Co", brandId: "lynkAndCo"),
  CarModel(id: "09", name: "09", brand: "Lynk & Co", brandId: "lynkAndCo"),
  CarModel(
    id: "other",
    name: "other",
    brand: "Lynk & Co",
    brandId: "lynkAndCo",
  ),
];

List<CarModel> mgModels = [
  CarModel(id: "mg3", name: "MG3", brand: "MG", brandId: "mg"),
  CarModel(id: "mg5", name: "MG5", brand: "MG", brandId: "mg"),
  CarModel(id: "mg6", name: "MG6", brand: "MG", brandId: "mg"),
  CarModel(id: "zs", name: "ZS", brand: "MG", brandId: "mg"),
  CarModel(id: "hs", name: "HS", brand: "MG", brandId: "mg"),
  CarModel(id: "mg4", name: "MG4", brand: "MG", brandId: "mg"),
  CarModel(id: "mg7", name: "MG7", brand: "MG", brandId: "mg"),
  CarModel(id: "other", name: "other", brand: "MG", brandId: "mg"),
];

List<CarModel> smartModels = [
  CarModel(id: "fortwo", name: "Fortwo", brand: "Smart", brandId: "smart"),
  CarModel(id: "forfour", name: "Forfour", brand: "Smart", brandId: "smart"),
  CarModel(
    id: "hashtag_1",
    name: "Hashtag 1",
    brand: "Smart",
    brandId: "smart",
  ),
  CarModel(id: "other", name: "other", brand: "Smart", brandId: "smart"),
];

List<CarModel> cupraModels = [
  CarModel(id: "born", name: "Born", brand: "Cupra", brandId: "cupra"),
  CarModel(
    id: "formentor",
    name: "Formentor",
    brand: "Cupra",
    brandId: "cupra",
  ),
  CarModel(id: "leon", name: "Leon", brand: "Cupra", brandId: "cupra"),
  CarModel(id: "ateca", name: "Ateca", brand: "Cupra", brandId: "cupra"),
  CarModel(id: "terramar", name: "Terramar", brand: "Cupra", brandId: "cupra"),
  CarModel(id: "tavascan", name: "Tavascan", brand: "Cupra", brandId: "cupra"),
  CarModel(id: "other", name: "other", brand: "Cupra", brandId: "cupra"),
];

List<CarModel> dsAutomobilesModels = [
  CarModel(
    id: "ds3",
    name: "DS 3",
    brand: "DS Automobiles",
    brandId: "ds-automobiles",
  ),
  CarModel(
    id: "ds4",
    name: "DS 4",
    brand: "DS Automobiles",
    brandId: "ds-automobiles",
  ),
  CarModel(
    id: "ds5",
    name: "DS 5",
    brand: "DS Automobiles",
    brandId: "ds-automobiles",
  ),
  CarModel(
    id: "ds7",
    name: "DS 7",
    brand: "DS Automobiles",
    brandId: "ds-automobiles",
  ),
  CarModel(
    id: "ds9",
    name: "DS 9",
    brand: "DS Automobiles",
    brandId: "ds-automobiles",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "DS Automobiles",
    brandId: "ds-automobiles",
  ),
];

List<CarModel> avatrModels = [
  CarModel(id: "11", name: "11", brand: "Avatr", brandId: "avatr"),
  CarModel(id: "12", name: "12", brand: "Avatr", brandId: "avatr"),
  CarModel(id: "other", name: "other", brand: "Avatr", brandId: "avatr"),
];

List<CarModel> baicModels = [
  CarModel(id: "x35", name: "X35", brand: "BAIC", brandId: "baic"),
  CarModel(id: "x55", name: "X55", brand: "BAIC", brandId: "baic"),
  CarModel(id: "x7", name: "X7", brand: "BAIC", brandId: "baic"),
  CarModel(id: "u5_plus", name: "U5 Plus", brand: "BAIC", brandId: "baic"),
  CarModel(id: "other", name: "other", brand: "BAIC", brandId: "baic"),
];

List<CarModel> brillianceModels = [
  CarModel(id: "v5", name: "V5", brand: "Brilliance", brandId: "brilliance"),
  CarModel(id: "v6", name: "V6", brand: "Brilliance", brandId: "brilliance"),
  CarModel(id: "v7", name: "V7", brand: "Brilliance", brandId: "brilliance"),
  CarModel(id: "frv", name: "FRV", brand: "Brilliance", brandId: "brilliance"),
  CarModel(id: "fsv", name: "FSV", brand: "Brilliance", brandId: "brilliance"),
  CarModel(
    id: "other",
    name: "other",
    brand: "Brilliance",
    brandId: "brilliance",
  ),
];

List<CarModel> daewooModels = [
  CarModel(id: "lanos", name: "Lanos", brand: "Daewoo", brandId: "daewoo"),
  CarModel(id: "nubira", name: "Nubira", brand: "Daewoo", brandId: "daewoo"),
  CarModel(id: "leganza", name: "Leganza", brand: "Daewoo", brandId: "daewoo"),
  CarModel(id: "matiz", name: "Matiz", brand: "Daewoo", brandId: "daewoo"),
  CarModel(id: "other", name: "other", brand: "Daewoo", brandId: "daewoo"),
];

List<CarModel> deepalModels = [
  CarModel(id: "s7", name: "S7", brand: "Deepal", brandId: "deepal"),
  CarModel(id: "l07", name: "L07", brand: "Deepal", brandId: "deepal"),
  CarModel(id: "other", name: "other", brand: "Deepal", brandId: "deepal"),
];

List<CarModel> dfskModels = [
  CarModel(id: "glory_330", name: "Glory 330", brand: "DFSK", brandId: "dfsk"),
  CarModel(id: "glory_500", name: "Glory 500", brand: "DFSK", brandId: "dfsk"),
  CarModel(id: "glory_580", name: "Glory 580", brand: "DFSK", brandId: "dfsk"),
  CarModel(id: "other", name: "other", brand: "DFSK", brandId: "dfsk"),
];

List<CarModel> exeedModels = [
  CarModel(id: "txl", name: "TXL", brand: "Exeed", brandId: "exeed"),
  CarModel(id: "vx", name: "VX", brand: "Exeed", brandId: "exeed"),
  CarModel(id: "lx", name: "LX", brand: "Exeed", brandId: "exeed"),
  CarModel(id: "other", name: "other", brand: "Exeed", brandId: "exeed"),
];

List<CarModel> fawModels = [
  CarModel(
    id: "bestune_t55",
    name: "Bestune T55",
    brand: "FAW",
    brandId: "faw",
  ),
  CarModel(
    id: "bestune_t77",
    name: "Bestune T77",
    brand: "FAW",
    brandId: "faw",
  ),
  CarModel(
    id: "bestune_b70",
    name: "Bestune B70",
    brand: "FAW",
    brandId: "faw",
  ),
  CarModel(id: "other", name: "other", brand: "FAW", brandId: "faw"),
];

List<CarModel> jetourModels = [
  CarModel(id: "x70", name: "X70", brand: "Jetour", brandId: "jetour"),
  CarModel(
    id: "x70_plus",
    name: "X70 Plus",
    brand: "Jetour",
    brandId: "jetour",
  ),
  CarModel(id: "x90", name: "X90", brand: "Jetour", brandId: "jetour"),
  CarModel(id: "dashing", name: "Dashing", brand: "Jetour", brandId: "jetour"),
  CarModel(id: "other", name: "other", brand: "Jetour", brandId: "jetour"),
];

List<CarModel> kaiyiModels = [
  CarModel(id: "x3", name: "X3", brand: "Kaiyi", brandId: "kaiyi"),
  CarModel(id: "e5", name: "E5", brand: "Kaiyi", brandId: "kaiyi"),
  CarModel(id: "other", name: "other", brand: "Kaiyi", brandId: "kaiyi"),
];

List<CarModel> kgmModels = [
  CarModel(id: "tivoli", name: "Tivoli", brand: "KGM", brandId: "kgm"),
  CarModel(id: "korando", name: "Korando", brand: "KGM", brandId: "kgm"),
  CarModel(id: "rexton", name: "Rexton", brand: "KGM", brandId: "kgm"),
  CarModel(id: "musso", name: "Musso", brand: "KGM", brandId: "kgm"),
  CarModel(id: "torres", name: "Torres", brand: "KGM", brandId: "kgm"),
  CarModel(id: "other", name: "other", brand: "KGM", brandId: "kgm"),
];

List<CarModel> ladaModels = [
  CarModel(id: "granta", name: "Granta", brand: "Lada", brandId: "lada"),
  CarModel(id: "vesta", name: "Vesta", brand: "Lada", brandId: "lada"),
  CarModel(id: "largus", name: "Largus", brand: "Lada", brandId: "lada"),
  CarModel(id: "niva", name: "Niva", brand: "Lada", brandId: "lada"),
  CarModel(
    id: "niva_travel",
    name: "Niva Travel",
    brand: "Lada",
    brandId: "lada",
  ),
  CarModel(id: "other", name: "other", brand: "Lada", brandId: "lada"),
];

List<CarModel> roxModels = [
  CarModel(id: "rox_01", name: "Rox 01", brand: "Rox", brandId: "rox"),
  CarModel(id: "other", name: "other", brand: "Rox", brandId: "rox"),
];

List<CarModel> saipaModels = [
  CarModel(id: "pride", name: "Pride", brand: "Saipa", brandId: "saipa"),
  CarModel(id: "tiba", name: "Tiba", brand: "Saipa", brandId: "saipa"),
  CarModel(id: "saina", name: "Saina", brand: "Saipa", brandId: "saipa"),
  CarModel(id: "quick", name: "Quick", brand: "Saipa", brandId: "saipa"),
  CarModel(id: "other", name: "other", brand: "Saipa", brandId: "saipa"),
];

List<CarModel> senovaModels = [
  CarModel(id: "d20", name: "D20", brand: "Senova", brandId: "senova"),
  CarModel(id: "x25", name: "X25", brand: "Senova", brandId: "senova"),
  CarModel(id: "x35", name: "X35", brand: "Senova", brandId: "senova"),
  CarModel(id: "x55", name: "X55", brand: "Senova", brandId: "senova"),
  CarModel(id: "other", name: "other", brand: "Senova", brandId: "senova"),
];

List<CarModel> soueastModels = [
  CarModel(id: "dx3", name: "DX3", brand: "Soueast", brandId: "soueast"),
  CarModel(id: "dx7", name: "DX7", brand: "Soueast", brandId: "soueast"),
  CarModel(id: "dx8", name: "DX8", brand: "Soueast", brandId: "soueast"),
  CarModel(id: "other", name: "other", brand: "Soueast", brandId: "soueast"),
];

List<CarModel> xiaomiModels = [
  CarModel(id: "su7", name: "SU7", brand: "Xiaomi", brandId: "xiaomi"),
  CarModel(id: "other", name: "other", brand: "Xiaomi", brandId: "xiaomi"),
];

List<CarModel> zotyeModels = [
  CarModel(id: "t600", name: "T600", brand: "Zotye", brandId: "zotye"),
  CarModel(id: "t700", name: "T700", brand: "Zotye", brandId: "zotye"),
  CarModel(id: "z300", name: "Z300", brand: "Zotye", brandId: "zotye"),
  CarModel(id: "other", name: "other", brand: "Zotye", brandId: "zotye"),
];

List<CarModel> hummerModels = [
  CarModel(id: "h2", name: "H2", brand: "Hummer", brandId: "hummer"),
  CarModel(id: "h3", name: "H3", brand: "Hummer", brandId: "hummer"),
  CarModel(id: "ev", name: "EV", brand: "Hummer", brandId: "hummer"),
  CarModel(id: "other", name: "other", brand: "Hummer", brandId: "hummer"),
];

List<CarModel> dongfengModels = [
  CarModel(id: "shine", name: "Shine", brand: "Dongfeng", brandId: "dongfeng"),
  CarModel(id: "a30", name: "A30", brand: "Dongfeng", brandId: "dongfeng"),
  CarModel(
    id: "fengon_580",
    name: "Fengon 580",
    brand: "Dongfeng",
    brandId: "dongfeng",
  ),
  CarModel(id: "other", name: "other", brand: "Dongfeng", brandId: "dongfeng"),
];

List<CarModel> alfaRomeoModels = [
  CarModel(
    id: "giulia",
    name: "Giulia",
    brand: "Alfa Romeo",
    brandId: "alfa-romeo",
  ),
  CarModel(
    id: "stelvio",
    name: "Stelvio",
    brand: "Alfa Romeo",
    brandId: "alfa-romeo",
  ),
  CarModel(
    id: "tonale",
    name: "Tonale",
    brand: "Alfa Romeo",
    brandId: "alfa-romeo",
  ),
  CarModel(
    id: "giulietta",
    name: "Giulietta",
    brand: "Alfa Romeo",
    brandId: "alfa-romeo",
  ),
  CarModel(
    id: "mito",
    name: "MiTo",
    brand: "Alfa Romeo",
    brandId: "alfa-romeo",
  ),
  CarModel(id: "4c", name: "4C", brand: "Alfa Romeo", brandId: "alfa-romeo"),
  CarModel(id: "159", name: "159", brand: "Alfa Romeo", brandId: "alfa-romeo"),
  CarModel(id: "147", name: "147", brand: "Alfa Romeo", brandId: "alfa-romeo"),
  CarModel(
    id: "other",
    name: "other",
    brand: "Alfa Romeo",
    brandId: "alfa-romeo",
  ),
];

List<CarModel> abarthModels = [
  CarModel(id: "595", name: "595", brand: "Abarth", brandId: "abarth"),
  CarModel(id: "695", name: "695", brand: "Abarth", brandId: "abarth"),
  CarModel(
    id: "124_spider",
    name: "124 Spider",
    brand: "Abarth",
    brandId: "abarth",
  ),
  CarModel(id: "other", name: "other", brand: "Abarth", brandId: "abarth"),
];

List<CarModel> lanciaModels = [
  CarModel(id: "ypsilon", name: "Ypsilon", brand: "Lancia", brandId: "lancia"),
  CarModel(id: "delta", name: "Delta", brand: "Lancia", brandId: "lancia"),
  CarModel(id: "thema", name: "Thema", brand: "Lancia", brandId: "lancia"),
  CarModel(id: "other", name: "other", brand: "Lancia", brandId: "lancia"),
];

List<CarModel> lamborghiniModels = [
  CarModel(
    id: "huracan",
    name: "Huracan",
    brand: "Lamborghini",
    brandId: "lamborghini",
  ),
  CarModel(
    id: "aventador",
    name: "Aventador",
    brand: "Lamborghini",
    brandId: "lamborghini",
  ),
  CarModel(
    id: "urus",
    name: "Urus",
    brand: "Lamborghini",
    brandId: "lamborghini",
  ),
  CarModel(
    id: "revuelto",
    name: "Revuelto",
    brand: "Lamborghini",
    brandId: "lamborghini",
  ),
  CarModel(
    id: "gallardo",
    name: "Gallardo",
    brand: "Lamborghini",
    brandId: "lamborghini",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "Lamborghini",
    brandId: "lamborghini",
  ),
];

List<CarModel> maseratiModels = [
  CarModel(
    id: "ghibli",
    name: "Ghibli",
    brand: "Maserati",
    brandId: "maserati",
  ),
  CarModel(
    id: "quattroporte",
    name: "Quattroporte",
    brand: "Maserati",
    brandId: "maserati",
  ),
  CarModel(
    id: "levante",
    name: "Levante",
    brand: "Maserati",
    brandId: "maserati",
  ),
  CarModel(
    id: "grecale",
    name: "Grecale",
    brand: "Maserati",
    brandId: "maserati",
  ),
  CarModel(
    id: "granturismo",
    name: "GranTurismo",
    brand: "Maserati",
    brandId: "maserati",
  ),
  CarModel(id: "mc20", name: "MC20", brand: "Maserati", brandId: "maserati"),
  CarModel(id: "other", name: "other", brand: "Maserati", brandId: "maserati"),
];

List<CarModel> lotusModels = [
  CarModel(id: "elise", name: "Elise", brand: "Lotus", brandId: "lotus"),
  CarModel(id: "exige", name: "Exige", brand: "Lotus", brandId: "lotus"),
  CarModel(id: "evora", name: "Evora", brand: "Lotus", brandId: "lotus"),
  CarModel(id: "emira", name: "Emira", brand: "Lotus", brandId: "lotus"),
  CarModel(id: "eletre", name: "Eletre", brand: "Lotus", brandId: "lotus"),
  CarModel(id: "other", name: "other", brand: "Lotus", brandId: "lotus"),
];

List<CarModel> opelModels = [
  CarModel(id: "corsa", name: "Corsa", brand: "Opel", brandId: "opel"),
  CarModel(id: "astra", name: "Astra", brand: "Opel", brandId: "opel"),
  CarModel(id: "vectra", name: "Vectra", brand: "Opel", brandId: "opel"),
  CarModel(id: "insignia", name: "Insignia", brand: "Opel", brandId: "opel"),
  CarModel(id: "mokka", name: "Mokka", brand: "Opel", brandId: "opel"),
  CarModel(id: "crossland", name: "Crossland", brand: "Opel", brandId: "opel"),
  CarModel(id: "grandland", name: "Grandland", brand: "Opel", brandId: "opel"),
  CarModel(id: "zafira", name: "Zafira", brand: "Opel", brandId: "opel"),
  CarModel(id: "other", name: "other", brand: "Opel", brandId: "opel"),
];

List<CarModel> vauxhallModels = [
  CarModel(id: "corsa", name: "Corsa", brand: "Vauxhall", brandId: "vauxhall"),
  CarModel(id: "astra", name: "Astra", brand: "Vauxhall", brandId: "vauxhall"),
  CarModel(
    id: "insignia",
    name: "Insignia",
    brand: "Vauxhall",
    brandId: "vauxhall",
  ),
  CarModel(id: "mokka", name: "Mokka", brand: "Vauxhall", brandId: "vauxhall"),
  CarModel(
    id: "crossland",
    name: "Crossland",
    brand: "Vauxhall",
    brandId: "vauxhall",
  ),
  CarModel(
    id: "grandland",
    name: "Grandland",
    brand: "Vauxhall",
    brandId: "vauxhall",
  ),
  CarModel(
    id: "zafira",
    name: "Zafira",
    brand: "Vauxhall",
    brandId: "vauxhall",
  ),
  CarModel(id: "other", name: "other", brand: "Vauxhall", brandId: "vauxhall"),
];

List<CarModel> daciaModels = [
  CarModel(id: "sandero", name: "Sandero", brand: "Dacia", brandId: "dacia"),
  CarModel(id: "duster", name: "Duster", brand: "Dacia", brandId: "dacia"),
  CarModel(id: "logan", name: "Logan", brand: "Dacia", brandId: "dacia"),
  CarModel(id: "jogger", name: "Jogger", brand: "Dacia", brandId: "dacia"),
  CarModel(id: "spring", name: "Spring", brand: "Dacia", brandId: "dacia"),
  CarModel(id: "other", name: "other", brand: "Dacia", brandId: "dacia"),
];

List<CarModel> buickModels = [
  CarModel(id: "encore", name: "Encore", brand: "Buick", brandId: "buick"),
  CarModel(
    id: "encore_gx",
    name: "Encore GX",
    brand: "Buick",
    brandId: "buick",
  ),
  CarModel(id: "envision", name: "Envision", brand: "Buick", brandId: "buick"),
  CarModel(id: "enclave", name: "Enclave", brand: "Buick", brandId: "buick"),
  CarModel(id: "excelle", name: "Excelle", brand: "Buick", brandId: "buick"),
  CarModel(id: "regal", name: "Regal", brand: "Buick", brandId: "buick"),
  CarModel(id: "lacrosse", name: "LaCrosse", brand: "Buick", brandId: "buick"),
  CarModel(id: "other", name: "other", brand: "Buick", brandId: "buick"),
];

List<CarModel> lincolnModels = [
  CarModel(
    id: "corsair",
    name: "Corsair",
    brand: "Lincoln",
    brandId: "lincoln",
  ),
  CarModel(
    id: "nautilus",
    name: "Nautilus",
    brand: "Lincoln",
    brandId: "lincoln",
  ),
  CarModel(
    id: "aviator",
    name: "Aviator",
    brand: "Lincoln",
    brandId: "lincoln",
  ),
  CarModel(
    id: "navigator",
    name: "Navigator",
    brand: "Lincoln",
    brandId: "lincoln",
  ),
  CarModel(id: "mkz", name: "MKZ", brand: "Lincoln", brandId: "lincoln"),
  CarModel(
    id: "continental",
    name: "Continental",
    brand: "Lincoln",
    brandId: "lincoln",
  ),
  CarModel(id: "other", name: "other", brand: "Lincoln", brandId: "lincoln"),
];

List<CarModel> ramModels = [
  CarModel(id: "ram_1500", name: "1500", brand: "Ram", brandId: "ram"),
  CarModel(id: "ram_2500", name: "2500", brand: "Ram", brandId: "ram"),
  CarModel(id: "ram_3500", name: "3500", brand: "Ram", brandId: "ram"),
  CarModel(id: "promaster", name: "ProMaster", brand: "Ram", brandId: "ram"),
  CarModel(
    id: "promaster_city",
    name: "ProMaster City",
    brand: "Ram",
    brandId: "ram",
  ),
  CarModel(id: "other", name: "other", brand: "Ram", brandId: "ram"),
];

List<CarModel> daihatsuModels = [
  CarModel(
    id: "terios",
    name: "Terios",
    brand: "Daihatsu",
    brandId: "daihatsu",
  ),
  CarModel(id: "mira", name: "Mira", brand: "Daihatsu", brandId: "daihatsu"),
  CarModel(
    id: "sirion",
    name: "Sirion",
    brand: "Daihatsu",
    brandId: "daihatsu",
  ),
  CarModel(id: "ayla", name: "Ayla", brand: "Daihatsu", brandId: "daihatsu"),
  CarModel(id: "rocky", name: "Rocky", brand: "Daihatsu", brandId: "daihatsu"),
  CarModel(id: "other", name: "other", brand: "Daihatsu", brandId: "daihatsu"),
];

List<CarModel> ssangyongModels = [
  CarModel(
    id: "tivoli",
    name: "Tivoli",
    brand: "SsangYong",
    brandId: "ssangyong",
  ),
  CarModel(
    id: "korando",
    name: "Korando",
    brand: "SsangYong",
    brandId: "ssangyong",
  ),
  CarModel(
    id: "rexton",
    name: "Rexton",
    brand: "SsangYong",
    brandId: "ssangyong",
  ),
  CarModel(
    id: "musso",
    name: "Musso",
    brand: "SsangYong",
    brandId: "ssangyong",
  ),
  CarModel(
    id: "torres",
    name: "Torres",
    brand: "SsangYong",
    brandId: "ssangyong",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "SsangYong",
    brandId: "ssangyong",
  ),
];

List<CarModel> cheryModels = [
  CarModel(id: "tiggo", name: "Tiggo", brand: "Chery", brandId: "chery"),
  CarModel(id: "arrizo", name: "Arrizo", brand: "Chery", brandId: "chery"),
  CarModel(id: "envy", name: "Envy", brand: "Chery", brandId: "chery"),
  CarModel(id: "other", name: "other", brand: "Chery", brandId: "chery"),
];

List<CarModel> changanModels = [
  CarModel(id: "cs35", name: "CS35", brand: "Changan", brandId: "changan"),
  CarModel(id: "cs55", name: "CS55", brand: "Changan", brandId: "changan"),
  CarModel(id: "cs75", name: "CS75", brand: "Changan", brandId: "changan"),
  CarModel(id: "cs95", name: "CS95", brand: "Changan", brandId: "changan"),
  CarModel(id: "eado", name: "Eado", brand: "Changan", brandId: "changan"),
  CarModel(id: "uni_t", name: "UNI-T", brand: "Changan", brandId: "changan"),
  CarModel(id: "uni_k", name: "UNI-K", brand: "Changan", brandId: "changan"),
  CarModel(id: "other", name: "other", brand: "Changan", brandId: "changan"),
];

List<CarModel> gwmModels = [
  CarModel(id: "poer", name: "Poer", brand: "GWM", brandId: "gwm"),
  CarModel(id: "wingle", name: "Wingle", brand: "GWM", brandId: "gwm"),
  CarModel(id: "cannon", name: "Cannon", brand: "GWM", brandId: "gwm"),
  CarModel(id: "hover", name: "Hover", brand: "GWM", brandId: "gwm"),
  CarModel(id: "other", name: "other", brand: "GWM", brandId: "gwm"),
];

List<CarModel> havalModels = [
  CarModel(id: "h2", name: "H2", brand: "Haval", brandId: "haval"),
  CarModel(id: "h6", name: "H6", brand: "Haval", brandId: "haval"),
  CarModel(id: "h7", name: "H7", brand: "Haval", brandId: "haval"),
  CarModel(id: "h9", name: "H9", brand: "Haval", brandId: "haval"),
  CarModel(id: "jolion", name: "Jolion", brand: "Haval", brandId: "haval"),
  CarModel(id: "other", name: "other", brand: "Haval", brandId: "haval"),
];

List<CarModel> tankModels = [
  CarModel(id: "300", name: "300", brand: "Tank", brandId: "tank"),
  CarModel(id: "400", name: "400", brand: "Tank", brandId: "tank"),
  CarModel(id: "500", name: "500", brand: "Tank", brandId: "tank"),
  CarModel(id: "700", name: "700", brand: "Tank", brandId: "tank"),
  CarModel(id: "other", name: "other", brand: "Tank", brandId: "tank"),
];

List<CarModel> oraModels = [
  CarModel(id: "good_cat", name: "Good Cat", brand: "Ora", brandId: "ora"),
  CarModel(id: "funky_cat", name: "Funky Cat", brand: "Ora", brandId: "ora"),
  CarModel(id: "ballet_cat", name: "Ballet Cat", brand: "Ora", brandId: "ora"),
  CarModel(id: "other", name: "other", brand: "Ora", brandId: "ora"),
];

List<CarModel> jacModels = [
  CarModel(id: "j7", name: "J7", brand: "JAC", brandId: "jac"),
  CarModel(id: "s3", name: "S3", brand: "JAC", brandId: "jac"),
  CarModel(id: "s5", name: "S5", brand: "JAC", brandId: "jac"),
  CarModel(id: "js4", name: "JS4", brand: "JAC", brandId: "jac"),
  CarModel(id: "js6", name: "JS6", brand: "JAC", brandId: "jac"),
  CarModel(id: "t6", name: "T6", brand: "JAC", brandId: "jac"),
  CarModel(id: "other", name: "other", brand: "JAC", brandId: "jac"),
];

List<CarModel> gacModels = [
  CarModel(id: "gs3", name: "GS3", brand: "GAC", brandId: "gac"),
  CarModel(id: "gs4", name: "GS4", brand: "GAC", brandId: "gac"),
  CarModel(id: "gs8", name: "GS8", brand: "GAC", brandId: "gac"),
  CarModel(id: "m8", name: "M8", brand: "GAC", brandId: "gac"),
  CarModel(id: "emzoom", name: "Emzoom", brand: "GAC", brandId: "gac"),
  CarModel(id: "emkoo", name: "Emkoo", brand: "GAC", brandId: "gac"),
  CarModel(id: "other", name: "other", brand: "GAC", brandId: "gac"),
];

List<CarModel> maxusModels = [
  CarModel(id: "d90", name: "D90", brand: "Maxus", brandId: "maxus"),
  CarModel(id: "t60", name: "T60", brand: "Maxus", brandId: "maxus"),
  CarModel(id: "t90", name: "T90", brand: "Maxus", brandId: "maxus"),
  CarModel(id: "g50", name: "G50", brand: "Maxus", brandId: "maxus"),
  CarModel(id: "v90", name: "V90", brand: "Maxus", brandId: "maxus"),
  CarModel(id: "other", name: "other", brand: "Maxus", brandId: "maxus"),
];

List<CarModel> wulingModels = [
  CarModel(
    id: "hongguang",
    name: "Hongguang",
    brand: "Wuling",
    brandId: "wuling",
  ),
  CarModel(
    id: "hongguang_mini_ev",
    name: "Hongguang Mini EV",
    brand: "Wuling",
    brandId: "wuling",
  ),
  CarModel(id: "air_ev", name: "Air EV", brand: "Wuling", brandId: "wuling"),
  CarModel(id: "other", name: "other", brand: "Wuling", brandId: "wuling"),
];

List<CarModel> polestarModels = [
  CarModel(
    id: "polestar_1",
    name: "Polestar 1",
    brand: "Polestar",
    brandId: "polestar",
  ),
  CarModel(
    id: "polestar_2",
    name: "Polestar 2",
    brand: "Polestar",
    brandId: "polestar",
  ),
  CarModel(
    id: "polestar_3",
    name: "Polestar 3",
    brand: "Polestar",
    brandId: "polestar",
  ),
  CarModel(
    id: "polestar_4",
    name: "Polestar 4",
    brand: "Polestar",
    brandId: "polestar",
  ),
  CarModel(id: "other", name: "other", brand: "Polestar", brandId: "polestar"),
];

List<CarModel> audiModels = [
  CarModel(id: "a1", name: "A1", brand: "Audi", brandId: "audi"),
  CarModel(id: "a3", name: "A3", brand: "Audi", brandId: "audi"),
  CarModel(id: "a4", name: "A4", brand: "Audi", brandId: "audi"),
  CarModel(id: "a5", name: "A5", brand: "Audi", brandId: "audi"),
  CarModel(id: "a6", name: "A6", brand: "Audi", brandId: "audi"),
  CarModel(id: "a7", name: "A7", brand: "Audi", brandId: "audi"),
  CarModel(id: "a8", name: "A8", brand: "Audi", brandId: "audi"),
  CarModel(id: "q3", name: "Q3", brand: "Audi", brandId: "audi"),
  CarModel(id: "q5", name: "Q5", brand: "Audi", brandId: "audi"),
  CarModel(id: "q7", name: "Q7", brand: "Audi", brandId: "audi"),
  CarModel(id: "q8", name: "Q8", brand: "Audi", brandId: "audi"),
  CarModel(id: "tt", name: "TT", brand: "Audi", brandId: "audi"),
  CarModel(id: "r8", name: "R8", brand: "Audi", brandId: "audi"),
  CarModel(id: "etron", name: "e-tron", brand: "Audi", brandId: "audi"),
  CarModel(id: "other", name: "other", brand: "Audi", brandId: "audi"),
];

List<CarModel> mercedesModels = [
  CarModel(
    id: "a_150",
    name: "A 150",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_160",
    name: "A 160",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_170",
    name: "A 170",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_180",
    name: "A 180",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_200",
    name: "A 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_220",
    name: "A 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_250",
    name: "A 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_250e",
    name: "A 250e",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_35",
    name: "A 35",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_35_amg",
    name: "A 35 AMG",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_45",
    name: "A 45",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "a_45_amg",
    name: "A 45 AMG",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "b_150",
    name: "B 150",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "b_160",
    name: "B 160",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "b_170",
    name: "B 170",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "b_180",
    name: "B 180",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "b_200",
    name: "B 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "b_220",
    name: "B 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "b_250",
    name: "B 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "b_260",
    name: "B 260",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "c_160",
    name: "C 160",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_180",
    name: "C 180",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_200",
    name: "C 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_220",
    name: "C 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_230",
    name: "C 230",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_240",
    name: "C 240",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_250",
    name: "C 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_300",
    name: "C 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_320",
    name: "C 320",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_350",
    name: "C 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_400",
    name: "C 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_43",
    name: "C 43",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "c_63",
    name: "C 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "e_180",
    name: "E 180",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_200",
    name: "E 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_220",
    name: "E 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_240",
    name: "E 240",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_250",
    name: "E 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_260",
    name: "E 260",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_280",
    name: "E 280",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_300",
    name: "E 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_320",
    name: "E 320",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_350",
    name: "E 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_400",
    name: "E 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_420",
    name: "E 420",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_43",
    name: "E 43",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_53",
    name: "E 53",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "e_63",
    name: "E 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "s_280",
    name: "S 280",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_300",
    name: "S 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_320",
    name: "S 320",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_350",
    name: "S 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_400",
    name: "S 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_420",
    name: "S 420",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_430",
    name: "S 430",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_450",
    name: "S 450",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_500",
    name: "S 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_550",
    name: "S 550",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_560",
    name: "S 560",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_600",
    name: "S 600",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_63",
    name: "S 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "s_65",
    name: "S 65",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "cla_180",
    name: "CLA 180",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cla_200",
    name: "CLA 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cla_220",
    name: "CLA 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cla_250",
    name: "CLA 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cla_35",
    name: "CLA 35",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cla_45",
    name: "CLA 45",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "cls_250",
    name: "CLS 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cls_300",
    name: "CLS 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cls_350",
    name: "CLS 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cls_400",
    name: "CLS 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cls_450",
    name: "CLS 450",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cls_53",
    name: "CLS 53",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "cls_63",
    name: "CLS 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "gla_180",
    name: "GLA 180",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gla_200",
    name: "GLA 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gla_220",
    name: "GLA 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gla_250",
    name: "GLA 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gla_35",
    name: "GLA 35",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gla_45",
    name: "GLA 45",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "glb_180",
    name: "GLB 180",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glb_200",
    name: "GLB 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glb_220",
    name: "GLB 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glb_250",
    name: "GLB 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glb_35",
    name: "GLB 35",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "glc_200",
    name: "GLC 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glc_220",
    name: "GLC 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glc_250",
    name: "GLC 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glc_300",
    name: "GLC 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glc_350",
    name: "GLC 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glc_400",
    name: "GLC 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glc_43",
    name: "GLC 43",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glc_63",
    name: "GLC 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "gle_250",
    name: "GLE 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gle_300",
    name: "GLE 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gle_350",
    name: "GLE 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gle_400",
    name: "GLE 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gle_450",
    name: "GLE 450",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gle_53",
    name: "GLE 53",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gle_63",
    name: "GLE 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "gls_350",
    name: "GLS 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gls_400",
    name: "GLS 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gls_450",
    name: "GLS 450",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gls_500",
    name: "GLS 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gls_580",
    name: "GLS 580",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gls_63",
    name: "GLS 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "g_350",
    name: "G 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "g_400",
    name: "G 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "g_500",
    name: "G 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "g_550",
    name: "G 550",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "g_63",
    name: "G 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "sl_280",
    name: "SL 280",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "sl_300",
    name: "SL 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "sl_320",
    name: "SL 320",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "sl_350",
    name: "SL 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "sl_500",
    name: "SL 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "sl_55",
    name: "SL 55",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "sl_63",
    name: "SL 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "sl_65",
    name: "SL 65",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "slc_180",
    name: "SLC 180",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slc_200",
    name: "SLC 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slc_250",
    name: "SLC 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slc_300",
    name: "SLC 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slc_43",
    name: "SLC 43",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "slk_200",
    name: "SLK 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slk_230",
    name: "SLK 230",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slk_250",
    name: "SLK 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slk_280",
    name: "SLK 280",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slk_300",
    name: "SLK 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slk_320",
    name: "SLK 320",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slk_350",
    name: "SLK 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "slk_55",
    name: "SLK 55",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "glk_200",
    name: "GLK 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glk_220",
    name: "GLK 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glk_250",
    name: "GLK 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glk_280",
    name: "GLK 280",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glk_300",
    name: "GLK 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "glk_350",
    name: "GLK 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "ml_250",
    name: "ML 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_270",
    name: "ML 270",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_280",
    name: "ML 280",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_300",
    name: "ML 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_320",
    name: "ML 320",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_350",
    name: "ML 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_400",
    name: "ML 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_430",
    name: "ML 430",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_500",
    name: "ML 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_550",
    name: "ML 550",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "ml_63",
    name: "ML 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "gl_320",
    name: "GL 320",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gl_350",
    name: "GL 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gl_400",
    name: "GL 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gl_450",
    name: "GL 450",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gl_500",
    name: "GL 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gl_550",
    name: "GL 550",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "gl_63",
    name: "GL 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "r_280",
    name: "R 280",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "r_300",
    name: "R 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "r_320",
    name: "R 320",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "r_350",
    name: "R 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "r_500",
    name: "R 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "r_63",
    name: "R 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "v_200",
    name: "V 200",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "v_220",
    name: "V 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "v_250",
    name: "V 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "v_300",
    name: "V 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "v_350",
    name: "V 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "x_220",
    name: "X 220",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "x_250",
    name: "X 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "x_350",
    name: "X 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "amg_gt",
    name: "AMG GT",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "amg_gt_43",
    name: "AMG GT 43",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "amg_gt_53",
    name: "AMG GT 53",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "amg_gt_63",
    name: "AMG GT 63",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "amg_gt_63_s",
    name: "AMG GT 63 S",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),

  CarModel(
    id: "eqa_250",
    name: "EQA 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqa_300",
    name: "EQA 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqa_350",
    name: "EQA 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqb_250",
    name: "EQB 250",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqb_300",
    name: "EQB 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqb_350",
    name: "EQB 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqc_400",
    name: "EQC 400",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqe_300",
    name: "EQE 300",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqe_350",
    name: "EQE 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqe_500",
    name: "EQE 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqe_53",
    name: "EQE 53",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqe_suv_350",
    name: "EQE SUV 350",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqe_suv_500",
    name: "EQE SUV 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqe_suv_53",
    name: "EQE SUV 53",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqs_450",
    name: "EQS 450",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqs_500",
    name: "EQS 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqs_580",
    name: "EQS 580",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqs_53",
    name: "EQS 53",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqs_suv_450",
    name: "EQS SUV 450",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqs_suv_500",
    name: "EQS SUV 500",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqs_suv_580",
    name: "EQS SUV 580",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqs_suv_53",
    name: "EQS SUV 53",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "eqv",
    name: "EQV",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
  CarModel(
    id: "other",
    name: "other",
    brand: "Mercedes-Benz",
    brandId: "mercedes-benz",
  ),
];
