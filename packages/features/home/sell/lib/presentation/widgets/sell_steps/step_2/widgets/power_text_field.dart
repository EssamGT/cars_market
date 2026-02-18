import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class PowerTextField extends StatelessWidget {
  const PowerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      hint: StringsManager.hpHint,
      car: getIt.get<SellCubit>().car,
      type: TextFieldUploadCarType.hp,
      title: StringsManager.hpLable,
      validationType: TextFieldValidationType.hp,
      keybordType: TextInputType.number,
      maxLength: 4,
      prefixText: StringsManager.hp,
    );
  }
}
