import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/car_condition.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/one_selected_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class CarConditionWidget extends StatelessWidget {
  const CarConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SellCubit cubit = getIt<SellCubit>();
    return OneSelectedButton<CarConditionType>(
      label: StringsManager.carConditionLabel,
      currentValue: cubit.car.carCondition,
      values: CarConditionType.values
          .where((e) => e != CarConditionType.none)
          .toList(),
      labelBuilder: (e) => e.getConditionText(),
      onSelected: (value) => cubit.setCarConditionType(value),
      validator: (value) => TextFieldValidator.validateNormal(
        TextFieldValidationType.carCondition,
        value?.getConditionText() ?? '',
      ),
    );
  }
}
