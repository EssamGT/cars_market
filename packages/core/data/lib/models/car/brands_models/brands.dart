import 'package:constants/constants_manager.dart';
import 'package:data/models/car/brands_models/car_models.dart';

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
      logoUrl: logoUrl ?? AppConstants.baseBrandLogoUrl(id),
      models: models,
      selectedModel:
          selectedModel ??
          const CarModel(id: '', name: '', brand: '', brandId: ''),
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
      selectedModel:
          selectedModel ??
          const CarModel(id: '', name: '', brand: '', brandId: ''),
      version: version ?? 1.0,
    );
  }
  factory CarBrand.all({
    String? id,
    String? name,
    String? logoUrl,
    List<CarModel>? models,
    CarModel? selectedModel,
    double? version,
  }) {
    return CarBrand._(
      id: id ?? '',
      name: name ?? 'All',
      logoUrl: logoUrl ?? AppConstants.baseBrandLogoUrl('all'),
      models: models ?? [],
      selectedModel:
          selectedModel ??
          const CarModel(id: '', name: '', brand: '', brandId: ''),
      version: version ?? 1.0,
    );
  }
  Map<String, dynamic> toJson() {
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
  List<CarModel> forFilter() {
    final filteredModels = List<CarModel>.from(models);
    filteredModels.insert(
      0,
      CarModel(id: '', name: 'All', brand: name, brandId: id),
    );
    return filteredModels;
  }
}

// class CarBrandFilter {
//   final String? id;
//   final String name;
//   final String logoUrl;

//   final List<CarModelFilter> models;
//   final CarModelFilter selectedModel;
//   CarBrandFilter({
//     this.id,
//     required this.name,
//     String? logoUrl,
//     this.models = const [],
//     CarModelFilter? selectedModel,
//   }) : selectedModel = selectedModel ?? CarModelFilter.nullable(),
//        logoUrl = logoUrl ?? AppConstants.basetBrandLogoUrl(id ?? "");

//   List<CarModelFilter> forFilter() {
//     final filteredModels = List<CarModelFilter>.from(models);
//     if (filteredModels.isEmpty || filteredModels.first.id != null) {
//       filteredModels.insert(
//         0,
//         CarModelFilter(id: null, name: 'All', brand: name, brandId: id),
//       );
//     }
//     return filteredModels;
//   }

//   // static List<CarModelFilter> _withAllModel(
// List<CarModelFilter> models,
//   //   String? brandName,
//   //   String? brandId,
//   // ) {
//   //   final filteredModels = List<CarModelFilter>.from(models);
//   //   if (filteredModels.isEmpty || filteredModels.first.id != null) {
//   //     filteredModels.insert(
//   //       0,
//   //       CarModelFilter(
//   //         id: null,
//   //         name: 'All',
//   //         brand: brandName,
//   //         brandId: brandId,
//   //       ),
//   //     );
//   //   }
//   //   return filteredModels;
//   // }

//   factory CarBrandFilter.empty({
//     String? id,
//     String? name,
//     String? logoUrl,
//     List<CarModelFilter>? models,
//     CarModelFilter? selectedModel,
//   }) {
//     return CarBrandFilter(
//       id: id,
//       name: name ?? '',
//       logoUrl: logoUrl,
//       models: models ?? [],
//       selectedModel: selectedModel ?? CarModelFilter.nullable(),
//     );
//   }
// }
