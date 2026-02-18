import 'package:data/models/car/sell_car_model.dart';
import 'package:flutter/material.dart';

class FeatureModel {
  String name;
  String id;
  IconData icon;
  double? iconSize;
  FeatureModel({
    required this.name,
    required this.id,
    required this.icon,
    this.iconSize,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'icon': icon.codePoint,
      'iconFontFamily': icon.fontFamily,
      'iconFontPackage': icon.fontPackage,
      'iconSize': iconSize,
    };
  }
}

class FeaturesList {
  String title;
  String id;
  List<FeatureModel> features;
  FeaturesList({required this.title, required this.features, required this.id});
  // Map<String, dynamic> toJson() {
  //   return {
  //     CarsTableKeys.featuresTitle: title,
  //     CarsTableKeys.featuresId: id,
  //     CarsTableKeys.featuresList: features.map((f) => f.toJson()).toList(),
  //   };
  // }

  Map<String, dynamic> toIdsJson() {
    return {
      CarsTableKeys.featuresTitle: title,
      CarsTableKeys.featuresId: id,
      CarsTableKeys.featuresList: features.map((f) => f.id).toList(),
    };
  }
}
