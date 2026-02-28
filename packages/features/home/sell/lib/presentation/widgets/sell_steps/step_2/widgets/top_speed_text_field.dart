import 'package:flutter/material.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class TopSpeedTextField extends StatelessWidget {
  const TopSpeedTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      hint: StringsManager.topSpeedHint,
      car: getIt.get<SellCubit>().car,
      type: TextFieldUploadCarType.topSpeed,
      title: StringsManager.topSpeedLabel,
      validationType: TextFieldValidationType.topSpeed,
      keyboardType: TextInputType.number,
      maxLength: 3,
      prefixText: StringsManager.topSpeed,
    );
    
  }
}