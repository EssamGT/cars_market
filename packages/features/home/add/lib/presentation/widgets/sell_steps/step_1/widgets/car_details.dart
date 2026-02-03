import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/car_condition_widget.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/car_selection_button.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = AddCubit.get(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Column(
        spacing: AppSize.s5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarSelectionButton(),
          CarConditionWidget(),
          NormalTextFieldUploadCar(
            car: cubit.car,
            hint: StringsManager.versionHint,
            type: TextFieldUploadCarType.version,
            title: StringsManager.versionLabel,
            validationType: TextFieldValidationType.version,
            format: false,
          ),
          NormalTextFieldUploadCar(
            car: cubit.car,
            hint: StringsManager.yearHint,
            type: TextFieldUploadCarType.year,
            title: StringsManager.yearLabel,
            validationType: TextFieldValidationType.year,
            keybordType: TextInputType.number,
            maxLength: 4,
            format: false,
          ),
        ],
      ),
    );
  }
}
