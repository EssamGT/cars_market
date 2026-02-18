class CarModel {
  final String id;
  final String name;
  
  const CarModel({required this.id, required this.name});
  toJson() {
    return {'id': id, 'name': name};
  }

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(id: json['id'] ?? '', name: json['name'] ?? '');
  }
}

final Map<String, List<String>> carModels = {
  // 🇯🇵 Asia & Japan
  "Toyota": [
    "Corolla",
    "Camry",
    "Yaris",
    "RAV4",
    "Hilux",
    "Land Cruiser",
    "Prius",
    "Fortuner",
    "C-HR",
    "other",
  ],
  "Honda": [
    "Civic",
    "Accord",
    "City",
    "CR-V",
    "HR-V",
    "Jazz",
    "Pilot",
    "Odyssey",
    "Fit",
    "other",
  ],
  "Nissan": [
    "Altima",
    "Sentra",
    "Versa",
    "Maxima",
    "370Z",
    "GT-R",
    "Murano",
    "Pathfinder",
    "X-Trail",
    "other",
  ],
  "Mazda": [
    "Mazda2",
    "Mazda3",
    "Mazda6",
    "CX-3",
    "CX-5",
    "CX-9",
    "MX-5 Miata",
    "other",
  ],
  "Mitsubishi": [
    "Lancer",
    "Attrage",
    "Mirage",
    "Outlander",
    "Eclipse Cross",
    "Pajero",
    "Triton",
    "other",
  ],
  "Subaru": [
    "Impreza",
    "Legacy",
    "Outback",
    "Forester",
    "XV Crosstrek",
    "WRX",
    "BRZ",
    "other",
  ],
  "Suzuki": [
    "Swift",
    "Celerio",
    "Baleno",
    "Alto",
    "Vitara",
    "Ertiga",
    "Jimny",
    "other",
  ],
  "Hyundai": [
    "Elantra",
    "Sonata",
    "Accent",
    "Tucson",
    "Santa Fe",
    "Kona",
    "Creta",
    "Palisade",
    "Venue",
    "other",
  ],
  "Kia": [
    "Rio",
    "Cerato",
    "Optima",
    "Sportage",
    "Sorento",
    "Seltos",
    "Telluride",
    "Picanto",
    "other",
  ],
  "Lexus": ["IS", "ES", "GS", "LS", "RX", "NX", "GX", "LX", "UX", "other"],
  "Infiniti": ["Q50", "Q60", "Q70", "QX30", "QX50", "QX60", "QX80", "other"],
  "Acura": ["ILX", "TLX", "RLX", "RDX", "MDX", "NSX", "other"],
  "Genesis": ["G70", "G80", "G90", "GV60", "GV70", "GV80", "other"],
  "Isuzu": ["D-Max", "MU-X", "Trooper", "Axiom", "other"],
  "Proton": ["Saga", "Persona", "Iriz", "X50", "X70", "other"],
  "Perodua": ["Myvi", "Axia", "Bezza", "Ativa", "Alza", "other"],
  "Tata": ["Nexon", "Safari", "Harrier", "Altroz", "Tiago", "Punch", "other"],
  "Mahindra": ["Scorpio", "XUV300", "XUV500", "Thar", "Bolero", "other"],
  "BYD": ["Atto 3", "Han", "Tang", "Seal", "Dolphin", "Song Plus", "other"],
  "Geely": ["Coolray", "Azkarra", "Okavango", "Emgrand", "Monjaro", "other"],
  "BMW": [
    "116i",
    "118i",
    "120i",
    "125i",
    "128i",
    "130i",
    "135i",
    "140i",

    "216i",
    "218i",
    "220i",
    "225i",
    "228i",
    "230i",
    "235i",
    "240i",
    "M2",
    "316i",
    "318i",
    "320i",
    "325i",
    "328i",
    "330i",
    "335i",
    "340i",
    "M3",

    "418i",
    "420i",
    "425i",
    "428i",
    "430i",
    "435i",
    "440i",
    "M4",

    "520i",
    "525i",
    "528i",
    "530i",
    "535i",
    "540i",
    "545i",
    "550i",
    "555i",
    "M5",

    "640i",
    "650i",
    "M6",

    "730i",
    "740i",
    "745i",
    "750i",
    "760i",
    "M 760i",

    "X1",
    "X2",
    "X3",
    "X5",
    "X6",
    "X7",

    "Z4",
    "i3",
    "i4",
    "iX",
    "other",
  ],
  "Mercedes-Benz": [
    "190",
    "200",
    "230",
    "A 150",
    "A 180",
    "A 200",
    "A 250",
    "A 250e",
    "A 35",
    "A 35 AMG",
    "A 45",
    "AMG GT",
    "B150",
    "B160",
    "B-Class",
    "C-Class",
    "E-Class",
    "S-Class",
    "GLA",
    "GLC",
    "GLE",
    "GLS",
    "EQC",
    "EQS",
    "other",
  ],
  "Audi": [
    "A1",
    "A3",
    "A4",
    "A5",
    "A6",
    "A7",
    "A8",
    "Q3",
    "Q5",
    "Q7",
    "Q8",
    "TT",
    "R8",
    "e-tron",
    "other",
  ],
  "Volkswagen": [
    "Polo",
    "Golf",
    "Passat",
    "Jetta",
    "Arteon",
    "Tiguan",
    "Touareg",
    "ID.3",
    "ID.4",
    "other",
  ],
  "Volvo": ["XC40", "XC60", "XC90", "S60", "S90", "V60", "EX30", "other"],
  "Renault": [
    "Clio",
    "Megane",
    "Captur",
    "Kadjar",
    "Talisman",
    "Koleos",
    "Arkana",
    "other",
  ],
  "Peugeot": ["208", "2008", "308", "3008", "408", "5008", "508", "other"],
  "Citroen": ["C3", "C4", "C5 Aircross", "Berlingo", "C3 Aircross", "other"],
  "Fiat": ["500", "Panda", "Tipo", "500X", "Punto", "Doblo", "other"],
  "Ferrari": ["Roma", "Portofino", "F8 Tributo", "296 GTB", "SF90", "other"],
  "Porsche": ["911", "Cayenne", "Macan", "Panamera", "Taycan", "other"],
  "Jaguar": ["XE", "XF", "F-Pace", "I-Pace", "F-Type", "other"],
  "Land Rover": [
    "Defender",
    "Discovery",
    "Range Rover",
    "Range Rover Sport",
    "Velar",
    "other",
  ],
  "Mini": ["Hatch", "Clubman", "Countryman", "other"],
  "Skoda": ["Fabia", "Octavia", "Superb", "Kodiaq", "Enyaq", "other"],
  "Seat": ["Ibiza", "Leon", "Ateca", "Tarraco", "other"],
  "Ford": [
    "Focus",
    "Fusion",
    "Mustang",
    "Explorer",
    "Ranger",
    "F-150",
    "other",
  ],
  "Chevrolet": [
    "Spark",
    "Malibu",
    "Camaro",
    "Corvette",
    "Equinox",
    "Tahoe",
    "Silverado",
    "other",
  ],
  "GMC": ["Terrain", "Acadia", "Yukon", "Sierra", "other"],
  "Dodge": ["Charger", "Challenger", "Durango", "other"],
  "Jeep": ["Compass", "Cherokee", "Wrangler", "Gladiator", "other"],
  "Chrysler": ["300", "Pacifica", "Voyager", "other"],
  "Cadillac": ["CT4", "CT5", "XT5", "Escalade", "other"],
  "Tesla": ["Model 3", "Model Y", "Model S", "Model X", "Cybertruck", "other"],
  "Lucid": ["Air", "Gravity", "other"],
  "Rivian": ["R1T", "R1S", "other"],
  "Aston Martin": ["DB11", "DBX", "Vantage", "Valhalla", "other"],
  "Bentley": ["Continental GT", "Flying Spur", "Bentayga", "other"],
  "Rolls-Royce": ["Ghost", "Phantom", "Cullinan", "Spectre", "other"],
  "McLaren": ["GT", "Artura", "720S", "750S", "Senna", "other"],
  "Bugatti": ["Chiron", "Divo", "Mistral", "other"],
  "Pagani": ["Zonda", "Huayra", "Utopia", "other"],
  "Koenigsegg": ["Jesko", "Gemera", "Regera", "other"],
  "VinFast": ["VF3", "VF5", "VF7", "VF8", "VF9", "other"],
  "BYTON": ["M-Byte", "K-Byte", "other"],
  "NIO": ["ES6", "ES8", "ET5", "ET7", "other"],
  "XPeng": ["G3", "G9", "P5", "P7", "other"],
  "Zeekr": ["001", "007", "009", "X", "other"],
  "Lynk & Co": ["01", "03", "05", "09", "other"],
  "MG": ["MG3", "MG5", "MG6", "ZS", "HS", "other"],
  "Smart": ["Fortwo", "Forfour", "Hashtag 1", "other"],
  "Cupra": ["Born", "Formentor", "Leon", "other"],
  "DS Automobiles": ["DS 3", "DS 4", "DS 7", "DS 9", "other"],
};

