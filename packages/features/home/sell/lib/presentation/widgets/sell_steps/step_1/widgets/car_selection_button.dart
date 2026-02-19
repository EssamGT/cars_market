import 'package:cars_market/di/di.dart';
import 'package:data/models/car/brands_models/car_catalog.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:flutter/material.dart';

import 'package:shared_ui/shared_widgets/buttons/new_selection_page_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';
import 'package:storage/cache/prefs_helper.dart';

class CarSelectionButton extends StatelessWidget {
  CarSelectionButton({super.key});
  String? validator(CarBrand? carBrand) {
    return TextFieldValidator.validateNormal(
      TextFieldValidationType.car,
      carBrand?.selectedModel.id ?? "",
    );
  }

  final CarCatalogModel? carCatalog = getIt.get<PrefsHelper>().getCarCatalog();

  @override
  Widget build(BuildContext context) {
    SellCubit cubit = SellCubit.get(context);
    return NewSelectionPageButtonCar<CarBrand, CarModel>(
      values: carCatalog?.brands ?? CarCatalog.brands,
      secondPageValues: (CarBrand car) => car.models,
      currentValue: cubit.car.brand,
      current2Value: cubit.car.brand.selectedModel,
      isSelected: (CarBrand car) {
        return cubit.car.brand.id == car.id;
      },
      isSelected2: (CarModel model) {
        return cubit.car.brand.selectedModel.id == model.id;
      },
      dialogAppBarTitle: StringsManager.selectBrand,
      search: true,
      labelBuilder: (CarBrand car) => car.name,
      secondPageLabelBuilder: (CarModel model) => model.name,
      secondPageDialogAppBarTitle: StringsManager.selectModel,

      leadingBuilder: (CarBrand car) => brandLogoBuilder(car, context),
      onlyInPageLeading: false,
      // onSelected: (CarBrand car, field) {
      //   print(field.value?.name);
      //   print(field.value?.selectedModel.name);
      // },
      emptyPage: StringsManager.brandNotFound,
      secondPageEmptyPage: StringsManager.modelNotFound,
      hint: StringsManager.selectCar,
      label: StringsManager.selectCar,
      buttonLabelBuilder: (CarBrand car) => carInfoBuilder(car),
      onSecondPageSelected: (brand, model, field) {
        final lastBrand = CarBrand(
          id: brand.id,
          name: brand.name,
          models: brand.models,
          selectedModel: model,
        );
        cubit.setCarBrand(lastBrand);
        field.didChange(lastBrand);
      },
      onExit: (field) {
        field.validate();
      },
      secondPageCurrentValue: cubit.car.brand.selectedModel,
      validator: (car) => TextFieldValidator.validateNormal(
        TextFieldValidationType.car,

        car?.selectedModel.name ?? '',
      ),
    );
  }
}

Widget brandLogoBuilder(CarBrand carBrand, BuildContext context) {
  return carBrand.logoUrl.isNotEmpty
      ? Container(
          width: AppSize.s40,
          height: AppSize.s40,
          alignment: Alignment.center,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: CachedNetworkImage(
            imageUrl: carBrand.logoUrl,
            fit: BoxFit.contain,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        )
      : Container(
          width: AppSize.s35,
          height: AppSize.s35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: const Icon(Icons.directions_car),
        );
}

String carInfoBuilder(CarBrand? carBrand) {
  if (carBrand == null ||
      carBrand.name.isEmpty ||
      carBrand.selectedModel.name.isEmpty) {
    return StringsManager.selectCar;
  }
  return "${carBrand.name} ${carBrand.selectedModel.name}";
}
