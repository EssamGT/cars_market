import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/one_selected_button.dart';

class FilterPaintConditionWidget extends StatelessWidget {
  const FilterPaintConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return OneSelectedButton<PaintConditions>(
      label: StringsManager.paintConditionLabel,
      currentValue: cubit.searchModel.paintCondition ,
      values: PaintConditions.values,
      spacing: AppSize.s8,
      labelBuilder: (e) => e.getPaintConditionText(true),
      padding: EdgeInsets.only(bottom: AppPadding.p10),
      onSelected: (value) {
        cubit.setPaintCondition(value);
      },
    );
  }
}
