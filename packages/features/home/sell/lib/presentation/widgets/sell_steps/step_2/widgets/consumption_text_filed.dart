import 'package:flutter/material.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class FuelConsumptionTextField extends StatelessWidget {
  const FuelConsumptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      hint: StringsManager.fuelConsumptionHint,
      car: getIt.get<SellCubit>().car,
      type: TextFieldUploadCarType.fuelConsumption,
      title: StringsManager.fuelConsumptionLabel,
      validationType: TextFieldValidationType.fuelConsumption,
      keybordType: TextInputType.number,
      maxLength: 3,
      prefixText: StringsManager.fuelConsumption,
      format: false,
    );
  }
}
