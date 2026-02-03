import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/engine_spec.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_field_validate.dart';

class EngineSpec extends StatelessWidget {
  const EngineSpec({super.key});

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
          givenList: engineCylinderNumber,
          hintText: StringsManager.cylinder,
          title: StringsManager.cylinderNumber,
          inPageTitle: StringsManager.dCylinderNumber,
          type: TextFieldButtonType.engineCylinderNumber,
          validationType: TextFieldValidationType.engineCylinderNumber,
        ),
        TextFieldButton(
          width: screenSize.width / 2.4,
          cubit: getIt.get<AddCubit>(),
          givenList: engineCapacity,
          title: StringsManager.engineCapacity,
          hintText: StringsManager.cc,
          inPageTitle: StringsManager.dEngineCapacity,
          type: TextFieldButtonType.engineCapacity,
          validationType: TextFieldValidationType.engineCapacity,
        ),
      ],
    );
  }
}