List<CarModel> toyotaModels = [
  CarModel(id: "corolla", name: "Corolla"),
  CarModel(id: "corolla_cross", name: "Corolla Cross"),
  CarModel(id: "camry", name: "Camry"),
  CarModel(id: "yaris", name: "Yaris"),
  CarModel(id: "rav4", name: "RAV4"),
  CarModel(id: "highlander", name: "Highlander"),
  CarModel(id: "fortuner", name: "Fortuner"),
  CarModel(id: "hilux", name: "Hilux"),
  CarModel(id: "land_cruiser", name: "Land Cruiser"),
  CarModel(id: "prius", name: "Prius"),
  CarModel(id: "c_hr", name: "C-HR"),
  CarModel(id: "supra", name: "Supra"),
  CarModel(id: "tacoma", name: "Tacoma"),
  CarModel(id: "tundra", name: "Tundra"),
  CarModel(id: "avalon", name: "Avalon"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> hondaModels = [
  CarModel(id: "civic", name: "Civic"),
  CarModel(id: "accord", name: "Accord"),
  CarModel(id: "city", name: "City"),
  CarModel(id: "cr_v", name: "CR-V"),
  CarModel(id: "hr_v", name: "HR-V"),
  CarModel(id: "br_v", name: "BR-V"),
  CarModel(id: "pilot", name: "Pilot"),
  CarModel(id: "odyssey", name: "Odyssey"),
  CarModel(id: "fit", name: "Fit"),
  CarModel(id: "jazz", name: "Jazz"),
  CarModel(id: "ridgeline", name: "Ridgeline"),
  CarModel(id: "passport", name: "Passport"),
  CarModel(id: "insight", name: "Insight"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> nissanModels = [
  CarModel(id: "altima", name: "Altima"),
  CarModel(id: "sentra", name: "Sentra"),
  CarModel(id: "sunny", name: "Sunny"),
  CarModel(id: "maxima", name: "Maxima"),
  CarModel(id: "leaf", name: "Leaf"),
  CarModel(id: "murano", name: "Murano"),
  CarModel(id: "rogue", name: "Rogue"),
  CarModel(id: "x_trail", name: "X-Trail"),
  CarModel(id: "qashqai", name: "Qashqai"),
  CarModel(id: "juke", name: "Juke"),
  CarModel(id: "kicks", name: "Kicks"),
  CarModel(id: "navara", name: "Navara"),
  CarModel(id: "frontier", name: "Frontier"),
  CarModel(id: "370z", name: "370Z"),
  CarModel(id: "z", name: "Z"),
  CarModel(id: "gt_r", name: "GT-R"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> mazdaModels = [
  CarModel(id: "mazda2", name: "Mazda2"),
  CarModel(id: "mazda3", name: "Mazda3"),
  CarModel(id: "mazda6", name: "Mazda6"),
  CarModel(id: "cx_3", name: "CX-3"),
  CarModel(id: "cx_30", name: "CX-30"),
  CarModel(id: "cx_5", name: "CX-5"),
  CarModel(id: "cx_50", name: "CX-50"),
  CarModel(id: "cx_9", name: "CX-9"),
  CarModel(id: "cx_90", name: "CX-90"),
  CarModel(id: "mx_5", name: "MX-5 Miata"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> mitsubishiModels = [
  CarModel(id: "lancer", name: "Lancer"),
  CarModel(id: "mirage", name: "Mirage"),
  CarModel(id: "attrage", name: "Attrage"),
  CarModel(id: "outlander", name: "Outlander"),
  CarModel(id: "outlander_sport", name: "Outlander Sport"),
  CarModel(id: "eclipse_cross", name: "Eclipse Cross"),
  CarModel(id: "xpander", name: "Xpander"),
  CarModel(id: "pajero", name: "Pajero"),
  CarModel(id: "triton", name: "Triton"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> subaruModels = [
  CarModel(id: "impreza", name: "Impreza"),
  CarModel(id: "legacy", name: "Legacy"),
  CarModel(id: "outback", name: "Outback"),
  CarModel(id: "forester", name: "Forester"),
  CarModel(id: "crosstrek", name: "Crosstrek"),
  CarModel(id: "wrx", name: "WRX"),
  CarModel(id: "brz", name: "BRZ"),
  CarModel(id: "ascent", name: "Ascent"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> suzukiModels = [
  CarModel(id: "swift", name: "Swift"),
  CarModel(id: "dzire", name: "Dzire"),
  CarModel(id: "ciaz", name: "Ciaz"),
  CarModel(id: "celerio", name: "Celerio"),
  CarModel(id: "baleno", name: "Baleno"),
  CarModel(id: "alto", name: "Alto"),
  CarModel(id: "vitara", name: "Vitara"),
  CarModel(id: "s_cross", name: "S-Cross"),
  CarModel(id: "ertiga", name: "Ertiga"),
  CarModel(id: "jimny", name: "Jimny"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> hyundaiModels = [
  CarModel(id: "grand_i10", name: "Grand i10"),
  CarModel(id: "getz", name: "Getz"),
  CarModel(id: "accent", name: "Accent"),
  CarModel(id: "verna", name: "Verna"),
  CarModel(id: "elantra", name: "Elantra"),
  CarModel(id: "sonata", name: "Sonata"),
  CarModel(id: "tucson", name: "Tucson"),
  CarModel(id: "santa_fe", name: "Santa Fe"),
  CarModel(id: "palisade", name: "Palisade"),
  CarModel(id: "kona", name: "Kona"),
  CarModel(id: "creta", name: "Creta"),
  CarModel(id: "venue", name: "Venue"),
  CarModel(id: "ioniq", name: "Ioniq"),
  CarModel(id: "ioniq_5", name: "Ioniq 5"),
  CarModel(id: "ioniq_6", name: "Ioniq 6"),
  CarModel(id: "staria", name: "Staria"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> kiaModels = [
  CarModel(id: "picanto", name: "Picanto"),
  CarModel(id: "rio", name: "Rio"),
  CarModel(id: "cerato", name: "Cerato"),
  CarModel(id: "k3", name: "K3"),
  CarModel(id: "optima", name: "Optima"),
  CarModel(id: "k5", name: "K5"),
  CarModel(id: "k6", name: "K6"),
  CarModel(id: "carens", name: "Carens"),
  CarModel(id: "soul", name: "Soul"),
  CarModel(id: "sportage", name: "Sportage"),
  CarModel(id: "sorento", name: "Sorento"),
  CarModel(id: "seltos", name: "Seltos"),
  CarModel(id: "telluride", name: "Telluride"),
  CarModel(id: "carnival", name: "Carnival"),
  CarModel(id: "ev6", name: "EV6"),
  CarModel(id: "ev9", name: "EV9"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> lexusModels = [
  CarModel(id: "is", name: "IS"),
  CarModel(id: "es", name: "ES"),
  CarModel(id: "gs", name: "GS"),
  CarModel(id: "ls", name: "LS"),
  CarModel(id: "rx", name: "RX"),
  CarModel(id: "nx", name: "NX"),
  CarModel(id: "gx", name: "GX"),
  CarModel(id: "lx", name: "LX"),
  CarModel(id: "ux", name: "UX"),
  CarModel(id: "rc", name: "RC"),
  CarModel(id: "lc", name: "LC"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> infinitiModels = [
  CarModel(id: "q50", name: "Q50"),
  CarModel(id: "q60", name: "Q60"),
  CarModel(id: "q70", name: "Q70"),
  CarModel(id: "qx30", name: "QX30"),
  CarModel(id: "qx50", name: "QX50"),
  CarModel(id: "qx60", name: "QX60"),
  CarModel(id: "qx80", name: "QX80"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> acuraModels = [
  CarModel(id: "ilx", name: "ILX"),
  CarModel(id: "tlx", name: "TLX"),
  CarModel(id: "rlx", name: "RLX"),
  CarModel(id: "rdx", name: "RDX"),
  CarModel(id: "mdx", name: "MDX"),
  CarModel(id: "nsx", name: "NSX"),
  CarModel(id: "integra", name: "Integra"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> genesisModels = [
  CarModel(id: "g70", name: "G70"),
  CarModel(id: "g80", name: "G80"),
  CarModel(id: "g90", name: "G90"),
  CarModel(id: "gv60", name: "GV60"),
  CarModel(id: "gv70", name: "GV70"),
  CarModel(id: "gv80", name: "GV80"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> isuzuModels = [
  CarModel(id: "d_max", name: "D-Max"),
  CarModel(id: "mu_x", name: "MU-X"),
  CarModel(id: "trooper", name: "Trooper"),
  CarModel(id: "axiom", name: "Axiom"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> protonModels = [
  CarModel(id: "saga", name: "Saga"),
  CarModel(id: "persona", name: "Persona"),
  CarModel(id: "iriz", name: "Iriz"),
  CarModel(id: "x50", name: "X50"),
  CarModel(id: "x70", name: "X70"),
  CarModel(id: "x90", name: "X90"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> peroduaModels = [
  CarModel(id: "myvi", name: "Myvi"),
  CarModel(id: "axia", name: "Axia"),
  CarModel(id: "bezza", name: "Bezza"),
  CarModel(id: "ativa", name: "Ativa"),
  CarModel(id: "alza", name: "Alza"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> tataModels = [
  CarModel(id: "nexon", name: "Nexon"),
  CarModel(id: "safari", name: "Safari"),
  CarModel(id: "harrier", name: "Harrier"),
  CarModel(id: "altroz", name: "Altroz"),
  CarModel(id: "tiago", name: "Tiago"),
  CarModel(id: "punch", name: "Punch"),
  CarModel(id: "tigor", name: "Tigor"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> mahindraModels = [
  CarModel(id: "scorpio", name: "Scorpio"),
  CarModel(id: "xuv300", name: "XUV300"),
  CarModel(id: "xuv500", name: "XUV500"),
  CarModel(id: "xuv700", name: "XUV700"),
  CarModel(id: "thar", name: "Thar"),
  CarModel(id: "bolero", name: "Bolero"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> bydModels = [
  CarModel(id: "f3", name: "F3"),
  CarModel(id: "l3", name: "L3"),
  CarModel(id: "atto_3", name: "Atto 3"),
  CarModel(id: "han", name: "Han"),
  CarModel(id: "tang", name: "Tang"),
  CarModel(id: "seal", name: "Seal"),
  CarModel(id: "dolphin", name: "Dolphin"),
  CarModel(id: "song_plus", name: "Song Plus"),
  CarModel(id: "sealion_7", name: "Sealion 7"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> geelyModels = [
  CarModel(id: "coolray", name: "Coolray"),
  CarModel(id: "azkarra", name: "Azkarra"),
  CarModel(id: "okavango", name: "Okavango"),
  CarModel(id: "emgrand", name: "Emgrand"),
  CarModel(id: "monjaro", name: "Monjaro"),
  CarModel(id: "x7", name: "X7"),
  CarModel(id: "tugella", name: "Tugella"),
  CarModel(id: "geometry_a", name: "Geometry A"),
  CarModel(id: "geometry_c", name: "Geometry C"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> bmwModels = [
  CarModel(id: "116", name: "116"),
  CarModel(id: "118", name: "118"),
  CarModel(id: "120", name: "120"),
  CarModel(id: "125", name: "125"),
  CarModel(id: "128", name: "128"),
  CarModel(id: "130", name: "130"),
  CarModel(id: "135", name: "135"),
  CarModel(id: "140", name: "140"),
  CarModel(id: "m1", name: "M1"),

  CarModel(id: "216", name: "216"),
  CarModel(id: "218", name: "218"),
  CarModel(id: "220", name: "220"),
  CarModel(id: "225", name: "225"),
  CarModel(id: "228", name: "228"),
  CarModel(id: "230", name: "230"),
  CarModel(id: "235", name: "235"),
  CarModel(id: "240", name: "240"),
  CarModel(id: "m2", name: "M2"),

  CarModel(id: "316", name: "316"),
  CarModel(id: "318", name: "318"),
  CarModel(id: "320", name: "320"),
  CarModel(id: "325", name: "325"),
  CarModel(id: "328", name: "328"),
  CarModel(id: "330", name: "330"),
  CarModel(id: "335", name: "335"),
  CarModel(id: "340", name: "340"),
  CarModel(id: "m3", name: "M3"),

  CarModel(id: "418", name: "418"),
  CarModel(id: "420", name: "420"),
  CarModel(id: "425", name: "425"),
  CarModel(id: "428", name: "428"),
  CarModel(id: "430", name: "430"),
  CarModel(id: "435", name: "435"),
  CarModel(id: "440", name: "440"),
  CarModel(id: "m4", name: "M4"),

  CarModel(id: "520", name: "520"),
  CarModel(id: "525", name: "525"),
  CarModel(id: "528", name: "528"),
  CarModel(id: "530", name: "530"),
  CarModel(id: "535", name: "535"),
  CarModel(id: "540", name: "540"),
  CarModel(id: "545", name: "545"),
  CarModel(id: "550", name: "550"),
  CarModel(id: "555", name: "555"),
  CarModel(id: "m5", name: "M5"),

  CarModel(id: "640", name: "640"),
  CarModel(id: "650", name: "650"),
  CarModel(id: "m6", name: "M6"),

  CarModel(id: "730", name: "730"),
  CarModel(id: "740", name: "740"),
  CarModel(id: "745", name: "745"),
  CarModel(id: "750", name: "750"),
  CarModel(id: "760", name: "760"),
  CarModel(id: "m760", name: "M 760"),

  CarModel(id: "x1", name: "X1"),
  CarModel(id: "x2", name: "X2 "),
  CarModel(id: "x3", name: "X3"),
  CarModel(id: "x3m", name: "X3 M"),
  CarModel(id: "x4", name: "X4"),
  CarModel(id: "x4m", name: "X4 M"),
  CarModel(id: "x5", name: "X5"),
  CarModel(id: "x5m", name: "X5 M"),
  CarModel(id: "x6", name: "X6"),
  CarModel(id: "x6m", name: "X6 M"),
  CarModel(id: "x7", name: "X7"),
  CarModel(id: "x7m", name: "X7 M"),
  CarModel(id: "x8", name: "X8"),
  CarModel(id: "x8m", name: "X8 M"),
  CarModel(id: "xm", name: "XM"),
  CarModel(id: "z1", name: "Z1"),
  CarModel(id: "z2", name: "Z2"),
  CarModel(id: "z3", name: "Z3"),
  CarModel(id: "z4", name: "Z4"),
  CarModel(id: "z8", name: "Z8"),
  CarModel(id: "820", name: "820"),
  CarModel(id: "830", name: "830"),
  CarModel(id: "840", name: "840"),
  CarModel(id: "850", name: "850"),
  CarModel(id: "m8", name: "M8"),
  CarModel(id: "i3", name: "i3"),
  CarModel(id: "i4", name: "i4"),
  CarModel(id: "i5", name: "i5"),
  CarModel(id: "i6", name: "i6"),
  CarModel(id: "i7", name: "i7"),
  CarModel(id: "i8", name: "i8"),
  CarModel(id: "iX", name: "iX"),
  CarModel(id: "ix1", name: "ix1"),
  CarModel(id: "iX2", name: "iX2"),
  CarModel(id: "iX3", name: "iX3"),
  CarModel(id: "iX40", name: "iX40"),
  CarModel(id: "iX50", name: "iX50"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> volkswagenModels = [
  CarModel(id: "polo", name: "Polo"),
  CarModel(id: "golf", name: "Golf"),
  CarModel(id: "jetta", name: "Jetta"),
  CarModel(id: "passat", name: "Passat"),
  CarModel(id: "arteon", name: "Arteon"),
  CarModel(id: "tiguan", name: "Tiguan"),
  CarModel(id: "touareg", name: "Touareg"),
  CarModel(id: "t_roc", name: "T-Roc"),
  CarModel(id: "taos", name: "Taos"),
  CarModel(id: "id_3", name: "ID.3"),
  CarModel(id: "id_4", name: "ID.4"),
  CarModel(id: "id_5", name: "ID.5"),
  CarModel(id: "id_buzz", name: "ID. Buzz"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> volvoModels = [
  CarModel(id: "xc40", name: "XC40"),
  CarModel(id: "xc60", name: "XC60"),
  CarModel(id: "xc90", name: "XC90"),
  CarModel(id: "s60", name: "S60"),
  CarModel(id: "s90", name: "S90"),
  CarModel(id: "v60", name: "V60"),
  CarModel(id: "v90", name: "V90"),
  CarModel(id: "ex30", name: "EX30"),
  CarModel(id: "ex90", name: "EX90"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> renaultModels = [
  CarModel(id: "clio", name: "Clio"),
  CarModel(id: "megane", name: "Megane"),
  CarModel(id: "captur", name: "Captur"),
  CarModel(id: "kadjar", name: "Kadjar"),
  CarModel(id: "talisman", name: "Talisman"),
  CarModel(id: "koleos", name: "Koleos"),
  CarModel(id: "arkana", name: "Arkana"),
  CarModel(id: "austral", name: "Austral"),
  CarModel(id: "zoe", name: "Zoe"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> peugeotModels = [
  CarModel(id: "208", name: "208"),
  CarModel(id: "2008", name: "2008"),
  CarModel(id: "308", name: "308"),
  CarModel(id: "3008", name: "3008"),
  CarModel(id: "408", name: "408"),
  CarModel(id: "4008", name: "4008"),
  CarModel(id: "508", name: "508"),
  CarModel(id: "5008", name: "5008"),
  CarModel(id: "rifter", name: "Rifter"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> citroenModels = [
  CarModel(id: "c3", name: "C3"),
  CarModel(id: "c4", name: "C4"),
  CarModel(id: "c5_aircross", name: "C5 Aircross"),
  CarModel(id: "berlingo", name: "Berlingo"),
  CarModel(id: "c3_aircross", name: "C3 Aircross"),
  CarModel(id: "c5_x", name: "C5 X"),
  CarModel(id: "ami", name: "Ami"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> fiatModels = [
  CarModel(id: "500", name: "500"),
  CarModel(id: "panda", name: "Panda"),
  CarModel(id: "tipo", name: "Tipo"),
  CarModel(id: "500x", name: "500X"),
  CarModel(id: "punto", name: "Punto"),
  CarModel(id: "linea", name: "Linea"),
  CarModel(id: "tempra", name: "Tempra"),
  CarModel(id: "doblo", name: "Doblo"),
  CarModel(id: "ducato", name: "Ducato"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> ferrariModels = [
  CarModel(id: "roma", name: "Roma"),
  CarModel(id: "portofino", name: "Portofino"),
  CarModel(id: "f8_tributo", name: "F8 Tributo"),
  CarModel(id: "296_gtb", name: "296 GTB"),
  CarModel(id: "sf90", name: "SF90"),
  CarModel(id: "purosangue", name: "Purosangue"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> porscheModels = [
  CarModel(id: "911", name: "911"),
  CarModel(id: "cayenne", name: "Cayenne"),
  CarModel(id: "macan", name: "Macan"),
  CarModel(id: "panamera", name: "Panamera"),
  CarModel(id: "taycan", name: "Taycan"),
  CarModel(id: "cayman", name: "Cayman"),
  CarModel(id: "boxster", name: "Boxster"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> jaguarModels = [
  CarModel(id: "xe", name: "XE"),
  CarModel(id: "xf", name: "XF"),
  CarModel(id: "f_pace", name: "F-Pace"),
  CarModel(id: "i_pace", name: "I-Pace"),
  CarModel(id: "f_type", name: "F-Type"),
  CarModel(id: "e_pace", name: "E-Pace"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> landRoverModels = [
  CarModel(id: "defender", name: "Defender"),
  CarModel(id: "discovery", name: "Discovery"),
  CarModel(id: "discovery_sport", name: "Discovery Sport"),
  CarModel(id: "range_rover", name: "Range Rover"),
  CarModel(id: "range_rover_sport", name: "Range Rover Sport"),
  CarModel(id: "range_rover_velar", name: "Range Rover Velar"),
  CarModel(id: "range_rover_evoque", name: "Range Rover Evoque"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> miniModels = [
  CarModel(id: "hatch", name: "Hatch"),
  CarModel(id: "clubman", name: "Clubman"),
  CarModel(id: "countryman", name: "Countryman"),
  CarModel(id: "convertible", name: "Convertible"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> skodaModels = [
  CarModel(id: "fabia", name: "Fabia"),
  CarModel(id: "octavia", name: "Octavia"),
  CarModel(id: "superb", name: "Superb"),
  CarModel(id: "kodiaq", name: "Kodiaq"),
  CarModel(id: "karoq", name: "Karoq"),
  CarModel(id: "enyaq", name: "Enyaq"),
  CarModel(id: "scala", name: "Scala"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> seatModels = [
  CarModel(id: "ibiza", name: "Ibiza"),
  CarModel(id: "leon", name: "Leon"),
  CarModel(id: "toledo", name: "Toledo"),
  CarModel(id: "ateca", name: "Ateca"),
  CarModel(id: "tarraco", name: "Tarraco"),
  CarModel(id: "arona", name: "Arona"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> fordModels = [
  CarModel(id: "focus", name: "Focus"),
  CarModel(id: "fusion", name: "Fusion"),
  CarModel(id: "mondeo", name: "Mondeo"),
  CarModel(id: "mustang", name: "Mustang"),
  CarModel(id: "explorer", name: "Explorer"),
  CarModel(id: "escape", name: "Escape"),
  CarModel(id: "edge", name: "Edge"),
  CarModel(id: "ranger", name: "Ranger"),
  CarModel(id: "f_150", name: "F-150"),
  CarModel(id: "bronco", name: "Bronco"),
  CarModel(id: "everest", name: "Everest"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> chevroletModels = [
  CarModel(id: "spark", name: "Spark"),
  CarModel(id: "aveo", name: "Aveo"),
  CarModel(id: "optra", name: "Optra"),
  CarModel(id: "cruze", name: "Cruze"),
  CarModel(id: "malibu", name: "Malibu"),
  CarModel(id: "camaro", name: "Camaro"),
  CarModel(id: "corvette", name: "Corvette"),
  CarModel(id: "captiva", name: "Captiva"),
  CarModel(id: "equinox", name: "Equinox"),
  CarModel(id: "tahoe", name: "Tahoe"),
  CarModel(id: "silverado", name: "Silverado"),
  CarModel(id: "traverse", name: "Traverse"),
  CarModel(id: "blazer", name: "Blazer"),
  CarModel(id: "suburban", name: "Suburban"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> gmcModels = [
  CarModel(id: "terrain", name: "Terrain"),
  CarModel(id: "acadia", name: "Acadia"),
  CarModel(id: "yukon", name: "Yukon"),
  CarModel(id: "sierra", name: "Sierra"),
  CarModel(id: "canyon", name: "Canyon"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> dodgeModels = [
  CarModel(id: "charger", name: "Charger"),
  CarModel(id: "challenger", name: "Challenger"),
  CarModel(id: "durango", name: "Durango"),
  CarModel(id: "journey", name: "Journey"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> jeepModels = [
  CarModel(id: "compass", name: "Compass"),
  CarModel(id: "cherokee", name: "Cherokee"),
  CarModel(id: "grand_cherokee", name: "Grand Cherokee"),
  CarModel(id: "wrangler", name: "Wrangler"),
  CarModel(id: "gladiator", name: "Gladiator"),
  CarModel(id: "renegade", name: "Renegade"),
  CarModel(id: "wagoneer", name: "Wagoneer"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> chryslerModels = [
  CarModel(id: "300", name: "300"),
  CarModel(id: "pacifica", name: "Pacifica"),
  CarModel(id: "voyager", name: "Voyager"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> cadillacModels = [
  CarModel(id: "ct4", name: "CT4"),
  CarModel(id: "ct5", name: "CT5"),
  CarModel(id: "xt4", name: "XT4"),
  CarModel(id: "xt5", name: "XT5"),
  CarModel(id: "xt6", name: "XT6"),
  CarModel(id: "escalade", name: "Escalade"),
  CarModel(id: "lyriq", name: "Lyriq"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> teslaModels = [
  CarModel(id: "model_3", name: "Model 3"),
  CarModel(id: "model_y", name: "Model Y"),
  CarModel(id: "model_s", name: "Model S"),
  CarModel(id: "model_x", name: "Model X"),
  CarModel(id: "cybertruck", name: "Cybertruck"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> lucidModels = [
  CarModel(id: "air", name: "Air"),
  CarModel(id: "gravity", name: "Gravity"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> rivianModels = [
  CarModel(id: "r1t", name: "R1T"),
  CarModel(id: "r1s", name: "R1S"),
  CarModel(id: "r2", name: "R2"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> astonMartinModels = [
  CarModel(id: "db11", name: "DB11"),
  CarModel(id: "db9", name: "DB9"),
  CarModel(id: "dbx", name: "DBX"),
  CarModel(id: "vantage", name: "Vantage"),
  CarModel(id: "rapide", name: "Rapide"),
  CarModel(id: "valhalla", name: "Valhalla"),
  CarModel(id: "db12", name: "DB12"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> bentleyModels = [
  CarModel(id: "continental_gt", name: "Continental GT"),
  CarModel(id: "flying_spur", name: "Flying Spur"),
  CarModel(id: "bentayga", name: "Bentayga"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> rollsRoyceModels = [
  CarModel(id: "ghost", name: "Ghost"),
  CarModel(id: "phantom", name: "Phantom"),
  CarModel(id: "cullinan", name: "Cullinan"),
  CarModel(id: "spectre", name: "Spectre"),
  CarModel(id: "dawn", name: "Dawn"),
  CarModel(id: "wraith", name: "Wraith"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> mclarenModels = [
  CarModel(id: "gt", name: "GT"),
  CarModel(id: "artura", name: "Artura"),
  CarModel(id: "720s", name: "720S"),
  CarModel(id: "750s", name: "750S"),
  CarModel(id: "senna", name: "Senna"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> bugattiModels = [
  CarModel(id: "chiron", name: "Chiron"),
  CarModel(id: "divo", name: "Divo"),
  CarModel(id: "mistral", name: "Mistral"),
  CarModel(id: "bolide", name: "Bolide"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> paganiModels = [
  CarModel(id: "zonda", name: "Zonda"),
  CarModel(id: "huayra", name: "Huayra"),
  CarModel(id: "utopia", name: "Utopia"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> koenigseggModels = [
  CarModel(id: "jesko", name: "Jesko"),
  CarModel(id: "gemera", name: "Gemera"),
  CarModel(id: "regera", name: "Regera"),
  CarModel(id: "agera", name: "Agera"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> vinfastModels = [
  CarModel(id: "vf3", name: "VF3"),
  CarModel(id: "vf5", name: "VF5"),
  CarModel(id: "vf7", name: "VF7"),
  CarModel(id: "vf8", name: "VF8"),
  CarModel(id: "vf9", name: "VF9"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> bytonModels = [
  CarModel(id: "m_byte", name: "M-Byte"),
  CarModel(id: "k_byte", name: "K-Byte"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> nioModels = [
  CarModel(id: "es6", name: "ES6"),
  CarModel(id: "es8", name: "ES8"),
  CarModel(id: "et5", name: "ET5"),
  CarModel(id: "et7", name: "ET7"),
  CarModel(id: "ec6", name: "EC6"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> xpengModels = [
  CarModel(id: "g3", name: "G3"),
  CarModel(id: "g9", name: "G9"),
  CarModel(id: "p5", name: "P5"),
  CarModel(id: "p7", name: "P7"),
  CarModel(id: "g6", name: "G6"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> zeekrModels = [
  CarModel(id: "001", name: "001"),
  CarModel(id: "007", name: "007"),
  CarModel(id: "009", name: "009"),
  CarModel(id: "x", name: "X"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> lynkAndCoModels = [
  CarModel(id: "01", name: "01"),
  CarModel(id: "03", name: "03"),
  CarModel(id: "05", name: "05"),
  CarModel(id: "09", name: "09"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> mgModels = [
  CarModel(id: "mg3", name: "MG3"),
  CarModel(id: "mg5", name: "MG5"),
  CarModel(id: "mg6", name: "MG6"),
  CarModel(id: "zs", name: "ZS"),
  CarModel(id: "hs", name: "HS"),
  CarModel(id: "mg4", name: "MG4"),
  CarModel(id: "mg7", name: "MG7"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> smartModels = [
  CarModel(id: "fortwo", name: "Fortwo"),
  CarModel(id: "forfour", name: "Forfour"),
  CarModel(id: "hashtag_1", name: "Hashtag 1"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> cupraModels = [
  CarModel(id: "born", name: "Born"),
  CarModel(id: "formentor", name: "Formentor"),
  CarModel(id: "leon", name: "Leon"),
  CarModel(id: "ateca", name: "Ateca"),
  CarModel(id: "terramar", name: "Terramar"),
  CarModel(id: "tavascan", name: "Tavascan"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> dsAutomobilesModels = [
  CarModel(id: "ds3", name: "DS 3"),
  CarModel(id: "ds4", name: "DS 4"),
  CarModel(id: "ds5", name: "DS 5"),
  CarModel(id: "ds7", name: "DS 7"),
  CarModel(id: "ds9", name: "DS 9"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> avatrModels = [
  CarModel(id: "11", name: "11"),
  CarModel(id: "12", name: "12"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> baicModels = [
  CarModel(id: "x35", name: "X35"),
  CarModel(id: "x55", name: "X55"),
  CarModel(id: "x7", name: "X7"),
  CarModel(id: "u5_plus", name: "U5 Plus"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> brillianceModels = [
  CarModel(id: "v5", name: "V5"),
  CarModel(id: "v6", name: "V6"),
  CarModel(id: "v7", name: "V7"),
  CarModel(id: "frv", name: "FRV"),
  CarModel(id: "fsv", name: "FSV"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> daewooModels = [
  CarModel(id: "lanos", name: "Lanos"),
  CarModel(id: "nubira", name: "Nubira"),
  CarModel(id: "leganza", name: "Leganza"),
  CarModel(id: "matiz", name: "Matiz"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> deepalModels = [
  CarModel(id: "s7", name: "S7"),
  CarModel(id: "l07", name: "L07"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> dfskModels = [
  CarModel(id: "glory_330", name: "Glory 330"),
  CarModel(id: "glory_500", name: "Glory 500"),
  CarModel(id: "glory_580", name: "Glory 580"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> exeedModels = [
  CarModel(id: "txl", name: "TXL"),
  CarModel(id: "vx", name: "VX"),
  CarModel(id: "lx", name: "LX"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> fawModels = [
  CarModel(id: "bestune_t55", name: "Bestune T55"),
  CarModel(id: "bestune_t77", name: "Bestune T77"),
  CarModel(id: "bestune_b70", name: "Bestune B70"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> jetourModels = [
  CarModel(id: "x70", name: "X70"),
  CarModel(id: "x70_plus", name: "X70 Plus"),
  CarModel(id: "x90", name: "X90"),
  CarModel(id: "dashing", name: "Dashing"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> kaiyiModels = [
  CarModel(id: "x3", name: "X3"),
  CarModel(id: "e5", name: "E5"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> kgmModels = [
  CarModel(id: "tivoli", name: "Tivoli"),
  CarModel(id: "korando", name: "Korando"),
  CarModel(id: "rexton", name: "Rexton"),
  CarModel(id: "musso", name: "Musso"),
  CarModel(id: "torres", name: "Torres"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> ladaModels = [
  CarModel(id: "granta", name: "Granta"),
  CarModel(id: "vesta", name: "Vesta"),
  CarModel(id: "largus", name: "Largus"),
  CarModel(id: "niva", name: "Niva"),
  CarModel(id: "niva_travel", name: "Niva Travel"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> roxModels = [
  CarModel(id: "rox_01", name: "Rox 01"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> saipaModels = [
  CarModel(id: "pride", name: "Pride"),
  CarModel(id: "tiba", name: "Tiba"),
  CarModel(id: "saina", name: "Saina"),
  CarModel(id: "quick", name: "Quick"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> senovaModels = [
  CarModel(id: "d20", name: "D20"),
  CarModel(id: "x25", name: "X25"),
  CarModel(id: "x35", name: "X35"),
  CarModel(id: "x55", name: "X55"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> soueastModels = [
  CarModel(id: "dx3", name: "DX3"),
  CarModel(id: "dx7", name: "DX7"),
  CarModel(id: "dx8", name: "DX8"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> xiaomiModels = [
  CarModel(id: "su7", name: "SU7"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> zotyeModels = [
  CarModel(id: "t600", name: "T600"),
  CarModel(id: "t700", name: "T700"),
  CarModel(id: "z300", name: "Z300"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> hummerModels = [
  CarModel(id: "h2", name: "H2"),
  CarModel(id: "h3", name: "H3"),
  CarModel(id: "ev", name: "EV"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> dongfengModels = [
  CarModel(id: "shine", name: "Shine"),
  CarModel(id: "a30", name: "A30"),
  CarModel(id: "fengon_580", name: "Fengon 580"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> alfaRomeoModels = [
  CarModel(id: "giulia", name: "Giulia"),
  CarModel(id: "stelvio", name: "Stelvio"),
  CarModel(id: "tonale", name: "Tonale"),
  CarModel(id: "giulietta", name: "Giulietta"),
  CarModel(id: "mito", name: "MiTo"),
  CarModel(id: "4c", name: "4C"),
  CarModel(id: "159", name: "159"),
  CarModel(id: "147", name: "147"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> abarthModels = [
  CarModel(id: "595", name: "595"),
  CarModel(id: "695", name: "695"),
  CarModel(id: "124_spider", name: "124 Spider"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> lanciaModels = [
  CarModel(id: "ypsilon", name: "Ypsilon"),
  CarModel(id: "delta", name: "Delta"),
  CarModel(id: "thema", name: "Thema"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> lamborghiniModels = [
  CarModel(id: "huracan", name: "Huracan"),
  CarModel(id: "aventador", name: "Aventador"),
  CarModel(id: "urus", name: "Urus"),
  CarModel(id: "revuelto", name: "Revuelto"),
  CarModel(id: "gallardo", name: "Gallardo"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> maseratiModels = [
  CarModel(id: "ghibli", name: "Ghibli"),
  CarModel(id: "quattroporte", name: "Quattroporte"),
  CarModel(id: "levante", name: "Levante"),
  CarModel(id: "grecale", name: "Grecale"),
  CarModel(id: "granturismo", name: "GranTurismo"),
  CarModel(id: "mc20", name: "MC20"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> lotusModels = [
  CarModel(id: "elise", name: "Elise"),
  CarModel(id: "exige", name: "Exige"),
  CarModel(id: "evora", name: "Evora"),
  CarModel(id: "emira", name: "Emira"),
  CarModel(id: "eletre", name: "Eletre"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> opelModels = [
  CarModel(id: "corsa", name: "Corsa"),
  CarModel(id: "astra", name: "Astra"),
  CarModel(id: "vectra", name: "Vectra"),
  CarModel(id: "insignia", name: "Insignia"),
  CarModel(id: "mokka", name: "Mokka"),
  CarModel(id: "crossland", name: "Crossland"),
  CarModel(id: "grandland", name: "Grandland"),
  CarModel(id: "zafira", name: "Zafira"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> vauxhallModels = [
  CarModel(id: "corsa", name: "Corsa"),
  CarModel(id: "astra", name: "Astra"),
  CarModel(id: "insignia", name: "Insignia"),
  CarModel(id: "mokka", name: "Mokka"),
  CarModel(id: "crossland", name: "Crossland"),
  CarModel(id: "grandland", name: "Grandland"),
  CarModel(id: "zafira", name: "Zafira"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> daciaModels = [
  CarModel(id: "sandero", name: "Sandero"),
  CarModel(id: "duster", name: "Duster"),
  CarModel(id: "logan", name: "Logan"),
  CarModel(id: "jogger", name: "Jogger"),
  CarModel(id: "spring", name: "Spring"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> buickModels = [
  CarModel(id: "encore", name: "Encore"),
  CarModel(id: "encore_gx", name: "Encore GX"),
  CarModel(id: "envision", name: "Envision"),
  CarModel(id: "enclave", name: "Enclave"),
  CarModel(id: "excelle", name: "Excelle"),
  CarModel(id: "regal", name: "Regal"),
  CarModel(id: "lacrosse", name: "LaCrosse"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> lincolnModels = [
  CarModel(id: "corsair", name: "Corsair"),
  CarModel(id: "nautilus", name: "Nautilus"),
  CarModel(id: "aviator", name: "Aviator"),
  CarModel(id: "navigator", name: "Navigator"),
  CarModel(id: "mkz", name: "MKZ"),
  CarModel(id: "continental", name: "Continental"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> ramModels = [
  CarModel(id: "ram_1500", name: "1500"),
  CarModel(id: "ram_2500", name: "2500"),
  CarModel(id: "ram_3500", name: "3500"),
  CarModel(id: "promaster", name: "ProMaster"),
  CarModel(id: "promaster_city", name: "ProMaster City"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> daihatsuModels = [
  CarModel(id: "terios", name: "Terios"),
  CarModel(id: "mira", name: "Mira"),
  CarModel(id: "sirion", name: "Sirion"),
  CarModel(id: "ayla", name: "Ayla"),
  CarModel(id: "rocky", name: "Rocky"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> ssangyongModels = [
  CarModel(id: "tivoli", name: "Tivoli"),
  CarModel(id: "korando", name: "Korando"),
  CarModel(id: "rexton", name: "Rexton"),
  CarModel(id: "musso", name: "Musso"),
  CarModel(id: "torres", name: "Torres"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> cheryModels = [
  CarModel(id: "tiggo", name: "Tiggo"),
  CarModel(id: "arrizo", name: "Arrizo"),
  CarModel(id: "envy", name: "Envy"),

  CarModel(id: "other", name: "other"),
];

List<CarModel> changanModels = [
  CarModel(id: "cs35", name: "CS35"),
  CarModel(id: "cs55", name: "CS55"),
  CarModel(id: "cs75", name: "CS75"),
  CarModel(id: "cs95", name: "CS95"),
  CarModel(id: "eado", name: "Eado"),
  CarModel(id: "uni_t", name: "UNI-T"),
  CarModel(id: "uni_k", name: "UNI-K"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> gwmModels = [
  CarModel(id: "poer", name: "Poer"),
  CarModel(id: "wingle", name: "Wingle"),
  CarModel(id: "cannon", name: "Cannon"),
  CarModel(id: "hover", name: "Hover"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> havalModels = [
  CarModel(id: "h2", name: "H2"),
  CarModel(id: "h6", name: "H6"),
  CarModel(id: "h7", name: "H7"),
  CarModel(id: "h9", name: "H9"),
  CarModel(id: "jolion", name: "Jolion"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> tankModels = [
  CarModel(id: "300", name: "300"),
  CarModel(id: "400", name: "400"),
  CarModel(id: "500", name: "500"),
  CarModel(id: "700", name: "700"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> oraModels = [
  CarModel(id: "good_cat", name: "Good Cat"),
  CarModel(id: "funky_cat", name: "Funky Cat"),
  CarModel(id: "ballet_cat", name: "Ballet Cat"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> jacModels = [
  CarModel(id: "j7", name: "J7"),
  CarModel(id: "s3", name: "S3"),
  CarModel(id: "s5", name: "S5"),
  CarModel(id: "js4", name: "JS4"),
  CarModel(id: "js6", name: "JS6"),
  CarModel(id: "t6", name: "T6"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> gacModels = [
  CarModel(id: "gs3", name: "GS3"),
  CarModel(id: "gs4", name: "GS4"),
  CarModel(id: "gs8", name: "GS8"),
  CarModel(id: "m8", name: "M8"),
  CarModel(id: "emzoom", name: "Emzoom"),
  CarModel(id: "emkoo", name: "Emkoo"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> maxusModels = [
  CarModel(id: "d90", name: "D90"),
  CarModel(id: "t60", name: "T60"),
  CarModel(id: "t90", name: "T90"),
  CarModel(id: "g50", name: "G50"),
  CarModel(id: "v90", name: "V90"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> wulingModels = [
  CarModel(id: "hongguang", name: "Hongguang"),
  CarModel(id: "hongguang_mini_ev", name: "Hongguang Mini EV"),
  CarModel(id: "air_ev", name: "Air EV"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> polestarModels = [
  CarModel(id: "polestar_1", name: "Polestar 1"),
  CarModel(id: "polestar_2", name: "Polestar 2"),
  CarModel(id: "polestar_3", name: "Polestar 3"),
  CarModel(id: "polestar_4", name: "Polestar 4"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> audiModels = [
  CarModel(id: "a1", name: "A1"),
  CarModel(id: "a3", name: "A3"),
  CarModel(id: "a4", name: "A4"),
  CarModel(id: "a5", name: "A5"),
  CarModel(id: "a6", name: "A6"),
  CarModel(id: "a7", name: "A7"),
  CarModel(id: "a8", name: "A8"),
  CarModel(id: "q3", name: "Q3"),
  CarModel(id: "q5", name: "Q5"),
  CarModel(id: "q7", name: "Q7"),
  CarModel(id: "q8", name: "Q8"),
  CarModel(id: "tt", name: "TT"),
  CarModel(id: "r8", name: "R8"),
  CarModel(id: "etron", name: "e-tron"),
  CarModel(id: "other", name: "other"),
];

List<CarModel> mercedesModels = [
  CarModel(id: "a_150", name: "A 150"),
  CarModel(id: "a_160", name: "A 160"),
  CarModel(id: "a_170", name: "A 170"),
  CarModel(id: "a_180", name: "A 180"),
  CarModel(id: "a_200", name: "A 200"),
  CarModel(id: "a_220", name: "A 220"),
  CarModel(id: "a_250", name: "A 250"),
  CarModel(id: "a_250e", name: "A 250e"),
  CarModel(id: "a_35", name: "A 35"),
  CarModel(id: "a_35_amg", name: "A 35 AMG"),
  CarModel(id: "a_45", name: "A 45"),
  CarModel(id: "a_45_amg", name: "A 45 AMG"),

  CarModel(id: "b_150", name: "B 150"),
  CarModel(id: "b_160", name: "B 160"),
  CarModel(id: "b_170", name: "B 170"),
  CarModel(id: "b_180", name: "B 180"),
  CarModel(id: "b_200", name: "B 200"),
  CarModel(id: "b_220", name: "B 220"),
  CarModel(id: "b_250", name: "B 250"),
  CarModel(id: "b_260", name: "B 260"),

  CarModel(id: "c_160", name: "C 160"),
  CarModel(id: "c_180", name: "C 180"),
  CarModel(id: "c_200", name: "C 200"),
  CarModel(id: "c_220", name: "C 220"),
  CarModel(id: "c_230", name: "C 230"),
  CarModel(id: "c_240", name: "C 240"),
  CarModel(id: "c_250", name: "C 250"),
  CarModel(id: "c_300", name: "C 300"),
  CarModel(id: "c_320", name: "C 320"),
  CarModel(id: "c_350", name: "C 350"),
  CarModel(id: "c_400", name: "C 400"),
  CarModel(id: "c_43", name: "C 43"),
  CarModel(id: "c_63", name: "C 63"),

  CarModel(id: "e_180", name: "E 180"),
  CarModel(id: "e_200", name: "E 200"),
  CarModel(id: "e_220", name: "E 220"),
  CarModel(id: "e_240", name: "E 240"),
  CarModel(id: "e_250", name: "E 250"),
  CarModel(id: "e_260", name: "E 260"),
  CarModel(id: "e_280", name: "E 280"),
  CarModel(id: "e_300", name: "E 300"),
  CarModel(id: "e_320", name: "E 320"),
  CarModel(id: "e_350", name: "E 350"),
  CarModel(id: "e_400", name: "E 400"),
  CarModel(id: "e_420", name: "E 420"),
  CarModel(id: "e_43", name: "E 43"),
  CarModel(id: "e_53", name: "E 53"),
  CarModel(id: "e_63", name: "E 63"),

  CarModel(id: "s_280", name: "S 280"),
  CarModel(id: "s_300", name: "S 300"),
  CarModel(id: "s_320", name: "S 320"),
  CarModel(id: "s_350", name: "S 350"),
  CarModel(id: "s_400", name: "S 400"),
  CarModel(id: "s_420", name: "S 420"),
  CarModel(id: "s_430", name: "S 430"),
  CarModel(id: "s_450", name: "S 450"),
  CarModel(id: "s_500", name: "S 500"),
  CarModel(id: "s_550", name: "S 550"),
  CarModel(id: "s_560", name: "S 560"),
  CarModel(id: "s_600", name: "S 600"),
  CarModel(id: "s_63", name: "S 63"),
  CarModel(id: "s_65", name: "S 65"),

  CarModel(id: "cla_180", name: "CLA 180"),
  CarModel(id: "cla_200", name: "CLA 200"),
  CarModel(id: "cla_220", name: "CLA 220"),
  CarModel(id: "cla_250", name: "CLA 250"),
  CarModel(id: "cla_35", name: "CLA 35"),
  CarModel(id: "cla_45", name: "CLA 45"),

  CarModel(id: "cls_250", name: "CLS 250"),
  CarModel(id: "cls_300", name: "CLS 300"),
  CarModel(id: "cls_350", name: "CLS 350"),
  CarModel(id: "cls_400", name: "CLS 400"),
  CarModel(id: "cls_450", name: "CLS 450"),
  CarModel(id: "cls_53", name: "CLS 53"),
  CarModel(id: "cls_63", name: "CLS 63"),

  CarModel(id: "gla_180", name: "GLA 180"),
  CarModel(id: "gla_200", name: "GLA 200"),
  CarModel(id: "gla_220", name: "GLA 220"),
  CarModel(id: "gla_250", name: "GLA 250"),
  CarModel(id: "gla_35", name: "GLA 35"),
  CarModel(id: "gla_45", name: "GLA 45"),

  CarModel(id: "glb_180", name: "GLB 180"),
  CarModel(id: "glb_200", name: "GLB 200"),
  CarModel(id: "glb_220", name: "GLB 220"),
  CarModel(id: "glb_250", name: "GLB 250"),
  CarModel(id: "glb_35", name: "GLB 35"),

  CarModel(id: "glc_200", name: "GLC 200"),
  CarModel(id: "glc_220", name: "GLC 220"),
  CarModel(id: "glc_250", name: "GLC 250"),
  CarModel(id: "glc_300", name: "GLC 300"),
  CarModel(id: "glc_350", name: "GLC 350"),
  CarModel(id: "glc_400", name: "GLC 400"),
  CarModel(id: "glc_43", name: "GLC 43"),
  CarModel(id: "glc_63", name: "GLC 63"),

  CarModel(id: "gle_250", name: "GLE 250"),
  CarModel(id: "gle_300", name: "GLE 300"),
  CarModel(id: "gle_350", name: "GLE 350"),
  CarModel(id: "gle_400", name: "GLE 400"),
  CarModel(id: "gle_450", name: "GLE 450"),
  CarModel(id: "gle_53", name: "GLE 53"),
  CarModel(id: "gle_63", name: "GLE 63"),

  CarModel(id: "gls_350", name: "GLS 350"),
  CarModel(id: "gls_400", name: "GLS 400"),
  CarModel(id: "gls_450", name: "GLS 450"),
  CarModel(id: "gls_500", name: "GLS 500"),
  CarModel(id: "gls_580", name: "GLS 580"),
  CarModel(id: "gls_63", name: "GLS 63"),

  CarModel(id: "g_350", name: "G 350"),
  CarModel(id: "g_400", name: "G 400"),
  CarModel(id: "g_500", name: "G 500"),
  CarModel(id: "g_550", name: "G 550"),
  CarModel(id: "g_63", name: "G 63"),

  CarModel(id: "sl_280", name: "SL 280"),
  CarModel(id: "sl_300", name: "SL 300"),
  CarModel(id: "sl_320", name: "SL 320"),
  CarModel(id: "sl_350", name: "SL 350"),
  CarModel(id: "sl_500", name: "SL 500"),
  CarModel(id: "sl_55", name: "SL 55"),
  CarModel(id: "sl_63", name: "SL 63"),
  CarModel(id: "sl_65", name: "SL 65"),

  CarModel(id: "slc_180", name: "SLC 180"),
  CarModel(id: "slc_200", name: "SLC 200"),
  CarModel(id: "slc_250", name: "SLC 250"),
  CarModel(id: "slc_300", name: "SLC 300"),
  CarModel(id: "slc_43", name: "SLC 43"),

  CarModel(id: "slk_200", name: "SLK 200"),
  CarModel(id: "slk_230", name: "SLK 230"),
  CarModel(id: "slk_250", name: "SLK 250"),
  CarModel(id: "slk_280", name: "SLK 280"),
  CarModel(id: "slk_300", name: "SLK 300"),
  CarModel(id: "slk_320", name: "SLK 320"),
  CarModel(id: "slk_350", name: "SLK 350"),
  CarModel(id: "slk_55", name: "SLK 55"),

  CarModel(id: "glk_200", name: "GLK 200"),
  CarModel(id: "glk_220", name: "GLK 220"),
  CarModel(id: "glk_250", name: "GLK 250"),
  CarModel(id: "glk_280", name: "GLK 280"),
  CarModel(id: "glk_300", name: "GLK 300"),
  CarModel(id: "glk_350", name: "GLK 350"),

  CarModel(id: "ml_250", name: "ML 250"),
  CarModel(id: "ml_270", name: "ML 270"),
  CarModel(id: "ml_280", name: "ML 280"),
  CarModel(id: "ml_300", name: "ML 300"),
  CarModel(id: "ml_320", name: "ML 320"),
  CarModel(id: "ml_350", name: "ML 350"),
  CarModel(id: "ml_400", name: "ML 400"),
  CarModel(id: "ml_430", name: "ML 430"),
  CarModel(id: "ml_500", name: "ML 500"),
  CarModel(id: "ml_550", name: "ML 550"),
  CarModel(id: "ml_63", name: "ML 63"),

  CarModel(id: "gl_320", name: "GL 320"),
  CarModel(id: "gl_350", name: "GL 350"),
  CarModel(id: "gl_400", name: "GL 400"),
  CarModel(id: "gl_450", name: "GL 450"),
  CarModel(id: "gl_500", name: "GL 500"),
  CarModel(id: "gl_550", name: "GL 550"),
  CarModel(id: "gl_63", name: "GL 63"),

  CarModel(id: "r_280", name: "R 280"),
  CarModel(id: "r_300", name: "R 300"),
  CarModel(id: "r_320", name: "R 320"),
  CarModel(id: "r_350", name: "R 350"),
  CarModel(id: "r_500", name: "R 500"),
  CarModel(id: "r_63", name: "R 63"),

  CarModel(id: "v_200", name: "V 200"),
  CarModel(id: "v_220", name: "V 220"),
  CarModel(id: "v_250", name: "V 250"),
  CarModel(id: "v_300", name: "V 300"),
  CarModel(id: "v_350", name: "V 350"),

  CarModel(id: "x_220", name: "X 220"),
  CarModel(id: "x_250", name: "X 250"),
  CarModel(id: "x_350", name: "X 350"),

  CarModel(id: "amg_gt", name: "AMG GT"),
  CarModel(id: "amg_gt_43", name: "AMG GT 43"),
  CarModel(id: "amg_gt_53", name: "AMG GT 53"),
  CarModel(id: "amg_gt_63", name: "AMG GT 63"),
  CarModel(id: "amg_gt_63_s", name: "AMG GT 63 S"),

  CarModel(id: "eqa_250", name: "EQA 250"),
  CarModel(id: "eqa_300", name: "EQA 300"),
  CarModel(id: "eqa_350", name: "EQA 350"),
  CarModel(id: "eqb_250", name: "EQB 250"),
  CarModel(id: "eqb_300", name: "EQB 300"),
  CarModel(id: "eqb_350", name: "EQB 350"),
  CarModel(id: "eqc_400", name: "EQC 400"),
  CarModel(id: "eqe_300", name: "EQE 300"),
  CarModel(id: "eqe_350", name: "EQE 350"),
  CarModel(id: "eqe_500", name: "EQE 500"),
  CarModel(id: "eqe_53", name: "EQE 53"),
  CarModel(id: "eqe_suv_350", name: "EQE SUV 350"),
  CarModel(id: "eqe_suv_500", name: "EQE SUV 500"),
  CarModel(id: "eqe_suv_53", name: "EQE SUV 53"),
  CarModel(id: "eqs_450", name: "EQS 450"),
  CarModel(id: "eqs_500", name: "EQS 500"),
  CarModel(id: "eqs_580", name: "EQS 580"),
  CarModel(id: "eqs_53", name: "EQS 53"),
  CarModel(id: "eqs_suv_450", name: "EQS SUV 450"),
  CarModel(id: "eqs_suv_500", name: "EQS SUV 500"),
  CarModel(id: "eqs_suv_580", name: "EQS SUV 580"),
  CarModel(id: "eqs_suv_53", name: "EQS SUV 53"),
  CarModel(id: "eqv", name: "EQV"),
  CarModel(id: "other", name: "other"),
];
