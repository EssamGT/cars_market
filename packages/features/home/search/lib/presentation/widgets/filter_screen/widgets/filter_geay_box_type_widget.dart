import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/transmission_type.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_text_field_button.dart';

class FilterGearBoxTypeWidget extends StatelessWidget {
  const FilterGearBoxTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterTextFieldButton(
      title: StringsManager.dgearboxType,
      type: FilterTextFieldButtonType.gearboxType,
      car: SearchScreenCubit.get(context).carFilterModel,
      givenList: filterGearboxTypes,
      enable: true,
      inPageTitle: StringsManager.transmissionTypes,
    );
  }
}
