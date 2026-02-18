import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:flutter/material.dart';
import 'package:sell/presentation/cubit/sell_cubit.dart';
import 'package:shared_ui/shared_widgets/buttons/new_one_selected_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class FuelTypeWidget extends StatelessWidget {
  const FuelTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SellCubit cubit = getIt<SellCubit>();
    return NewOneSelectedButton<FuelType>(
      label: StringsManager.fuelTypeLabel,
      currentValue: cubit.car.engineSpec.fuelType,
      values: FuelType.values.where((e) => e != FuelType.none).toList(),
      labelBuilder: (e) => e.getFuelTypeName(),
      padding: EdgeInsets.only(bottom: AppPadding.p10),
      onSelected: (value) {
        cubit.setFuelType(value);
      },
      validator: (value) => TextFieldValidator.validateNormal(
        TextFieldValidationType.fuelType,
        value?.getFuelTypeName() ?? "",
      ),
        
    );
  }
}
