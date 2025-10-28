import 'package:add/presentation/widgets/sell_steps/step_1/widgets/Brand_model_button.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/year_text_field.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        spacing: AppSize.s20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.carDetails,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        
          BrandAndModelButton(),
          YearTextField(),
        ],
      ),
    );
  }
}



