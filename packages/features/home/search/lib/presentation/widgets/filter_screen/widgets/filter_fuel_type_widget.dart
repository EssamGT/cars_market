import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_text_field_button.dart';

class FilterFuelTypeWidget extends StatelessWidget {
  const FilterFuelTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterTextFieldButton(
      car: SearchScreenCubit.get(context).carFilterModel,
      title: StringsManager.dfuelType,
      type: FilterTextFieldButtonType.fuelType,
      givenList: fuelTypes,
      enable: true,
      inPageTitle: StringsManager.dfuelType,
    );
  }
}
