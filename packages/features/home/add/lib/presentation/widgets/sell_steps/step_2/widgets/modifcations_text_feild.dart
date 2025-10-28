import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';

class ModifcationsTextFeild extends StatelessWidget {
  const ModifcationsTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      car: getIt.get<AddCubit>().car,

      hint: StringsManager.modifcationsHint,
      type: TextFieldUploadCarType.modifications,
      title: StringsManager.modifcations,
      keybordType: TextInputType.text,
      minLiens: 3,
      format: false,
    );
  }
}
