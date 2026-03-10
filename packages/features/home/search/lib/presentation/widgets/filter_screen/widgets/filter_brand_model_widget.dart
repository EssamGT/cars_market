import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/brands.dart';
import 'package:data/models/car/brands_models/car_models.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/selection_page_button.dart';
import 'package:shared_ui/shared_widgets/car_listing_card/brand_logo_builder.dart';

class FilterBrandModelWidget extends StatelessWidget {
  const FilterBrandModelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return SelectionPageButtonCar<CarBrand, CarModel>(
      values: cubit.carCatalog,
      secondPageValues: (CarBrand car) => car.forFilter(),
      currentValue: cubit.searchModel.brand,
      current2Value: cubit.searchModel.brand.selectedModel,
      filter: true,
      isSelected: (CarBrand car) {
        return cubit.searchModel.brand.name == car.name;
      },
      isSelected2: (CarModel model) {
        return cubit.searchModel.brand.selectedModel.name == model.name &&
            cubit.searchModel.brand.id == model.brandId;
      },
      dialogAppBarTitle: StringsManager.selectBrand,
      search: true,
      labelBuilder: (CarBrand car) => car.name,
      secondPageLabelBuilder: (CarModel model) => model.name,
      secondPageDialogAppBarTitle: StringsManager.selectModel,

      leadingBuilder: (CarBrand car) => BrandLogoBuilder(url: car.logoUrl),
      onlyInPageLeading: false,
      // onSelected: (CarBrandFilter car, field) {
      //   print(field.value?.name);
      //   print(field.value?.selectedModel.name);
      // },
      emptyPage: StringsManager.brandNotFound,
      secondPageEmptyPage: StringsManager.modelNotFound,
      hint: StringsManager.selectCar,
      label: StringsManager.selectCar,
      buttonLabelBuilder: (CarBrand car) => carInfoBuilderFilter(car),
      onSelected: (CarBrand brand, field) {
        cubit.setCarBrand(brand);
        field.didChange(brand);
      },
      onSecondPageSelected: (brand, model, field) {
        final lastBrand = CarBrand(
          id: brand.id,
          name: brand.name,
          models: brand.models,
          selectedModel: model,
        );
        cubit.setCarModel(model);
        field.didChange(lastBrand);
      },
      onExit: (field) {
        // field.validate();
      },
    );
  }
}
