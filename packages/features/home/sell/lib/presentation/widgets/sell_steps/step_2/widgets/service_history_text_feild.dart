import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';

class ServiceHistoryTextFeild extends StatelessWidget {
  const ServiceHistoryTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalTextFieldUploadCar(
      car: getIt.get<SellCubit>().car,
      hint: StringsManager.serviceHistoryHint,
      type: TextFieldUploadCarType.serviceHistory,
      title: StringsManager.serviceHistoryLabelSellCar,
      keybordType: TextInputType.text,
      minLiens: 3,
      format: false,
    );
  }
}
