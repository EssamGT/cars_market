import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:flutter/material.dart';
import 'package:search/presentation/cubit/search_screen_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/selection_page_button.dart';

class FilterColorWidget extends StatelessWidget {
  const FilterColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenCubit cubit = SearchScreenCubit.get(context);
    return SelectionPageButton<PaintColors>(
      values: PaintColors.values,
      currentValue: cubit.searchModel.paintColor,
      search: true,
      dialogAppBarTitle: StringsManager.selectPaintColor,
      emptyPage: StringsManager.noPaintColorsFound,
      hint: StringsManager.selectPaintColor,
      label: StringsManager.paintColorLabel,
      onSelected: (PaintColors paintColor) => cubit.setPaintColor(paintColor),

      labelBuilder: (e) => e.getColorName(true),
      leadingBuilder: (e) {
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: e.getColor(),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
        );
      },
    );
  }
}
