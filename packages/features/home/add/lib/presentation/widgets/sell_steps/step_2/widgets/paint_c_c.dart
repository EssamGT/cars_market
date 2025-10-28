import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/paint_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class PaintCC extends StatelessWidget {
  const PaintCC({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFieldButton(
          cubit: getIt.get<AddCubit>(),
          width: screenSize.width / 2.4,
          givenList: basePaintColors,
          title: StringsManager.paintColor,
          inPageTitle: StringsManager.paintColors,
          type: TextFieldButtonType.paintColor,
          validationType: TextFieldValidationType.paintColor,
        ),
        TextFieldButton(
          cubit: getIt.get<AddCubit>(),
          width: screenSize.width / 2.4,
          givenList: paintConditions,
          title: StringsManager.paintCondition,
          inPageTitle: StringsManager.paintConditions,
          type: TextFieldButtonType.paintCondition,
          validationType: TextFieldValidationType.paintCondition,
        ),
      ],
    );
  }
}
