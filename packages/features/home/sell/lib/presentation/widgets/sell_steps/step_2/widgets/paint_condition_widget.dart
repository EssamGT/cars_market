import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/buttons/new_one_selected_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class PaintConditionWidget extends StatelessWidget {
  const PaintConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SellCubit cubit = getIt<SellCubit>();
    return NewOneSelectedButton<PaintConditions>(
      label: StringsManager.paintConditionLabel,
      currentValue: cubit.car.paintCondition,
      values: PaintConditions.values
          .where((e) => e != PaintConditions.none)
          .toList(),
      labelBuilder: (e) => e.getPaintConditionText(),
      onSelected: (value) {
        cubit.setPaintCondition(value);
      },
      validator: (value) => TextFieldValidator.validateNormal(
        TextFieldValidationType.paintCondition,
        value?.getPaintConditionText() ?? "",
      ),
    );
  }
}
