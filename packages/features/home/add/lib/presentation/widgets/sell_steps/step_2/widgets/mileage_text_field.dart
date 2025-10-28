import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class MileageTextField extends StatelessWidget {
  const MileageTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      hint: StringsManager.mileageHint,
      car: getIt.get<AddCubit>().car,
      type: TextFieldUploadCarType.mileage,
      title: StringsManager.mileage,
      validationType: TextFieldValidationType.mileage,
      keybordType: TextInputType.number,
      maxLength: 9,
    );
  }
}
