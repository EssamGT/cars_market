import 'package:add/presentation/widgets/controller/sell_steps_controller.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/widgets/body_type.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/widgets/fuel_gear_type.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/widgets/interior_text_field.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/widgets/mileage_text_field.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/widgets/modifcations_text_feild.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/widgets/paint_c_c.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/widgets/safety_options.dart';
import 'package:add/presentation/widgets/sell_steps/step_2/widgets/service_history_text_feild.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  late SellStepsController controller;
  @override
  void initState() {
    controller = Get.put(SellStepsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Column(
        key: ValueKey('step_2'),
        spacing: AppSize.s10,
        children: [
          BodyType(),
          FuelGearType(),
          MileageTextField(),
          PaintCC(),
          InteriorTextField(),
          SafetyOptions(),
          ServiceHistoryTextFeild(),
          ModifcationsTextFeild(),
        ],
      ),
    );
  }
}
