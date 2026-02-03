import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/filter_text_field_button.dart';

class FilterColorWidget extends StatelessWidget {
  const FilterColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterTextFieldButton(
      title: StringsManager.dPaintColor,
      type: FilterTextFieldButtonType.paintColor,
      car: SearchScreenCubit.get(context).carFilterModel,
      givenList: basePaintColors,
      enable: true,
      inPageTitle: StringsManager.paintColors,
    );
  }
}
