import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/buttons/selection_page_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class PaintColorWidget extends StatelessWidget {
  const PaintColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    SellCubit cubit = getIt.get<SellCubit>();
    return SelectionPageButton<PaintColors>(
      values: PaintColors.values
          .where((e) => e != PaintColors.none)
          .toList(),
      currentValue: cubit.car.paintColor,
      dialogAppBarTitle: StringsManager.selectePaintColor,
      emptyPage: StringsManager.noPaintColorsFound,
      hint: StringsManager.selectePaintColor,
      label: StringsManager.paintColorLabel,
      onSelected: (PaintColors color) => cubit.setPaintColor(color),
      search: true,
      labelBuilder: (e) => e.getColorName(),
      leadingBuilder: (PaintColors e) => Container(
        width: AppSize.s25,
        height: AppSize.s25,
        decoration: BoxDecoration(
          color: e.getColor(),
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: AppSize.s0_5,
          ),
        ),
        child: e == PaintColors.none
            ? Icon(
                Icons.question_mark,
                color: Theme.of(context).colorScheme.onError,
              )
            : null,
      ),
      validator: (value) => TextFieldValidator.validateNormal(
        TextFieldValidationType.paintColor,
        value?.getColorName() ?? "",
      ),
      
    );
  }
}
