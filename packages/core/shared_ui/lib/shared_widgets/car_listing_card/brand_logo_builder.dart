import 'package:cached_network_image/cached_network_image.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:domain/entity/car_entity.dart';
import 'package:flutter/material.dart';

class BrandLogoBuilder extends StatelessWidget {
  final String url;
  const BrandLogoBuilder({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s40,
      height: AppSize.s40,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.contain,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

String carInfoBuilder(CarBrand? carBrand) {
  if (carBrand == null ||
      carBrand.name.isEmpty ||
      carBrand.selectedModel.name.isEmpty) {
    return StringsManager.selectCar;
  }
  return "${carBrand.name} ${carBrand.selectedModel.name}";
}

String carInfoBuilderFilter(CarBrand? carBrand) {
  if (carBrand == null || carBrand.name.isEmpty) {
    return StringsManager.selectCar;
  }
  return "${carBrand.name} ${carBrand.selectedModel.name}";
}

String carInfoBuilderListedCar(CarEntity car) {
  return "${car.brand} ${car.model} ${car.version} ${car.year} ${car.getCarKM(withDot: true)}";
}
