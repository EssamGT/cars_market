import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      car: getIt.get<SellCubit>().car,
      type: TextFieldUploadCarType.description,
      title: StringsManager.description,
      minLiens: 5,
      // hint: StringsManager.descriptionHint,
      validationType: TextFieldValidationType.description,
      counter: true,
      format: false,
      maxLength: 1000,
      keybordType: TextInputType.multiline,
    );
  }
}
