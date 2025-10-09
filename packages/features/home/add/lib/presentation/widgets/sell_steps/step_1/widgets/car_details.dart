import 'package:add/presentation/widgets/controller/sell_steps_controller.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/brand_button.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/model_button.dart';
import 'package:add/presentation/widgets/sell_steps/step_1/widgets/year_text_field.dart';
import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({super.key});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  late SellStepsController controller;
  @override
  void initState() {
    controller = Get.put(SellStepsController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Form(
        key: controller.key,
        child: Column(
          spacing: AppSize.s20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.carDetails,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            BrandButton(),
            ModelButton(),
            YearTextField(),
          ],
        ),
      ),
    );
  }
}



