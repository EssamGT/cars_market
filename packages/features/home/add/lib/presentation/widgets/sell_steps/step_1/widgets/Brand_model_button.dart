import 'package:add/presentation/cubit/add_cubit.dart';
import 'package:cars_market/di/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_ui/shared_widgets/text_field/brand_model_button.dart';

class BrandAndModelButton extends StatelessWidget {
  const BrandAndModelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldButtonBrandAndModel(cubit: getIt.get<AddCubit>());
  }
}
