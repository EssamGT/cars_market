import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_text_field_button.dart';

class FilterPaintConditionWidget extends StatelessWidget {
  const FilterPaintConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterTextFieldButton(
      title: StringsManager.dPaintCondition,
      type: FilterTextFieldButtonType.paintCondition,
      car: SearchScreenCubit.get(context).carFilterModel,
      givenList: paintConditions,
      enable: true,
      inPageTitle: StringsManager.paintConditions,
    );
  }
}
