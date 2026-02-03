import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class PriceTextField extends StatelessWidget {
  const PriceTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      car: getIt.get<AddCubit>().car,
      title: StringsManager.price,
      type: TextFieldUploadCarType.price,
      // hint: StringsManager.priceHint,
      keybordType: TextInputType.number,
      format: true,
      validationType: TextFieldValidationType.price,
      price: true,
    );
  }
}
