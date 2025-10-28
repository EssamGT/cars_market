import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/fuel_type.dart';
import 'package:data/models/car/brands_models/gearbox_type.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class FuelGearType extends StatelessWidget {
  const FuelGearType({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFieldButton(
          width: screenSize.width / 2.4,
          cubit: getIt.get<AddCubit>(),
          givenList: fuelTypes,
          title: StringsManager.fuelType,
          inPageTitle: StringsManager.fuelTypes,
          type: TextFieldButtonType.fuelType,
          validationType: TextFieldValidationType.fuelType,
        ),
        TextFieldButton(
          width: screenSize.width / 2.4,
          cubit: getIt.get<AddCubit>(),
          givenList: gearboxTypes,
          title: StringsManager.gearboxType,
          inPageTitle: StringsManager.gearboxTypes,
          type: TextFieldButtonType.gearboxType,
          validationType: TextFieldValidationType.gearboxType,
        ),
      ],
    );
  }
}
