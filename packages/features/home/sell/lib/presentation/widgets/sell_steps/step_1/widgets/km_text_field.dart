import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/text_field/normal_text_field.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class KmTextField extends StatelessWidget {
  const KmTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellCubit, SellState>(
      buildWhen: (previous, current) {
        if (current is NewCoditionSelected) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        var cubit = getIt.get<SellCubit>();

        if (cubit.car.carCondition == CarConditionType.newCar) {
          return SizedBox();
        }
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
      },
    );
  }
}
