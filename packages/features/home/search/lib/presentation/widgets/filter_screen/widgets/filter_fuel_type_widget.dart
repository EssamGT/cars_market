import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/one_selected_button.dart';

class FilterFuelTypeWidget extends StatelessWidget {
  const FilterFuelTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return OneSelectedButton<FuelType>(
      label: StringsManager.fuelTypeLabel,
      currentValue: cubit.searchModel.fuelType ,
      values: FuelType.values,
      spacing: AppSize.s8,
      labelBuilder: (e) => e.getFuelTypeNameForFilter(),
      padding: EdgeInsets.only(bottom: AppPadding.p10),
      onSelected: (value) {
        cubit.setFuelType(value);
      },
    );
  }
}
