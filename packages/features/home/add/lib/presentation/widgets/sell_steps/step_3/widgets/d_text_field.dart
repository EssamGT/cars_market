import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class DTextField extends StatelessWidget {
  const DTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      car: getIt.get<AddCubit>().car,
      type: TextFieldUploadCarType.discription,
      title: StringsManager.description,
      minLiens: 5,
      // hint: StringsManager.descriptionHint,
      validationType: TextFieldValidationType.description,
      counter: true,
      format: false,
      maxLength: 1000,
    );
  }
}
