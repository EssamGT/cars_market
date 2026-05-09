import 'package:cars_market/di/di.dart';
import 'package:data/models/car/brands_models/car_catalog.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:flutter/material.dart';

import 'package:shared_ui/shared_widgets/buttons/selection_page_button.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/brand_logo_builder.dart';
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

  final CarCatalogModel carCatalog = getIt.get<PrefsHelper>().getCarCatalog();

  @override
  Widget build(BuildContext context) {
    SellCubit cubit = SellCubit.get(context);
    return SelectionPageButtonCar<CarBrand, CarModel>(
      values: carCatalog.brands,
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

      leadingBuilder: (CarBrand car) => BrandLogoBuilder(url: car.logoUrl),
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
  
      validator: (car) => TextFieldValidator.validateNormal(
        TextFieldValidationType.car,

        car?.selectedModel.name ?? '',
      ),
    );
  }
}

