import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:data/models/car/brands_models/body_types.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/text_field_button.dart';
import 'package:shared_ui/shared_widgets/text_field/validate/text_filed_validate.dart';

class BodyType extends StatelessWidget {
  const BodyType({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldButton(
      cubit: getIt.get<AddCubit>(),
      givenList: carBodyTypes,
      title: StringsManager.bodyType,
      inPageTitle: StringsManager.bodyTypes,
      type: TextFieldButtonType.bodyType,
      validationType: TextFieldValidationType.bodyType,
    );
  }
}
