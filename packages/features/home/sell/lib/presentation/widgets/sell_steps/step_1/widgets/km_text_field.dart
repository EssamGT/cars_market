import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class KmTextField extends StatelessWidget {
  const KmTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      hint: StringsManager.kmHint,
      car: getIt.get<SellCubit>().car,
      type: TextFieldUploadCarType.km,
      title: StringsManager.kmLable,
      validationType: TextFieldValidationType.km,
      keybordType: TextInputType.number,
      maxLength: 8,
      prefixText: StringsManager.km,
    );
  }
}
